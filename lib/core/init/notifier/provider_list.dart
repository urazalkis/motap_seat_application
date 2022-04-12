
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
    ChangeNotifierProvider(create: (_) => RegisterViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => ScanViewModel()),
    ChangeNotifierProvider(create: (_) => BaseReportViewModel()),
    ChangeNotifierProvider(create: (_) => TaskOrderViewModel()),
    Provider.value(value: NavigationService.instance)

  ];
  List<SingleChildWidget> uiChangesItems = [];
}