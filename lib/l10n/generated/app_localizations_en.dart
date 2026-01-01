// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Respiro App';

  @override
  String get preferencesTooltip => 'Preferences';

  @override
  String get startSessionTooltip => 'Start breathing session';

  @override
  String get inhale => 'Inhale';

  @override
  String get exhale => 'Exhale';

  @override
  String get hold => 'Hold';

  @override
  String get paused => 'Paused';

  @override
  String get secondsAbbreviation => 's';

  @override
  String get noProfileSelected => 'No profile selected';

  @override
  String get pleaseSelectProfile => 'Please select a profile to view details';

  @override
  String get selectedProfileLabel => 'Selected Profile:';

  @override
  String get availableProfilesLabel => 'Available Profiles';

  @override
  String get preferencesTitle => 'Preferences';

  @override
  String get soundLabel => 'Sound';

  @override
  String get resetToDefaultsLabel => 'Reset to defaults';

  @override
  String get systemThemeLabel => 'System';

  @override
  String get selectThemeLabel => 'Select Theme';

  @override
  String get lightThemeLabel => 'Light';

  @override
  String get darkThemeLabel => 'Dark';

  @override
  String get timeRemainingLabel => 'Time remaining:';

  @override
  String get languageLabel => 'Language';

  @override
  String get spanishLanguageLabel => 'Spanish';

  @override
  String get englishLanguageLabel => 'English';
}
