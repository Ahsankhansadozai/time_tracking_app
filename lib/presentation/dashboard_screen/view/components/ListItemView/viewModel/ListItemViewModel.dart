import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ListItemViewModel extends BaseViewModel {
  bool _nameEditorMode = false;

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
}
