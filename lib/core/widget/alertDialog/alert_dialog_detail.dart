
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/widget/button/text_button_icon.dart';

class AlertDialogDetail extends StatelessWidget {
  final String text;
  final List<Widget> items;

  AlertDialogDetail({Key? key,required this.text,required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text(text,style: TextStyle(color:ColorConstants.instance.customBlueColor),),
      shape: OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
      content:SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: RawScrollbar(
          radius:const Radius.circular(20),
          thumbColor:ColorConstants.instance.customBlueColor,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center ,
              children:items,
            ),
          ),

        ),
      ),
      actions: [
        TextButtonIcon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icons.keyboard_return,
          iconColor: ColorConstants.instance.customBlueColor,
          text: "Çık",
          textColor: ColorConstants.instance.customBlueColor,
        ),
      ],
    );
  }


}
