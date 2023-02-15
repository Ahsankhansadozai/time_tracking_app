import 'package:flutter/material.dart';

import '../../../../../../app/theme/app_color.dart';
import '../../../../../../common/widget_styling/WidgetStyling.dart';

class ListItemView extends StatefulWidget {
  const ListItemView({Key? key}) : super(key: key);

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
          childrenPadding: const EdgeInsets.all(10),
          maintainState: true,
          title: Text(
            '#11',
            style: TextStyle(
                fontFamily: 'Montserrat', color: AppColor.Orange, fontSize: 12),
          ),
          subtitle: Text(
            'New Task',
            style: hTextStyle(12),
          ),
          children: <Widget>[
            Text(
              "ToDo From: 10/2023 10:20 PM",
              style: hTextStyle(12),
            )
          ],
        ),
      ),
    );
  }
}
