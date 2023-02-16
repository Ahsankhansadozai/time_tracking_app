import '../../../../common/custom_function.dart';
import '../../../../core/ErrorResponse.dart';
import '../../../../core/data_state.dart';
import '../../../../core/use_case.dart';
import '../../../model/Task.dart';
import '../../../repository/TaskRepository.dart';

class UpdateTaskUseCase
    implements UseCase<DataState<List<TaskModel>>, TaskModel> {
  final TaskRepository _taskRepository;

  UpdateTaskUseCase(this._taskRepository);

  @override
  Future<DataState<List<TaskModel>>> call({required TaskModel params}) async {
    try {
      List<TaskModel> response =
          await _taskRepository.hUpdateTaskFromDb(params);
      return DataSuccess(response);
    } catch (e) {
      printLog(e.toString());
      return DataFailed(ErrorResponse(message: e.toString(), statusCode: 0));
    }
  }
}
