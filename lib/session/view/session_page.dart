import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:respiro/session/widgets/widgets.dart';
import 'package:respiro/session/bloc/session_bloc.dart';
import 'package:respiro/session/audio_cubit/session_audio_cubit.dart';

import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/theme/theme.dart';

Color getStepColor(StepType type, BuildContext context) {
  switch (type) {
    case StepType.inhale:
      return Theme.of(context).extension<BreathingColors>()!.inhaleSurface!;
    case StepType.exhale:
      return Theme.of(context).extension<BreathingColors>()!.exhaleSurface!;
    case StepType.hold:
      return Theme.of(context).extension<BreathingColors>()!.holdSurface!;
  }
}

class SessionPage extends StatefulWidget {
  const SessionPage({
    required this.activeProfile,
    required this.sessionDuration,
    super.key,
  });

  final BreathingProfile activeProfile;
  final Duration sessionDuration;

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey _backgroundKey = GlobalKey();

  void _onPausedPressed(BuildContext context) {
    context.read<SessionBloc>().add(SessionPaused());
    _triggerBackgroundRipple(context: context, color: Colors.grey.shade300);
  }

  void _onResumedPressed(BuildContext context) {
    context.read<SessionBloc>().add(SessionResumed());
    _triggerBackgroundRipple(context: context, color: Colors.grey.shade300);
  }

  void _onCanceledPressed(BuildContext context) {
    context.read<SessionBloc>().add(SessionCanceled());
    //_triggerBackgroundRipple(context: context, color: Colors.grey.shade300);
  }

  void _onResetPressed(BuildContext context) {
    context.read<SessionBloc>().add(SessionReset());
    _triggerBackgroundRipple(
      context: context,
      color: Colors.lightBlueAccent,
    ); // TODO: Estandarizar colores
  }

  void _onSoundToggled(BuildContext context, bool value) {
    context.read<SessionAudioCubit>().toggleSound();
  }

  @override
  void initState() {
    super.initState();
    context.read<SessionBloc>().add(
      SessionStarted(
        profile: widget.activeProfile,
        sessionDuration: widget.sessionDuration,
      ),
    );
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        forceMaterialTransparency: true,
        elevation: 0,
        actions: [
          BlocBuilder<SessionAudioCubit, SessionAudioState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () => _onSoundToggled(context, state.isSoundDisabled),
                icon: Icon(state.isSoundDisabled ? Icons.volume_off : Icons.volume_up),
              );
            },
          ),
        ],
      ),
      body: BlocListener<SessionBloc, SessionState>(
        listenWhen: (prev, cur) {
          return prev.status != cur.status ||
              prev.currentStep != cur.currentStep;
        },
        listener: (context, state) {
          // TODO: Encapsular funcionamiento del controlador en funciones
          switch (state.status) {
            case SessionStatus.initial:
              break;

            case SessionStatus.reseted:
              if (_controller.isAnimating) {
                _controller.stop();
              }
              _controller.reset();
              _controller.duration = Duration(
                seconds: state.currentStep.duration.toInt(),
              );
              _controller.forward();
              break;

            case SessionStatus.resumed:
              {
                if (!_controller.isAnimating) {
                  _controller.forward();
                }
              }

            case SessionStatus.stepChanged:
              _controller.duration = Duration(
                seconds: state.currentStep.duration.toInt(),
              );
              _controller.reset();
              if (!_controller.isAnimating) {
                _controller.forward();
              }
              _triggerBackgroundRipple(
                context: context,
                color: getStepColor(state.currentStep.type, context),
              );
              break;

            case SessionStatus.paused:
              if (_controller.isAnimating) {
                _controller.stop();
              }
              break;

            case SessionStatus.canceled:
              if (_controller.isAnimating) {
                _controller.stop();
              }
              break;

            case SessionStatus.completed:
              break;
          }
        },
        child: Stack(
          children: [
            BlocBuilder<SessionBloc, SessionState>(
              builder: (context, state) {
                // TODO: mover calculos matematicos a state
                final remainingTime = state.sessionDuration - state.elapsedTime;
                final minutes = remainingTime.inMinutes
                    .remainder(60)
                    .toString()
                    .padLeft(2, '0');
                final seconds = remainingTime.inSeconds
                    .remainder(60)
                    .toString()
                    .padLeft(2, '0');
                final stepSecondsRemaining =
                    state.currentStep.duration -
                    state.elapsedTimeSinceLastStep.inSeconds;
                final isPaused = state.status == SessionStatus.paused;
                final backgroundColor = getStepColor(
                  state.currentStep.type,
                  context,
                );
                return Stack(
                  children: [
                    // Fondo de la sesión
                    SessionBackground(
                      backgroundColor: backgroundColor,
                      backgroundKey: _backgroundKey,
                    ),

                    // Contenido principal
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom:
                            160.0, // TODO: Ajustar según tamaño de la pantalla
                      ), // Espacio reservado para los controles inferiores
                      child: SessionBody(
                        minutes: minutes,
                        seconds: seconds,
                        step: state.currentStep,
                        stepSecondsRemaining: stepSecondsRemaining,
                        controller: _controller,
                      ),
                    ),

                    // Overlay del contenido
                    if (isPaused) PauseOverlay(),
                  ],
                );
              },
            ),

            // CAPA 3: Controles (Dock inferior)
            _ActionsContainer(
              actionButtons:
                  BlocSelector<SessionBloc, SessionState, SessionStatus>(
                    selector: (state) {
                      return state.status;
                    },
                    builder: (context, state) {
                      return SessionActionButtons(
                        isPaused: state == SessionStatus.paused,
                        onPaused: () => _onPausedPressed(context),
                        onResumed: () => _onResumedPressed(context),
                        onCanceled: () => _onCanceledPressed(context),
                        onReseted: () => _onResetPressed(context),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _triggerBackgroundRipple({
    required BuildContext context,
    Color color = Colors.white,
  }) {
    final RenderBox? bgBox =
        _backgroundKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? btnBox = context.findRenderObject() as RenderBox?;

    if (bgBox == null || btnBox == null) return;

    final Offset buttonCenterGlobal = btnBox.localToGlobal(
      btnBox.size.center(Offset.zero),
    );

    final Offset localPositionInBg = bgBox.globalToLocal(buttonCenterGlobal);

    final MaterialInkController inkController = Material.of(
      _backgroundKey.currentContext!,
    );

    InkRipple.splashFactory
        .create(
          controller: inkController,
          referenceBox: bgBox,
          position: localPositionInBg,
          color: color,
          textDirection: TextDirection.ltr,
          containedInkWell: true,
        )
        .confirm();
  }
}

class _ActionsContainer extends StatelessWidget {
  final Widget? actionButtons;

  const _ActionsContainer({super.key, required this.actionButtons});

  // TODO: Posicionamiento dinamico de los botones segun el tamaño de pantalla.
  // TODO: Asegurar que no solape con la barra de acciones de android.
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 80, // Margen desde abajo (ajusta a tu gusto)
      // SafeArea es vital para que no choque con la barra de gestos de iPhone/Android
      child: SafeArea(
        top: false, // No nos importa el notch de arriba
        child: actionButtons ?? Container(),
      ),
    );
  }
}
