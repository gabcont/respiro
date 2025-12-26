import 'dart:ui';

class RespiroLocales {
  List<Locale> get supportedLocales => const <Locale>[
        localeEs,
        localeEn,
      ];
  static const localeEs = Locale('es');
  static const localeEn = Locale('en');
}