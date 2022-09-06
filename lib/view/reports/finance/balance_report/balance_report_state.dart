import 'balance_report_model_response.dart';

abstract class IBalanceReportState{
  IBalanceReportState();

}

class BalanceReportInit extends IBalanceReportState{
  BalanceReportInit();
}
class CaseMovementLoading extends IBalanceReportState{
  late bool isLoading;
  CaseMovementLoading(isLoading);
}
class BalanceReportLoaded extends IBalanceReportState{

  List<BalanceReportResponseModel?>? myList;
  BalanceReportLoaded(this.myList);
}
class BalanceReportError extends IBalanceReportState{
  String errorMessage;
  BalanceReportError(this.errorMessage);
}