import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/widget/button/text_button_icon.dart';

class AlertDialogNoConnection extends StatelessWidget {

  const AlertDialogNoConnection({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        backgroundColor: Colors.white,
        content:const Text("İnternet bağlantısı sağlanamadı.Lütfen ağınızı kontrol ediniz.",style: TextStyle(fontWeight: FontWeight.bold),),
        title:const Icon(Icons.wifi),
        shape: RoundedRectangleBorder(borderRadius:BorderConstant.instance.radiusAllCircularMedium),
      ),
    );
  }


}