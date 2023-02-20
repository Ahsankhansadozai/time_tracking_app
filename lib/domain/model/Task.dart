import 'package:floor/floor.dart';

@entity
class TaskModel {
  @PrimaryKey(autoGenerate: true)
  int? taskSerialNo;
  String? taskName;
  String? taskCreatedTime;
  int? taskStatus;
  bool? timer;
  int? lastTick;
  String? lastUpdated;

  TaskModel(
      {this.taskSerialNo,
      this.taskName,
      this.taskCreatedTime,
      this.taskStatus,
      this.timer,
      this.lastTick,
      this.lastUpdated});

  TaskModel.fromJson(Map<String, dynamic> json) {
    taskSerialNo = json['taskSerialNo'];
    taskName = json['taskName'];
    taskCreatedTime = json['taskCreatedTime'];
    taskStatus = json['taskStatus'];
    timer = json['timer'];
    lastTick = json['lastTick'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskSerialNo'] = this.taskSerialNo;
    data['taskName'] = this.taskName;
    data['taskCreatedTime'] = this.taskCreatedTime;
    data['taskStatus'] = this.taskStatus;
    data['timer'] = this.timer;
    data['lastTick'] = this.lastTick;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}
