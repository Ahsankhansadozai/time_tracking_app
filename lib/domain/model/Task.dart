import 'package:floor/floor.dart';

@entity
class TaskModel {
  @PrimaryKey(autoGenerate: true)
  int? taskSerialNo;
  String? taskName;
  String? taskCreatedTime;
  int? taskStatus;

  TaskModel(
      {this.taskSerialNo,
      this.taskName,
      this.taskCreatedTime,
      this.taskStatus});

  TaskModel.fromJson(Map<String, dynamic> json) {
    taskSerialNo = json['taskSerialNo'];
    taskName = json['taskName'];
    taskCreatedTime = json['taskCreatedTime'];
    taskStatus = json['taskStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskSerialNo'] = this.taskSerialNo;
    data['taskName'] = this.taskName;
    data['taskCreatedTime'] = this.taskCreatedTime;
    data['taskStatus'] = this.taskStatus;
    return data;
  }
}
