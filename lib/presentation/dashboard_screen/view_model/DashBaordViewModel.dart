import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:time_tracking_app/domain/use_cases/AddTaskUseCase/use_case/AddNewTaskUseCase.dart';
import 'package:time_tracking_app/domain/use_cases/DeleteTaskUseCase/use_case/DeleteTaskUseCase.dart';

import '../../../app/di/injector.dart';
import '../../../common/custom_function.dart';
import '../../../core/data_state.dart';
import '../../../core/view_state.dart';
import '../../../domain/model/Task.dart';
import '../../../domain/use_cases/FetchAllTaskUseCase/FetchAllTaskUseCase.dart';

const loginBusyKey = 'dashboard';

class DashBoardViewModel extends BaseViewModel {
  final AddNewTaskUseCase _addNewTaskUseCase = injector<AddNewTaskUseCase>();
  final FetchAllTaskUseCase _fetchAllTaskUseCase =
      injector<FetchAllTaskUseCase>();
  final DeleteTaskUseCase _deleteTaskUseCase = injector<DeleteTaskUseCase>();

  ViewState<List<TaskModel>> viewState =
      ViewState(state: ResponseState.LOADING);

  void _setViewState(ViewState<List<TaskModel>> viewState) {
    this.viewState = viewState;
    notifyListeners();
    setBusyForObject(loginBusyKey, false);
  }

  // function to add New Task in Database
  Future<void> hAddNewTask(int status) async {
    _setViewState(ViewState.loading());
    await _addNewTaskUseCase.call(
        params: TaskModel(
            taskName: 'New Task',
            taskCreatedTime: hGetCurrentDateTime(),
            taskStatus: 1));
    hFetchAllTaskFromLocalDb();
  }

  hDeleteExistingTask(String id) {}

  hUpdateExistingTask() {}

  Future<void> hFetchAllTaskFromLocalDb() async {
    _setViewState(ViewState.loading());
    final response = await _fetchAllTaskUseCase.call(
        params: TaskModel(
            taskSerialNo: null,
            taskName: 'New Task',
            taskCreatedTime: '',
            taskStatus: null));
    if (response is DataSuccess) {
      printLog('Fetch all tasks : ${response.data?.length.toString()}');
      if (response.data == null) {
        _setViewState(ViewState.empty());
      } else {
        _setViewState(ViewState.complete((response.data!)));
      }
    }
    if (response is DataFailed) {
      if (kDebugMode) {
        printLog(response.error.toString());
      }
      _setViewState(ViewState.error(response.error?.message ?? "".toString()));
    }
  }

  Future<void> hDeleteTaskFromDataDb(int taskSerialNo) async {
    _setViewState(ViewState.loading());
    await _deleteTaskUseCase.call(params: taskSerialNo);
    hFetchAllTaskFromLocalDb();
  }
}
