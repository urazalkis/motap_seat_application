import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';

class TextFormFieldStandard extends StatelessWidget {
  final TextEditingController? tfController;
  final String? hintText;
  const TextFormFieldStandard({Key? key,this.tfController,this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:tfController,
      autocorrect: false,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
      ) ,
      validator: (tfInput){
        if(tfInput!.isEmpty){
          return "Bu alanı boş bırakmayınız!";
        }
        return null;
      },
    );
  }
}
