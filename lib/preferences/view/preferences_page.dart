import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:respiro/preferences/cubit/preferences_cubit.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const PreferencesPage());
  }

  @override
  Widget build(BuildContext context) {
    return const PreferencesView();
  }
}

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  void onCustomThemeToggled(BuildContext context, bool isEnabled) {
    if(isEnabled) {
      context.read<PreferencesCubit>().onCustomThemeEnabled();  
    }
    else {
      context.read<PreferencesCubit>().onCustomThemeDisabled();
    }
  }

  void onThemeModeChanged(BuildContext context, ThemeMode mode) {
    if(mode == ThemeMode.dark) {
      context.read<PreferencesCubit>().onDarkModeSelected();
    }
    else if(mode == ThemeMode.light) {
      context.read<PreferencesCubit>().onLightModeSelected();
    }
  }

  void onSoundToggled(BuildContext context, bool isEnabled) {
    context.read<PreferencesCubit>().onMutedToggled();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')), // LANGT
      body: BlocBuilder<PreferencesCubit, PreferencesState>(
        builder: (context, state) {
          bool customThemeEnabled = state.customThemeEnabled;
          return Center(
            child: ListView(
              children: [

                // Custom theme toggle
                SwitchListTile(
                  title: Text('Tema personalizado'), //LANGT
                  value: customThemeEnabled, 
                  onChanged: (value) => onCustomThemeToggled(context, value),
                ),

                // FIXME: No mostrar el selector de tema si el tema personalizado no está activado.
                // TODO: Agregar la opción de elegir un tema personalizado.
                // Theme selector
                ListTile(
                  enabled: customThemeEnabled,
                  enableFeedback: customThemeEnabled,
                  subtitle: ThemeSelector(
                    selected: state.themeMode,
                    onSelected: (mode) => onThemeModeChanged(context, mode),
                  ),
                ),

                // Sound toggle
                ListTile(
                  title: Text('Sonido'), // LANGT
                  trailing: Icon(
                    state.isMuted ? Icons.volume_off : Icons.volume_up,
                  ),
                  onTap: () => onSoundToggled(context, !state.isMuted),
                ),

                // Reset to defaults
                ListTile(
                  title: Text('Restablecer valores predeterminados'), // LANGT
                  trailing: Icon(Icons.restore),
                  onTap: () {
                    context.read<PreferencesCubit>().onResetToDefaults();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ThemeSelector extends StatelessWidget {

  final ThemeMode selected;
  final ValueChanged<ThemeMode> onSelected;

  const ThemeSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ThemeMode>(
      segments: [
        ButtonSegment(
          value: ThemeMode.light,
          label: const Text('Light'), // LANGT
        ),
        ButtonSegment(
          value: ThemeMode.dark,
          label: const Text('Dark'), // LANGT
        ),
      ],
      selected: {selected},
      onSelectionChanged: (selection) => onSelected(selection.first),
    );
  }
}
