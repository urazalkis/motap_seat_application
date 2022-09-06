import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final double? height;
  final String iconUrl;
  const IconWidget({Key? key, this.height, required this.iconUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(iconUrl),
    );
  }
}
