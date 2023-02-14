import 'package:get_it/get_it.dart';
import 'package:time_tracking_app/data/repository_impl/TaskRepositoryImpl.dart';
import 'package:time_tracking_app/domain/use_cases/AddTaskUseCase/use_case/AddNewTaskUseCase.dart';

import '../../data/local/db/AppDb.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<AppDatabase>(
      await $FloorAppDatabase.databaseBuilder("database.db").build());

  //use_cases.

  injector.registerSingleton<AddNewTaskUseCase>(AddNewTaskUseCase(injector()));

  // Data - Local/Remote
  injector
      .registerSingleton<TaskRepositoryImpl>(TaskRepositoryImpl(injector()));
}
