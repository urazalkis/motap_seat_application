import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';

typedef ItemBuilder = List<PopupMenuEntry<int>> Function(BuildContext context);
typedef OnSelected = void Function(int);
class CustomPopupMenuButton extends StatelessWidget {

  ItemBuilder itemBuilder;
  String? toolTip;
  Icon? icon;
  OnSelected? onSelected;
  CustomPopupMenuButton({Key? key,required this.itemBuilder,this.toolTip,this.icon,this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton(
      color: Colors.white,
      tooltip: toolTip,
      shape: RoundedRectangleBorder(
        borderRadius:BorderConstant.instance.radiusAllCircularMedium,
      ),
      icon:icon,
      // add this line
      itemBuilder:itemBuilder,
      onSelected:onSelected,

    );
  }
}
