import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracking_app/domain/model/Task.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view_model/DashBaordViewModel.dart';

import '../../../../../../app/theme/app_color.dart';
import '../../../../../../common/widget_styling/WidgetStyling.dart';

class ListItemView extends StatefulWidget {
  TaskModel task;

  ListItemView(this.task);

  @override
  State<ListItemView> createState() => _ListItemViewState();
}

class _ListItemViewState extends State<ListItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: AppColor.CardLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.centerLeft,
          maintainState: true,
          title: Text(
            '#${widget.task.taskSerialNo}',
            style: TextStyle(
                fontFamily: 'Montserrat', color: AppColor.Orange, fontSize: 12),
          ),
          subtitle: Text(
            '${widget.task.taskName}',
            style: hTextStyle(12),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ToDo From: ${widget.task.taskCreatedTime}",
                    style: hTextStyle(10),
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<DashBoardViewModel>()
                            .hDeleteTaskFromDataDb(
                                widget.task.taskSerialNo ?? 0);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: AppColor.Red,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
