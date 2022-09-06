import 'package:flutter/material.dart';

class TextFieldStandard extends StatelessWidget {
  final String? hintText;
  ValueChanged<String>? onChanged;
   TextFieldStandard({Key? key,this.hintText,this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
        maxLines: null,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle( fontWeight: FontWeight.bold,color: Colors.white,),

        ),
        onChanged:onChanged,
    );
  }
}
