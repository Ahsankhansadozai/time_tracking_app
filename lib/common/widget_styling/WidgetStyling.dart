import 'package:flutter/cupertino.dart';
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
