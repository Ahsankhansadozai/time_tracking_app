import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:time_tracking_app/domain/model/Task.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view/components/ListItemView/viewModel/ListItemViewModel.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view_model/DashBaordViewModel.dart';

import '../../../../../../app/theme/app_color.dart';
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
        },
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              color: AppColor.CardLight,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                maintainState: true,
                title: Text(
                  '#${widget.task.taskSerialNo}',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColor.Orange,
                      fontSize: 12),
                ),
                subtitle: Text(
                  '${widget.task.taskName}',
                  style: hTextStyle(12),
                ),
                children: <Widget>[
                  listItemViewModel.nameEditorMode == false
                      ? Padding(
                    padding:
                              const EdgeInsets.only(left: 10.0, right: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      "ToDo From: ${widget.task.taskCreatedTime}",
                                      style: hTextStyle(10),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read<DashBoardViewModel>()
                                                .hDeleteTaskFromDataDb(
                                                    widget.task.taskSerialNo ??
                                                        0);
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
                                  addHorizontalSpace(10),
                                  Text(
                                    '0.0:0.0',
                                    style: hTextStyle(12),
                                  ),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: CupertinoSwitch(
                                        activeColor: AppColor.Orange,
                                        value: true,
                                        onChanged: (value) {}),
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
                          controller:
                          listItemViewModel.taskEditTextController,
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
                                  style: hTextStyle(12),
                                )),
                            TextButton(
                                onPressed: () {
                                  listItemViewModel.hChangeItemMode();
                                  context
                                      .read<DashBoardViewModel>()
                                      .hUpdateExistingTask(TaskModel(
                                      taskName: listItemViewModel
                                          .taskEditTextController
                                          .text,
                                      taskCreatedTime:
                                      widget.task.taskCreatedTime,
                                      taskStatus:
                                      widget.task.taskStatus));
                                },
                                child: Text('Save',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: AppColor.Orange,
                                        fontSize: 12))),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
