import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';

class CustomScrollBar extends StatelessWidget {
 final Widget child;

 const CustomScrollBar({required this.child,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return RawScrollbar(
        radius: const Radius.circular(5),
    thumbColor:  ColorConstants.instance.customBlueColor,
      isAlwaysShown: true,
      child: child,
    );
  }
}
