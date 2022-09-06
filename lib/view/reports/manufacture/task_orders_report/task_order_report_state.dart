import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_response.dart';
abstract class ITaskOrderState{
  ITaskOrderState();

}

class TaskOrderReportInit extends ITaskOrderState{
  TaskOrderReportInit();
}
class TaskOrderReportLoading extends ITaskOrderState{
  late bool isLoading;
  TaskOrderReportLoading(isLoading);
}
class TaskOrderReportLoaded extends ITaskOrderState{

  List<TaskOrderReportResponseModel> myList;
  TaskOrderReportLoaded(this.myList);
}
class TaskOrderReportError extends ITaskOrderState{
  String errorMessage;
  TaskOrderReportError(this.errorMessage);
}