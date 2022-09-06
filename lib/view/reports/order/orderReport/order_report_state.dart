import 'order_report_model_response.dart';

abstract class IOrderReportState{
  IOrderReportState();

}

class OrderReportInit extends IOrderReportState{
  OrderReportInit();
}
class EmployeePaymentLoading extends IOrderReportState{
  late bool isLoading;
  EmployeePaymentLoading(isLoading);
}
class EmployeePaymentLoaded extends IOrderReportState{

  List<OrderReportResponseModel?>? myList;
  EmployeePaymentLoaded(this.myList);
}
class EmployeePaymentError extends IOrderReportState{
  String errorMessage;
  EmployeePaymentError(this.errorMessage);
}