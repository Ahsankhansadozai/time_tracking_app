import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import 'constants.dart';

void printLog(String ss) {
  if (kDebugMode) print('${ss}');
}

hGetCurrentDateTime() {
  return DateTime.now().toString();
}

String fromTime24to12(String time) {
  try {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    print("${time}");
    var inputDate = inputFormat.parse(time); // <-- dd/MM 24H format
    var outputFormat = DateFormat('MM-dd-yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  } catch (e) {
    return "--";
  }
}

hCheckTaskType(int taskStatus) {
  switch (taskStatus) {
    case 1:
      return TODO_FROM;

    case 2:
      return IN_PROGRESS_FROM;

    case 3:
      return DONE_FROM;
  }
}
