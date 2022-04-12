import 'package:flutter/material.dart';

class TextButtonIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  late VoidCallback onPressed;

  TextButtonIcon({required this.text,required this.icon,required this.textColor,required this.iconColor,required this.onPressed,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  TextButton.icon(
      icon:  Icon(icon, color: iconColor,),
      label:  Text(text, style: TextStyle(color:textColor),),
      onPressed:onPressed,

    );
  }


}
