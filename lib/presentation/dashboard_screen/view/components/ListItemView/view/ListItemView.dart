import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:time_tracking_app/domain/model/Task.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view/components/ListItemView/viewModel/ListItemViewModel.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view_model/DashBaordViewModel.dart';

import '../../../../../../app/theme/app_color.dart';
import '../../../../../../common/custom_function.dart';
import '../../../../../../common/widget_styling/WidgetStyling.dart';

class ListItemView extends StatefulWidget {
  TaskModel task;

  ListItemView(this.task, {super.key});

  @override
  State<ListItemView> createState() => _ListItemViewState();
}

class _ListItemViewState extends State<ListItemView> {
  ListItemViewModel listItemViewModel = ListItemViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListItemViewModel>.reactive(
        viewModelBuilder: () => listItemViewModel,
        onModelReady: (viewModel) async {
          listItemViewModel
              .hSetTextInTextEditingController(widget.task.taskName ?? "");
          if (widget.task.timer ?? false) {
            print('last updated :${widget.task.lastUpdated}');

            listItemViewModel.hSetStartTime(
                widget.task.lastTick ?? 0, widget.task.lastUpdated.toString());
            listItemViewModel.startTimerCount(widget.task, context);
          }
        },
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                maintainState: true,
                title:
                    Text('#${widget.task.taskSerialNo}', style: hTextStyle(12)),
                subtitle: Text(
                  '${widget.task.taskName}',
                  style: hTextStyle(14),
                ),
                children: <Widget>[
                  hBuildTaskWidget(listItemViewModel.nameEditorMode)
                ],
              ),
            ),
          );
        });
  }

  hBuildTaskWidget(nameEditorMode) {
    return nameEditorMode == false
        ? Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "${hCheckTaskType(widget.task.taskStatus ?? 0)} : ${fromTime24to12(widget.task.taskCreatedTime.toString())}",
                        style: hTextStyle(12),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context
                                  .read<DashBoardViewModel>()
                                  .hDeleteTaskFromDataDb(
                                      widget.task.taskSerialNo ?? 0);
                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: AppColor.RedCircle,
                              size: 20,
                            )),
                        IconButton(
                            onPressed: () {
                              listItemViewModel.hChangeItemMode();
                            },
                            icon: Icon(
                              Icons.edit_rounded,
                              color: AppColor.Gray400,
                              size: 20,
                            ))
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.watch_later,
                      size: 18,
                      color: AppColor.Gray400,
                    ),
                    addHorizontalSpace(20),
                    SizedBox(
                      width: 100,
                      child: Text(
                        formatTime(listItemViewModel.startTimer),
                        style: hTextStyle(
                          12,
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                          activeColor: AppColor.Orange,
                          value: widget.task.timer!,
                          onChanged: (value) {
                            widget.task.timer = value;
                            widget.task.lastUpdated = hGetCurrentDateTime();
                            widget.task.lastTick = listItemViewModel.startTimer;
                            context
                                .read<DashBoardViewModel>()
                                .hUpdateExistingTask(widget.task);
                            listItemViewModel.hEnableDisableTimer(
                                value, widget.task, context);
                          }),
                    ),
                  ],
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: listItemViewModel.taskEditTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter task description',
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          listItemViewModel.hChangeItemMode();
                        },
                        child: Text(
                          'cancel',
                          style: hTextStyle(
                            14,
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          listItemViewModel.hChangeItemMode();
                          context
                              .read<DashBoardViewModel>()
                              .hUpdateExistingTask(TaskModel(
                                  taskSerialNo: widget.task.taskSerialNo,
                                  taskName: listItemViewModel
                                      .taskEditTextController.text,
                                  taskCreatedTime: widget.task.taskCreatedTime,
                                  taskStatus: widget.task.taskStatus,
                                  timer: false,
                                  lastTick: listItemViewModel.startTimer,
                                  lastUpdated: hGetCurrentDateTime()));
                        },
                        child: Text('Save', style: hTextStyle(14))),
                  ],
                )
              ],
            ),
          );
  }

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }
}
