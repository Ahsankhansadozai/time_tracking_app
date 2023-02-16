import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:time_tracking_app/domain/use_cases/AddTaskUseCase/use_case/AddNewTaskUseCase.dart';
import 'package:time_tracking_app/domain/use_cases/DeleteTaskUseCase/use_case/DeleteTaskUseCase.dart';
import 'package:time_tracking_app/domain/use_cases/UpdateTaskUseCase/use_case/UpdateExistingUseCase.dart';

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
  final UpdateTaskUseCase _updateTaskUseCase = injector<UpdateTaskUseCase>();

  final ScrollController _scrollControllerTodo = ScrollController();
  final ScrollController _scrollControllerInProgress = ScrollController();
  final ScrollController _scrollControllerDone = ScrollController();

  get scrollControllerTodo => _scrollControllerTodo;

  get scrollControllerInProgress => _scrollControllerInProgress;

  get scrollControllerDone => _scrollControllerDone;

  ViewState<List<TaskModel>> viewState =
      ViewState(state: ResponseState.LOADING);

  void _setViewState(ViewState<List<TaskModel>> viewState) {
    this.viewState = viewState;
    notifyListeners();
    setBusyForObject(loginBusyKey, false);
  }

  // function to add New Task in Database
  Future<void> hAddNewTask(int status) async {
    await _addNewTaskUseCase.call(
        params: TaskModel(
            taskName: 'New Task',
            taskCreatedTime: hGetCurrentDateTime(),
            taskStatus: status));
    hFetchAllTaskFromLocalDb();
    hScrollEndOfList(status);
  }

  hDeleteExistingTask(String id) {}

  Future<void> hUpdateExistingTask(TaskModel taskModel) async {
    final response = await _updateTaskUseCase.call(params: taskModel);
    if (response is DataSuccess) {
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

  Future<void> hFetchAllTaskFromLocalDb() async {
    final response = await _fetchAllTaskUseCase.call(
        params: TaskModel(
            taskSerialNo: null,
            taskName: 'New Task',
            taskCreatedTime: '',
            taskStatus: null));
    if (response is DataSuccess) {
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
    await _deleteTaskUseCase.call(params: taskSerialNo);
    hFetchAllTaskFromLocalDb();
  }

  hFindTaskFromList(int type) {
    List<TaskModel> listTobeReturned = [];
    viewState.data?.forEach((element) {
      if (element.taskStatus == type) {
        listTobeReturned.add(element);
      }
    });
    return listTobeReturned;
  }

  //use to scroll down to the list when list new task added.
  void hScrollEndOfList(int status) {
    switch (status) {
      case 1:
        _scrollControllerTodo.animateTo(
          _scrollControllerTodo.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
        notifyListeners();
        break;
      case 2:
        _scrollControllerInProgress.animateTo(
          _scrollControllerTodo.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
        notifyListeners();
        break;

      case 3:
        _scrollControllerDone.animateTo(
          _scrollControllerTodo.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
        notifyListeners();
        break;
    }
  }
}
