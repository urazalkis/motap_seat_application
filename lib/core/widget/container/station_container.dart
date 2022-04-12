import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';


class StationContainer extends StatelessWidget {
  final String text;
  final String imagePath;
  VoidCallback onPressed;
  String? colorStatus;
  late bool isProcess;
  StationContainer({Key? key, required this.text,required this.imagePath,required this.onPressed,this.colorStatus,required this.isProcess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border:Border.all(width: 0.0,color: Colors.white),
          gradient:colorStatus=="0" ? ColorConstants.instance.transparentColor : colorStatus=="1" ? ColorConstants.instance.gradientGreenColor : ColorConstants.instance.transparentColor,
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
              isProcess==true ?  const CustomCircularProgressIndicator() :
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
                  fontSize: 16,
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
