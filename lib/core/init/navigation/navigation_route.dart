import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/widget/card/not_found_navigation_card.dart';
import 'package:motaperp_seat_application/view/adminMenu/admin_menu_view.dart';
import 'package:motaperp_seat_application/view/adminMenu/finance/finance_menu_view.dart';
import 'package:motaperp_seat_application/view/adminMenu/manufacture/manufacture_menu_view.dart';
import 'package:motaperp_seat_application/view/adminMenu/order/order_menu_view.dart';
import 'package:motaperp_seat_application/view/adminMenu/staff/staff_menu_view.dart';
import 'package:motaperp_seat_application/view/login/login_view.dart';
import 'package:motaperp_seat_application/view/register/register_view.dart';
import 'package:motaperp_seat_application/view/reports/finance/balance_report/balance_report_view.dart';
import 'package:motaperp_seat_application/view/reports/finance/case_movement/case_movement_view.dart';
import 'package:motaperp_seat_application/view/reports/finance/check_movement/check_movement_view.dart';
import 'package:motaperp_seat_application/view/reports/finance/promissory_movement/promissory_movement_view.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_view.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_view.dart';
import 'package:motaperp_seat_application/view/reports/order/orderReport/order_report_view.dart';
import 'package:motaperp_seat_application/view/reports/staff/absent_staff/absent_staff_view.dart';
import 'package:motaperp_seat_application/view/reports/staff/employee_payment/employee_payment_view.dart';
import 'package:motaperp_seat_application/view/reports/staff/working_hour/working_hour_view.dart';
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
      case NavigationConstants.FINANCE_MENU:
        return normalNavigate(FinanceMenuView(), NavigationConstants.FINANCE_MENU);
      case NavigationConstants.MANUFACTURE_MENU:
        return normalNavigate(ManufactureMenuView(), NavigationConstants.MANUFACTURE_MENU);
      case NavigationConstants.ORDER_MENU:
        return normalNavigate(OrderMenuView(), NavigationConstants.ORDER_MENU);
      case NavigationConstants.STAFF_MENU:
        return normalNavigate(StaffMenuView(), NavigationConstants.STAFF_MENU);
      case NavigationConstants.TASK_ORDER:
        return normalNavigate(TaskOrderView(), NavigationConstants.TASK_ORDER);
      case NavigationConstants.ORDER_REPORT:
        return normalNavigate( const OrderReportView(), NavigationConstants.ORDER_REPORT);
      case NavigationConstants.BALANCE_REPORT:
        return normalNavigate( const BalanceReportView(), NavigationConstants.BALANCE_REPORT);
      case NavigationConstants.CASE_MOVEMENT:
        return normalNavigate( const CaseMovementView(), NavigationConstants.CASE_MOVEMENT);
      case NavigationConstants.CHECK_MOVEMENT:
        return normalNavigate( const CheckMovementView(), NavigationConstants.CHECK_MOVEMENT);
      case NavigationConstants.PROMISSORY_MOVEMENT:
        return normalNavigate( const PromissoryMovementView(), NavigationConstants.PROMISSORY_MOVEMENT);
      case NavigationConstants.ABSENT_STAFF:
        return normalNavigate(const AbsentStaffView(), NavigationConstants.ABSENT_STAFF);
      case NavigationConstants.WORKING_HOUR:
        return normalNavigate(const WorkingHourView(), NavigationConstants.WORKING_HOUR);
      case NavigationConstants.EMPLOYEE_PAYMENT:
        return normalNavigate(const EmployeePaymentView(), NavigationConstants.EMPLOYEE_PAYMENT);
      case NavigationConstants.TASK_ORDER_REPORT:
        return normalNavigate(const TaskOrderReportView(), NavigationConstants.TASK_ORDER_REPORT);
      case NavigationConstants.PLANNNING:
        return normalNavigate(const PlanningView(), NavigationConstants.PLANNNING);

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

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}