import 'package:flutter/material.dart';

class AppThemeLight{
  static AppThemeLight? _instance;
  static AppThemeLight? get instance{
    _instance ??= AppThemeLight._init();
      return _instance;
  }
  AppThemeLight._init();

  ThemeData get theme => ThemeData.light();
  }
