import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';

class TextFormFieldPassword extends StatefulWidget {
  final TextEditingController? tfController;
  final String? hintText;
  late bool showPassword;
  VoidCallback showPasswordState;

  TextFormFieldPassword({Key? key,this.tfController,this.hintText,required this.showPassword,required this.showPasswordState}) : super(key: key);

  @override
  _TextFormFieldPasswordState createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:widget.tfController,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !widget.showPassword,
      decoration: buildInputDecoration() ,
      validator: (tfInput){
        if(tfInput!.isEmpty){
          return "Bu Alanı Boş Bırakmayınız!";
        }
        return null;
      },
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      filled: true,
      fillColor: Colors.white,
      border:OutlineInputBorder(borderRadius:BorderConstant.instance.radiusAllCircularMin),
      suffixIcon: GestureDetector(
        onTap: (){
         widget.showPasswordState();
        },
        child: Icon(
            widget.showPassword ? Icons.visibility_off : Icons.visibility ,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}


