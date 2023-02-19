import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ListItemViewModel extends BaseViewModel {
  static const countdownDuration = Duration(minutes: 10);
  late Timer _timer;
  int _startTimer = 0;
  bool countDown = true;
  bool _nameEditorMode = false;
  bool _hStartTimer = false;

  get startTimer => _startTimer;

  get nameEditorMode => _nameEditorMode;

  get hStartTimer => _hStartTimer;

  final TextEditingController _taskEditTextController = TextEditingController();

  get taskEditTextController => _taskEditTextController;

  hSetTextInTextEditingController(String text) {
    _taskEditTextController.text = text;
  }

  hChangeItemMode() {
    _nameEditorMode = !_nameEditorMode;
    notifyListeners();
  }

  hEnableDisableTimer(bool value) {
    _hStartTimer = value;
    startTimerCount();
    notifyListeners();
  }

  void startTimerCount() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => _startTimer = timer.tick,
    );
    notifyListeners();
  }

  void stopTimer({bool resets = true}) {
    _timer.cancel();
    notifyListeners();
  }
}
