import 'package:flutter/material.dart';

abstract class BaseStateless<T extends StatelessWidget> extends State {
  ThemeData get themeData => Theme.of(context);

  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dyanmicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
}