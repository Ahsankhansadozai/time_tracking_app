import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

hContainerBorder(double cornerRadius){
return  BoxDecoration(
      color: Colors.green, //new Color.fromRGBO(255, 0, 0, 0.0),
      borderRadius: BorderRadius.circular(cornerRadius));
}