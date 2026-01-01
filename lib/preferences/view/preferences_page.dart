import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:respiro/l10n/generated/app_localizations.dart';

import 'package:respiro/preferences/cubit/preferences_cubit.dart';
import 'package:respiro/theme/cubit/theme_cubit.dart';

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

  void _onThemeModeChanged(BuildContext context, ThemeMode mode) {
    context.read<PreferencesCubit>().onThemeModeChanged(mode);
    context.read<ThemeCubit>().updateThemeMode(mode);
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
          return Center(
            child: ListView(
              children: [

                // Custom theme toggle
                
                // TODO: Agregar la opción de elegir un tema personalizado.
                // Theme selector
                ListTile(
                  title: Text(lcl.selectThemeLabel),
                  titleAlignment: ListTileTitleAlignment.titleHeight,
                  enabled: true,
                  enableFeedback: false,
                  subtitle: ThemeSelector(
                    selected: state.themeMode,
                    onSelected: (mode) => _onThemeModeChanged(context, mode),
                  ),
                ),

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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SegmentedButton<ThemeMode>(
        segments: [
          ButtonSegment(
            value: ThemeMode.light,
            label: Text(lcl.lightThemeLabel),
          ),
          ButtonSegment(
            value: ThemeMode.dark,
            label: Text(lcl.darkThemeLabel),
          ),
          ButtonSegment(
            value: ThemeMode.system,
            label: Text(lcl.systemThemeLabel),
          ),
        ],
        selected: {selected},
        onSelectionChanged: (selection) => onSelected(selection.first),
      ),
    );
  }
}
