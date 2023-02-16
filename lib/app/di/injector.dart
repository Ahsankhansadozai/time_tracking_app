import 'package:get_it/get_it.dart';
import 'package:time_tracking_app/data/repository_impl/TaskRepositoryImpl.dart';
import 'package:time_tracking_app/domain/use_cases/AddTaskUseCase/use_case/AddNewTaskUseCase.dart';
import 'package:time_tracking_app/domain/use_cases/DeleteTaskUseCase/use_case/DeleteTaskUseCase.dart';
import 'package:time_tracking_app/domain/use_cases/FetchAllTaskUseCase/FetchAllTaskUseCase.dart';

import '../../data/local/db/AppDb.dart';
import '../../domain/repository/TaskRepository.dart';
import '../../domain/use_cases/UpdateTaskUseCase/use_case/UpdateExistingUseCase.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<AppDatabase>(
      await $FloorAppDatabase.databaseBuilder("database.db").build());

  // Data - Local/Remote
  injector.registerSingleton<TaskRepository>(TaskRepositoryImpl(injector()));

  //use_cases.
  injector.registerSingleton<AddNewTaskUseCase>(AddNewTaskUseCase(injector()));
  injector
      .registerSingleton<FetchAllTaskUseCase>(FetchAllTaskUseCase(injector()));

  injector.registerSingleton<DeleteTaskUseCase>(DeleteTaskUseCase(injector()));
  injector.registerSingleton<UpdateTaskUseCase>(UpdateTaskUseCase(injector()));
}
