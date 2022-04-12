import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/widget/card/not_found_navigation_card.dart';
import 'package:motaperp_seat_application/view/adminMenu/admin_menu_view.dart';
import 'package:motaperp_seat_application/view/login/login_view.dart';
import 'package:motaperp_seat_application/view/register/register_view.dart';
import 'package:motaperp_seat_application/view/reports/orderReport/order_report_view.dart';
import 'package:motaperp_seat_application/view/scan/scan_view.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_view.dart';

class NavigationRoute {
  LocaleManager localeManager = LocaleManager.instance;
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      /*case NavigationConstants.DEFAULT:
        return normalNavigate(SplashView(), NavigationConstants.Default);*/
      case NavigationConstants.REGISTER:
        return normalNavigate(const RegisterView(), NavigationConstants.REGISTER);
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView(), NavigationConstants.LOGIN);
      case NavigationConstants.SCAN:
        return normalNavigate(const ScanView(), NavigationConstants.SCAN);
      case NavigationConstants.ADMIN_MENU:
        return normalNavigate(AdminMenuView(), NavigationConstants.ADMIN_MENU);
      case NavigationConstants.ORDER_REPORT:
        return normalNavigate(const OrderReportView(), NavigationConstants.ADMIN_MENU);
      case NavigationConstants.TASK_ORDER:
        return normalNavigate( const TaskOrderView(), NavigationConstants.TASK_ORDER);


      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationCard(),
        );
    }
  }
  String? initialRoute(){

   if(localeManager.getStringValue(PreferencesKeys.admin)=="1") {
     return NavigationConstants.ADMIN_MENU;
   }
   else if(localeManager.getStringValue(PreferencesKeys.admin)=="0") {

      return NavigationConstants.SCAN;
    }
   else if(localeManager.getStringValue(PreferencesKeys.dbName) !=''){
     return NavigationConstants.LOGIN;
   }
   else{
    return NavigationConstants.REGISTER;
   }
  }
  Future<bool> quitApp() async
  {
    SystemNavigator.pop();
    exit(0);
  }
  Future<bool> returnBack(BuildContext context) async
  {
   Navigator.pop(context);
   return true;
  }
  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}