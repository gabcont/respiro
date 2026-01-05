import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:respiro/theme/theme.dart';
import 'package:respiro/routines/routines.dart';

/// Global access to the step being "played" at the chart playhead.
///
/// This intentionally avoids ValueNotifiers/streams; it is updated by
/// `PhasePreview` on every frame.
class PhasePreviewStepGlobals {
  static SequenceStep? currentStep;
  static SequenceStep? lastStep;
  static int currentSecond = 0;
}

class PhasePreview extends StatefulWidget {
  
  final Phase phase;
  
  const PhasePreview({
    super.key,
    required this.phase,
  });

  @override
  State<PhasePreview> createState() => _PhasePreviewState();
}

class _PhasePreviewState extends State<PhasePreview> with SingleTickerProviderStateMixin {

  late final AnimationController _scrollController;

  static const double _windowSeconds = 20.0;
  static const double minY = -3;
  static const double maxY = 3;

  // NOTE: The app requires 3 iterations by default for rendering.
  // `_loopRepeats` is kept as-is (legacy/unused for rendering).
  static const int _defaultRenderRepeats = 3;

  late final double _window;
  // OBSOLETE: kept for compatibility/debugging.
  late final double _phaseDuration;
  late final double _sequenceDuration;
  late List<SequenceStep> _steps;
  late double _cycleDuration;

  // OBSOLETE/DEBUG: retained for on-screen debug readout.
  double _currentSequenceTime = 0.0;

  late final double _effectiveWindow;
  late final List<FlSpot> _renderSpots;

  @override 
  void initState() {
    super.initState();
    _phaseDuration = widget.phase.totalDuration / 1000;
    _sequenceDuration = widget.phase.sequence!.totalDuration / 1000;

    _steps = _getStepsInPhase(widget.phase, _sequenceDuration.toInt());
    _window = _windowSeconds;

    _renderSpots = _buildWrappedSpots(
      widget.phase.sequence!,
      repeats: _defaultRenderRepeats,
    );

    // Show a reasonable window without letting it define speed.
    // Keep it smaller than the whole sequence so movement is perceptible.
    _effectiveWindow = _computeEffectiveWindow(
      windowSeconds: _window,
      sequenceDurationSeconds: _sequenceDuration,
    );

    // Animation should traverse `_defaultRenderRepeats` cycles before resetting.
    // We animate the left edge (minX) from 0 -> totalDuration-window so that
    // the playhead (center) moves in real seconds.
    final totalDuration = _sequenceDuration * _defaultRenderRepeats;
    _cycleDuration = math.max(0.001, totalDuration - _effectiveWindow);
    
    _scrollController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (_cycleDuration * 1000).round()),
    )..repeat();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, _) {
        final double startX = _scrollController.value * _cycleDuration;
        final double playheadSeconds = startX + (_effectiveWindow / 2);
        final double minX = startX;
        final double maxX = startX + _effectiveWindow;

        final int secondIndex = _steps.isEmpty
          ? 0
          : (playheadSeconds.floor() % _steps.length)
            .clamp(0, _steps.length - 1);

        final SequenceStep currentStep = _steps.isNotEmpty
            ? _steps[secondIndex]
            : SequenceStep(type: StepType.meditate, stepDuration: 1000);

        PhasePreviewStepGlobals.currentSecond = secondIndex;
        PhasePreviewStepGlobals.currentStep = currentStep;
        PhasePreviewStepGlobals.lastStep = _steps.isNotEmpty ? _steps.last : currentStep;

        final gradient = _lineGradient(context, currentStep.type);

        return Column(
          children: [
            /* Text(
              '${secondIndex}  t=${_currentSequenceTime.toStringAsFixed(2)}s / ${_phaseDuration.toStringAsFixed(0)}s',
            ), */
            Expanded(
              child: LineChart(
                LineChartData(
                  clipData: FlClipData.all(),
                  minX: minX,
                  maxX: maxX,
                  minY: minY,
                  maxY: maxY,

                  // GridLines
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    drawHorizontalLine: true,
                    horizontalInterval: 4,
                    verticalInterval: 4,
                  ),
                  extraLinesData: ExtraLinesData(
                    verticalLines: [
                      VerticalLine(
                        x: playheadSeconds,
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(100), 
                        strokeWidth: 1, 
                        dashArray: [5, 5],
                      ),
                    ],
                  ),


                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                      axisNameSize: 40,
                      axisNameWidget: Text( // LCL
                        switch (currentStep.type) {
                          StepType.inhale => 'Inhale',
                          StepType.exhale => 'Exhale',
                          StepType.hold => 'Hold',
                          StepType.meditate => 'Meditate',
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(enabled: false),

                  // Line data
                  lineBarsData: [
                    LineChartBarData(
                      spots: _renderSpots,
                      gradientArea: LineChartGradientArea.wholeChart,
                      gradient: gradient,
                      isCurved: true,
                      curveSmoothness: 0.15,
                      barWidth: 6,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  double _computeEffectiveWindow({
    required double windowSeconds,
    required double sequenceDurationSeconds,
  }) {
    // If window covers the whole sequence, panning looks static.
    // Keep some headroom so movement is always visible.
    final maxWindow = math.max(1.0, sequenceDurationSeconds * 0.85);
    final clamped = math.min(windowSeconds, maxWindow);
    // Don't show an unreasonably small window.
    return math.max(6.0, math.min(clamped, sequenceDurationSeconds));
  }

  List<FlSpot> _buildWrappedSpots(EmbeddedSequence sequence, {required int repeats}) {
    final base = _buildSpots(sequence, 1);
    if (base.isEmpty) return const <FlSpot>[];

    final cycle = base.last.x;
    if (cycle <= 0) return base;

    // Exactly `repeats` cycles, plus a negative copy for seamless viewport wrap.
    // Example (repeats=3): [-D..0] + [0..D] + [D..2D]
    final offsets = <int>[-1];
    for (var i = 0; i < repeats; i++) {
      offsets.add(i);
    }

    final out = <FlSpot>[];
    for (final o in offsets) {
      final dx = cycle * o;
      final startIndex = o == -1 ? 0 : 1; // avoid seam duplication for non-negative cycles
      for (var j = startIndex; j < base.length; j++) {
        final s = base[j];
        out.add(FlSpot(s.x + dx, s.y));
      }
    }
    return out;
  }

  List<SequenceStep> _getStepsInPhase(Phase phase, int sequenceDurationInSeconds) {
    List<SequenceStep> steps = [];
    for(var step in phase.sequence!.steps) {
      // add as many times the same step as seconds the step lasts
      steps.addAll(List<SequenceStep>.filled(
        (step.stepDuration / 1000).round(), 
        step,
      ));
    }
    return steps;
  }

  List<FlSpot> _buildSpots(EmbeddedSequence sequence, int repeats) {
    final spots = <FlSpot>[const FlSpot(0, 0)];
    double yValue = 0.0;

    for(var i = 0; i < repeats; i++) {
      for (final step in sequence.steps) {
        final lastSpot = spots.last;
        final stepDurationSeconds = step.stepDuration / 1000;
        
        switch (step.type) {
          case StepType.inhale:
            yValue = 2.0;
            break;
          case StepType.exhale:
            yValue = -2.0;
            break;
          case StepType.hold:
            yValue = lastSpot.y;
            break;
          case StepType.meditate:
            yValue = 0.0;
            break;
        }

        spots.add(FlSpot(lastSpot.x + stepDurationSeconds, yValue));
      }
    }

    return spots;
  }

  LinearGradient _lineGradient(BuildContext context, StepType stepType) {

    final breathing = Theme.of(context).extension<BreathingColors>();
    final scheme = Theme.of(context).colorScheme;

    final Color trailColor = Colors.transparent;
    final Color typeColor = switch (stepType) {
      StepType.inhale => breathing?.inhalePrimary ?? scheme.primary,
      StepType.exhale => breathing?.exhalePrimary ?? scheme.secondary,
      StepType.hold => breathing?.holdPrimary ?? scheme.tertiary,
      StepType.meditate => breathing?.meditatePrimary ?? scheme.primary,
    };

    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        trailColor,
        typeColor,
        typeColor, 
        trailColor
      ],
      stops: [
        0.0,
        0.25,
        0.75, 
        1.0
      ],
    );
  }

}
