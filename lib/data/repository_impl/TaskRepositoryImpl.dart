import 'package:time_tracking_app/data/local/dao/TaskDao.dart';
import 'package:time_tracking_app/domain/model/Task.dart';
import 'package:time_tracking_app/domain/repository/TaskRepository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDao _taskDao;

  TaskRepositoryImpl(this._taskDao);

  @override
  hAddNewTask(TaskModel params) {
    _taskDao.insertNewTask(params);
  }
}
