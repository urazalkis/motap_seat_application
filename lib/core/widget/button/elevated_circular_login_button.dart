import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';

//typedef FutureCallBack = Future<void> Function();
class ElevatedCircularLoginButton extends StatefulWidget {

    ElevatedCircularLoginButton(
      {Key? key, required this.title, required this.onPressed, required this.isLoading, this.primaryColor})
      : super(key: key);
  final String title;
  late bool isLoading;
  final Color? primaryColor;
 // late FutureCallBack onPressed;
    VoidCallback onPressed;

  @override
  _ElevatedCircularLoginButtonState createState() => _ElevatedCircularLoginButtonState();
}

class _ElevatedCircularLoginButtonState extends State<ElevatedCircularLoginButton> {


   @override
  Widget build(BuildContext context) {
     return ElevatedButton(
         style: ElevatedButton.styleFrom(
             minimumSize: const Size.fromHeight(50),
             primary: widget.primaryColor, shape: widget.isLoading ? const CircleBorder() :  RoundedRectangleBorder(
           borderRadius:BorderConstant.instance.radiusAllCircularHigh,
         )),
         onPressed:  widget.isLoading ? null : widget.onPressed,
         child:  widget.isLoading ?  const CustomCircularProgressIndicator() : Text(widget.title,style: const TextStyle(color: Colors.black),));
   }
}
