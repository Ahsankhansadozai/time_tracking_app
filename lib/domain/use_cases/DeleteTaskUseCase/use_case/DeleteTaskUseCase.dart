import '../../../../common/custom_function.dart';
import '../../../../core/ErrorResponse.dart';
import '../../../../core/data_state.dart';
import '../../../../core/use_case.dart';
import '../../../model/Task.dart';
import '../../../repository/TaskRepository.dart';

class DeleteTaskUseCase
    implements UseCase<DataState<void>, int> {
  final TaskRepository _taskRepository;

  DeleteTaskUseCase(this._taskRepository);

  @override
  Future<DataState<void>> call({required int params}) async {
    try {
      final response = await _taskRepository.hDeleteTaskFromDb(params);
      return DataSuccess(response);
    } catch (e) {
      printLog(e.toString());
      return DataFailed(
          ErrorResponse(message: '${e.toString()}', statusCode: 0));
    }
  }
}
