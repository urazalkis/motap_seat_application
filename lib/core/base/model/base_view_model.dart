import 'package:flutter/material.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';


abstract class IBaseViewModel {
  BuildContext? context;

  //ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
 // VexanaManager? vexanaManager = VexanaManager.instance;
 // VexanaManager get vexanaManagerComputed => VexanaManager.instance;

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
  void dispose();
}
