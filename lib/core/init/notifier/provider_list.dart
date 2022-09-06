
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/view/login/login_view_model.dart';
import 'package:motaperp_seat_application/view/register/register_view_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:motaperp_seat_application/view/scan/scan_view_model.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<dynamic> dependItems = [
    ChangeNotifierProvider(create: (_) => RegisterViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => LoginViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => ScanViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => BaseReportViewModel(),lazy: true,),
    ChangeNotifierProvider(create: (_) => TaskOrderViewModel(),lazy: true,),
    Provider.value(value: NavigationService.instance)

  ];
  List<SingleChildWidget> uiChangesItems = [];
}