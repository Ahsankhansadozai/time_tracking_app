import 'package:flutter/material.dart';
import 'package:time_tracking_app/app/theme/app_color.dart';

hContainerBorder(double cornerRadius){
return  BoxDecoration(
    color: AppColor.Gray200, //new Color.fromRGBO(255, 0, 0, 0.0),
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

hTextStyle(double fontSize){
  return TextStyle(
      fontFamily: 'Montserrat',
      color: AppColor.CardDark,
      fontSize: fontSize);
}