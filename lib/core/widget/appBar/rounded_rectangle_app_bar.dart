import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';

class RoundedRectangleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  const RoundedRectangleAppBar({Key? key, this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    return AppBar(
      centerTitle: true,
      shape:RoundedRectangleBorder(
        borderRadius: BorderConstant.instance.radiusAllCircularHigh,
      ),
      flexibleSpace: Container(
        decoration: ColorConstants.instance.appBackgroundColor,
      ),
      leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
      title: title,
      actions: actions,
    );
  }

/*  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();*/
 final double toolbarHeight=60;
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
