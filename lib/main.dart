import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/app/app.dart';
import 'package:respiro/app/router/router.dart';

import 'package:respiro/app/impl/navigation_service/gorouter_navigation_service.dart';
import 'package:respiro/preferences/impl/repository/sp_preferences_repository_impl.dart';
import 'package:respiro/profiles/impl/datasources/isar/profiles_isar_datasource.dart';
import 'package:respiro/sound/impl/sound_service/soloud_sound_service.dart';
import 'package:respiro/profiles/impl/repositories/profiles_repository_impl.dart';


Future<void> main() async {

  // SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final preferencesRepository = SPPreferencesRepositoryImpl(preferencesRepository: sharedPreferences);

  // Isar Database initialization
  final isar = await initIsar();
  final ProfilesIsarDataSource isarApi = ProfilesIsarDataSource(isar);
  final profilesRepository = ProfilesRepositoryImpl(isarApi);

  // Navigation service initialization
  final respiroRouter = RespiroRouter();
  final goNavService  = GoRouterNavigationService(
    goRouter: respiroRouter.router,
    navigatorKey: respiroRouter.navigatorKey,
  );

  // Sound Service initialization
  final soloud = SoLoud.instance;
  await soloud.init();
  final soloudSoundService = SoloudSoundService(soloud: soloud, isMuted: await preferencesRepository.getIsMuted());

  runApp(
    App(
      appRouter: respiroRouter,
      preferencesRepository: preferencesRepository,
      profilesRepository: profilesRepository,
      navigationService: goNavService,
      soundService: soloudSoundService,
    ),
  );
}

Future<Isar> initIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  //print(dir.path);
  
  final isar = await Isar.open(
    [BreathingProfileSchema],
    directory: dir.path,
  );
  
  return isar;
}