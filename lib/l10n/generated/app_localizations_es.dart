// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Respiro App';

  @override
  String get preferencesTooltip => 'Ajustes';

  @override
  String get startSessionTooltip => 'Iniciar sesión de respiración';

  @override
  String get inhale => 'Inhala';

  @override
  String get exhale => 'Exhala';

  @override
  String get hold => 'Mantén';

  @override
  String get paused => 'Pausado';

  @override
  String get secondsAbbreviation => 's';

  @override
  String get noProfileSelected => 'No hay ningún perfil seleccionado';

  @override
  String get pleaseSelectProfile =>
      'Por favor seleccione un perfil para ver sus detalles';

  @override
  String get selectedProfileLabel => 'Perfil Seleccionado:';

  @override
  String get availableProfilesLabel => 'Perfiles Disponibles';

  @override
  String get preferencesTitle => 'Preferencias';

  @override
  String get soundLabel => 'Sonido';

  @override
  String get resetToDefaultsLabel => 'Restaurar valores de inicio';

  @override
  String get systemThemeLabel => 'Sistema';

  @override
  String get selectThemeLabel => 'Seleccionar Tema';

  @override
  String get lightThemeLabel => 'Claro';

  @override
  String get darkThemeLabel => 'Oscuro';

  @override
  String get timeRemainingLabel => 'Tiempo restante:';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get spanishLanguageLabel => 'Español';

  @override
  String get englishLanguageLabel => 'Inglés';
}
