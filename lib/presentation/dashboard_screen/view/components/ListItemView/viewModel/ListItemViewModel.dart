import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:time_tracking_app/common/custom_function.dart';
import 'package:time_tracking_app/domain/model/Task.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view_model/DashBaordViewModel.dart';

class ListItemViewModel extends BaseViewModel {
  static const countdownDuration = Duration(minutes: 10);
  late Timer _timer;
  int _startTimer = 0;
  bool countDown = true;
  bool _nameEditorMode = false;

  get startTimer => _startTimer;

  hSetStartTime(int lastTick, String lastUpdatedTime) {
    hCalculateDiffCurrTimeAndLastUpdatedTime(lastUpdatedTime);

    _startTimer = lastTick;
    notifyListeners();
  }

  get nameEditorMode => _nameEditorMode;

  final TextEditingController _taskEditTextController = TextEditingController();

  get taskEditTextController => _taskEditTextController;

  hSetTextInTextEditingController(String text) {
    _taskEditTextController.text = text;
  }

  hChangeItemMode() {
    _nameEditorMode = !_nameEditorMode;
    notifyListeners();
  }

  hEnableDisableTimer(bool value, TaskModel task, BuildContext context) {
    if (value) {
      startTimerCount(task, context);
    } else {
      stopTimer();
    }
  }

  void startTimerCount(TaskModel task, BuildContext context) {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _startTimer++,
              task.lastTick = _startTimer,
              context.read<DashBoardViewModel>().hUpdateExistingTask(task),
              notifyListeners(),
            });
  }

  void stopTimer({bool resets = true}) {
    _timer.cancel();
    notifyListeners();
  }

  void hCalculateDiffCurrTimeAndLastUpdatedTime(String lastUpdatedTime) {
    var hGetCurrentTimeStamp = DateFormat('yyyy-MM-dd HH:mm')
        .parse(hGetCurrentDateTime())
        .millisecondsSinceEpoch;

    var lastUpdateTimeStamp = DateFormat('yyyy-MM-dd HH:mm')
        .parse(lastUpdatedTime)
        .millisecondsSinceEpoch;

    print('time stamps :$hGetCurrentTimeStamp  $lastUpdateTimeStamp}');
  }
}
