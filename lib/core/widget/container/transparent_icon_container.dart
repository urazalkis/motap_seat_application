import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';

class TransparentIconContainer extends StatelessWidget {
 final String text;
 final String imagePath;
 VoidCallback onpressed;
 TransparentIconContainer({Key? key, required this.onpressed,required this.text,required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          border:Border.all(width: 0.0,color: Colors.white),
          gradient: ColorConstants.instance.transparentColor,
          borderRadius: BorderConstant.instance.radiusAllCircularMin,
        ),
        height: MediaQuery.of(context).size.height / 5,
        width: (MediaQuery.of(context).size.width / 2) - 50,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.transparent,),
                ),
                height: MediaQuery.of(context).size.height / 10,
                child:  Image.asset(imagePath),
              ),
              const SizedBox(
                height: 5,
              ),
              Text
                (
                text,
                textAlign:TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],

          ),
        ),
      ),
    );
  }


}
