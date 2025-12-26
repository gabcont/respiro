import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:respiro/l10n/generated/app_localizations.dart';

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

  void _onCustomThemeToggled(BuildContext context, bool isEnabled) {
    if(isEnabled) {
      context.read<PreferencesCubit>().onCustomThemeEnabled();  
    }
    else {
      context.read<PreferencesCubit>().onCustomThemeDisabled();
    }
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode mode) {
    if(mode == ThemeMode.dark) {
      context.read<PreferencesCubit>().onDarkModeSelected();
    }
    else if(mode == ThemeMode.light) {
      context.read<PreferencesCubit>().onLightModeSelected();
    }
  }

  void _onSoundToggled(BuildContext context, bool isEnabled) {
    context.read<PreferencesCubit>().onMutedToggled();
  }

  void _onLocaleChanged(BuildContext context, Locale? locale) {
    if(locale != null) {
      context.read<PreferencesCubit>().onLocaleChanged(locale);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lcl = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(lcl.preferencesTitle)),
      body: BlocBuilder<PreferencesCubit, PreferencesState>(
        builder: (context, state) {
          bool customThemeEnabled = state.customThemeEnabled;
          return Center(
            child: ListView(
              children: [

                // Custom theme toggle
                SwitchListTile(
                  title: Text(lcl.customThemeLabel),
                  value: customThemeEnabled, 
                  onChanged: (value) => _onCustomThemeToggled(context, value),
                ),

                // TODO: Agregar la opción de elegir un tema personalizado.
                // Theme selector
                customThemeEnabled ? ListTile(
                  enabled: customThemeEnabled,
                  enableFeedback: customThemeEnabled,
                  subtitle: ThemeSelector(
                    selected: state.themeMode,
                    onSelected: (mode) => _onThemeModeChanged(context, mode),
                  ),
                )
                : const SizedBox.shrink(),

                // Sound toggle
                ListTile(
                  title: Text(lcl.soundLabel),
                  trailing: Icon(
                    state.isMuted ? Icons.volume_off : Icons.volume_up,
                  ),
                  onTap: () => _onSoundToggled(context, !state.isMuted),
                ),

                // Language selector
                ListTile(
                  title: Text(lcl.languageLabel),
                  trailing: DropdownButton<Locale>(
                    icon: Icon(Icons.language),
                    underline: SizedBox.shrink(),
                    value: state.locale,
                    items: AppLocalizations.supportedLocales.map((locale) {
                      String languageLabel;
                      switch(locale.languageCode) {
                        case 'es':
                          languageLabel = lcl.spanishLanguageLabel;
                          break;
                        case 'en':
                          languageLabel = lcl.englishLanguageLabel;
                          break;
                        default:
                          languageLabel = locale.languageCode;
                      }
                      return DropdownMenuItem<Locale>(
                        value: locale,
                        child: Text(languageLabel),
                      );
                    }).toList(),
                    onChanged: (locale) => _onLocaleChanged(context, locale),
                  ),
                ),

                // Reset to defaults
                ListTile(
                  title: Text(lcl.resetToDefaultsLabel),
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
    final lcl = AppLocalizations.of(context)!;
    return SegmentedButton<ThemeMode>(
      segments: [
        ButtonSegment(
          value: ThemeMode.light,
          label: Text(lcl.lightThemeLabel),
        ),
        ButtonSegment(
          value: ThemeMode.dark,
          label: Text(lcl.darkThemeLabel),
        ),
      ],
      selected: {selected},
      onSelectionChanged: (selection) => onSelected(selection.first),
    );
  }
}
