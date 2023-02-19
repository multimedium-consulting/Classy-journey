import "package:classy/config/constants/constants.dart";
import "package:classy/src/subjects/subject.dart";
import "package:get_it/get_it.dart";

import "datasources/app_database.dart";

final injector = GetIt.instance;

Future<void> setupInjection() async {
  //Init Database
  final database =
      await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);

  //Repositories
  injector.registerLazySingleton<ISubjectRepository>(
      () => SubjectRepository(injector<AppDatabase>()));
}
