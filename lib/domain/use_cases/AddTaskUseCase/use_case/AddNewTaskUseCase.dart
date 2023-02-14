import 'package:flutter/foundation.dart';
import 'package:time_tracking_app/domain/model/Task.dart';
import 'package:time_tracking_app/domain/repository/TaskRepository.dart';

import '../../../../common/custom_function.dart';
import '../../../../core/ErrorResponse.dart';
import '../../../../core/data_state.dart';
import '../../../../core/use_case.dart';

class AddNewTaskUseCase
    implements UseCase<DataState<List<TaskModel>>, AddNewTaskParams> {
  final TaskRepository _taskRepository;

  AddNewTaskUseCase(this._taskRepository);

  @override
  Future<DataState<List<TaskModel>>> call(
      {required AddNewTaskParams params}) async {
    try {
      final response = await _taskRepository.hAddNewTask(params);
      return DataSuccess(response);
    } catch (e) {
      if (kDebugMode) {
        printLog(e.toString());
      }
      return DataFailed(
          ErrorResponse(message: '${e.toString()}', statusCode: 0));
    }
  }
}

class AddNewTaskParams {
  final String token;

  AddNewTaskParams(this.token);
}
