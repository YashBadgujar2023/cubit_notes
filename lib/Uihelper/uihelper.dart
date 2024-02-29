
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Uihelper{
  static customtext(
      {required String text, Color? color, FontWeight? fontWeight, double? fontsize}){
    return Text(
      text,
      style: TextStyle(color: color,fontSize:  fontsize,fontWeight: fontWeight)
    );
  }
}