import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/view/reports/current/current_cubit.dart';
import 'package:motaperp_seat_application/view/reports/current/current_service.dart';
import 'package:motaperp_seat_application/view/reports/orderReport/order_report_cubit.dart';
import 'package:motaperp_seat_application/view/reports/orderReport/order_report_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationBloc {
  static ApplicationBloc? _instance;
  static ApplicationBloc get instance {
    _instance ??= ApplicationBloc._init();
    return _instance!;
  }

  ApplicationBloc._init();

  List<SingleChildWidget> singleItems = [];
  List<dynamic> dependItems = [
    BlocProvider(create: (context) => CurrentCubit(CurrentService())),
    BlocProvider(create: (context) => OrderReportCubit(OrderReportService())),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}