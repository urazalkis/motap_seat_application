import 'order_report_model_response.dart';

abstract class IOrderReportState{
  IOrderReportState();

}

class OrderReportInit extends IOrderReportState{
  OrderReportInit();
}
class OrderReportLoading extends IOrderReportState{
  late bool isLoading;
  OrderReportLoading(isLoading);
}
class OrderReportLoaded extends IOrderReportState{

  List<OrderReportList> orderList;
  OrderReportLoaded(this.orderList);
}
class OrderReportError extends IOrderReportState{
  String errorMessage;
  OrderReportError(this.errorMessage);
}