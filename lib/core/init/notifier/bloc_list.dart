import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/view/reports/base/current/current_cubit.dart';
import 'package:motaperp_seat_application/view/reports/base/current/current_service.dart';
import 'package:motaperp_seat_application/view/reports/base/staff/staff_cubit.dart';
import 'package:motaperp_seat_application/view/reports/base/staff/staff_service.dart';
import 'package:motaperp_seat_application/view/reports/finance/balance_report/balance_report_cubit.dart';
import 'package:motaperp_seat_application/view/reports/finance/balance_report/balance_report_service.dart';
import 'package:motaperp_seat_application/view/reports/finance/case_movement/case_movement_cubit.dart';
import 'package:motaperp_seat_application/view/reports/finance/case_movement/case_movement_service.dart';
import 'package:motaperp_seat_application/view/reports/finance/check_movement/check_movement_cubit.dart';
import 'package:motaperp_seat_application/view/reports/finance/check_movement/check_movement_service.dart';
import 'package:motaperp_seat_application/view/reports/finance/promissory_movement/promissory_movement_cubit.dart';
import 'package:motaperp_seat_application/view/reports/finance/promissory_movement/promissory_movement_service.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_cubit.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_service.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_cubit.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_service.dart';
import 'package:motaperp_seat_application/view/reports/order/orderReport/order_report_cubit.dart';
import 'package:motaperp_seat_application/view/reports/order/orderReport/order_report_service.dart';
import 'package:motaperp_seat_application/view/reports/staff/absent_staff/absent_staff_cubit.dart';
import 'package:motaperp_seat_application/view/reports/staff/absent_staff/absent_staff_service.dart';
import 'package:motaperp_seat_application/view/reports/staff/employee_payment/employee_payment_cubit.dart';
import 'package:motaperp_seat_application/view/reports/staff/employee_payment/employee_payment_service.dart';
import 'package:motaperp_seat_application/view/reports/staff/working_hour/working_hour_cubit.dart';
import 'package:motaperp_seat_application/view/reports/staff/working_hour/working_hour_service.dart';
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
    BlocProvider(create: (context) => StaffCubit(staffService:StaffService()),lazy: true,),
    BlocProvider(create: (context) => CurrentCubit(CurrentService()),lazy: true,),
    BlocProvider(create: (context) => OrderReportCubit(orderReportService:OrderReportService()),lazy: true,),
    BlocProvider(create: (context) => BalanceReportCubit(balancerReportService: BalanceReportService()),lazy: true,),
    BlocProvider(create: (context) => CaseMovementCubit(caseMovementService: CaseMovementService()),lazy: true,),
    BlocProvider(create: (context) => CheckMovementCubit(checkMovementService: CheckMovementService()),lazy: true,),
    BlocProvider(create: (context) => CheckMovementCubit(checkMovementService: CheckMovementService()),lazy: true,),
    BlocProvider(create: (context) => PromissoryMovementCubit(promissoryMovementService: PromissoryMovementService()),lazy: true,),
    BlocProvider(create: (context) => AbsentStaffCubit(absentStaffService: AbsentStaffService()),lazy: true,),
    BlocProvider(create: (context) => WorkingHourCubit(workingHourService: WorkingHourService()),lazy: true,),
    BlocProvider(create: (context) => EmployeePaymentCubit(employeePaymentService: EmployeePaymentService()),lazy: true,),
    BlocProvider(create: (context) => TaskOrderCubit(taskOrderReportService: TaskOrderReportService()),lazy: true,),
    BlocProvider(create: (context) => PlanningCubit(planningService: PlanningService()),lazy: true,),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}