import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:time_tracking_app/domain/use_cases/AddTaskUseCase/use_case/AddNewTaskUseCase.dart';

import '../../../app/di/injector.dart';
import '../../../common/custom_function.dart';
import '../../../core/data_state.dart';
import '../../../core/view_state.dart';
import '../../../domain/model/Task.dart';

const loginBusyKey = 'dashboard';

class DashBoardViewModel extends BaseViewModel {
  final AddNewTaskUseCase _addNewTaskUseCase = injector<AddNewTaskUseCase>();

  ViewState<List<TaskModel>> viewState =
      ViewState(state: ResponseState.LOADING);

  void _setViewState(ViewState<List<TaskModel>> viewState) {
    this.viewState = viewState;
    setBusyForObject(loginBusyKey, false);
  }

  // function to add New Task in Database
  Future<void> hAddNewTask() async {
    _setViewState(ViewState.loading());
    final response = await _addNewTaskUseCase.call(
        params: TaskModel(
            taskSerialNo: null,
            taskName: 'New Task',
            taskCreatedTime: '',
            taskStatus: null));
    if (response is DataSuccess) {
      if (response.data!.isEmpty) {
        _setViewState(ViewState.empty());
      } else {
        _setViewState(ViewState.complete(response.data ?? List.empty()));
      }
    }
    if (response is DataFailed) {
      if (kDebugMode) {
        printLog(response.error.toString());
      }
      _setViewState(ViewState.error(response.error?.message ?? "".toString()));
    }
  }

  hDeleteExistingTask(String id) {}

  hUpdateExistingTask() {}
}
