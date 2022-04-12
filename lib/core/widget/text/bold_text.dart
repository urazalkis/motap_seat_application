import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  String text;
  Color? color;
  bool? underLine;
  double? fontSize;
   BoldText({Key? key,required this.text,this.color,this.underLine,this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
        style: TextStyle(
          fontSize:fontSize,
            fontWeight: FontWeight.bold,color:color,
          decoration:underLine==true ? TextDecoration.underline : null,
        )
    );
  }
}
