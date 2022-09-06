import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/widget/button/text_button_icon.dart';

class AlertDialogQuestion extends StatelessWidget {
  final String text;
  final Color textColor;
  VoidCallback onpressedConfirm;

  AlertDialogQuestion({Key? key,required this.text,required this.textColor,required this.onpressedConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:Text(text,style: TextStyle(color: textColor,fontWeight: FontWeight.bold),),
      title:const Icon(Icons.help),
      shape: RoundedRectangleBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),

      actions: [
        TextButtonIcon(
          onPressed: onpressedConfirm,
          icon: Icons.check,
          iconColor: Colors.green,
          text: "İşlemi Gerçekleştir",
          textColor: Colors.green,
        ),
        TextButtonIcon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icons.close,
          iconColor: Colors.red,
          text: "Çık",
          textColor: Colors.red,
        ),

      ],
    );
  }


}