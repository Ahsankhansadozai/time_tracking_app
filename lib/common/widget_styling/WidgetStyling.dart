import 'package:flutter/material.dart';
import 'package:time_tracking_app/app/theme/app_color.dart';

hContainerBorder(double cornerRadius, BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).hintColor,
      borderRadius: BorderRadius.circular(cornerRadius));
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget hEmptyText(String text, double height, double width) {
  return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${text}'),
          addHorizontalSpace(5),
          Icon(
            Icons.task,
            size: 20,
            color: AppColor.Gray400,
          )
        ],
      ));
}

hTextStyle(double fontSize) {
  return TextStyle(fontFamily: 'Montserrat', fontSize: fontSize);
}