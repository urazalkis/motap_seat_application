import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';

class CustomDatePicker {
  static CustomDatePicker instance = CustomDatePicker._init();
  CustomDatePicker._init();

  final DatePickerTheme datePickerTheme = DatePickerTheme(
      headerColor:  ColorConstants.instance.customBlueColor,
      backgroundColor: Colors.white,
      itemStyle: TextStyle(
          color: ColorConstants.instance.customBlueColor,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      cancelStyle:const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold,),
      doneStyle: const TextStyle(color:Colors.white, fontSize: 16,fontWeight: FontWeight.bold,));

}