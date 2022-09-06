class UrlService {
  static UrlService instance = UrlService._init();
  UrlService._init();

  static const baseServiceUrl = "https://www.motaperp.com/UrazMobil/motap_seat_app/";
  final registerUrl = baseServiceUrl+"authenticate/register.php";
  final loginUrl = baseServiceUrl+"authenticate/login.php";
  final orderInformationUrl = baseServiceUrl+"taskOrder/orderInformation.php";
  final stationStatusUrl = baseServiceUrl+"taskOrder/getStationStatus.php";
  final cutUrl = baseServiceUrl+"taskOrder/cut.php";
  final plantUrl = baseServiceUrl+"taskOrder/plant.php";
  final tackUrl = baseServiceUrl+"taskOrder/tack.php";
  final quanlityControlUrl = baseServiceUrl+"taskOrder/qualityControl.php";
  final shippingUrl = baseServiceUrl+"taskOrder/shipping.php";


  //REPORTS
  final currentUrl = baseServiceUrl+"reports/base/current/currentList.php";
  final staffListUrl = baseServiceUrl+"reports/base/staffList/staffList.php";

  //manufacture
  final orderSummaryUrl = baseServiceUrl+"reports/order/orderReport/orderSummaryList.php";
  final orderSummaryFilterUrl = baseServiceUrl+"reports/order/orderReport/orderSummaryListFilter.php";
  final searchOrderSummaryUrl = baseServiceUrl+"reports/order/orderReport/searchOrderSummaryList.php";
  final searchOrderSummaryFilterUrl = baseServiceUrl+"reports/order/orderReport/searchOrderSummaryListFilter.php";

 //finance
  final balanceReportUrl = baseServiceUrl+"reports/finance/balance/balanceReport.php";
  final searchBalanceReportUrl = baseServiceUrl+"reports/finance/balance/searchBalanceReport.php";

  //case movement
  final caseMovementUrl = baseServiceUrl+"reports/finance/caseMovement/caseMovement.php";
  final searchCaseMovementUrl = baseServiceUrl+"reports/finance/caseMovement/searchCaseMovement.php";

  //check movement
  final checkMovementUrl = baseServiceUrl+"reports/finance/checkMovement/checkMovement.php";
  final searchCheckMovementUrl = baseServiceUrl+"reports/finance/checkMovement/searchCheckMovement.php";

  //promissory movement
  final promissoryMovementUrl = baseServiceUrl+"reports/finance/promissoryMovement/promissoryMovement.php";
  final searchPromissoryMovementUrl = baseServiceUrl+"reports/finance/promissoryMovement/searchPromissoryMovement.php";

  //staff
  final absentStaffUrl = baseServiceUrl+"reports/staff/absentStaff/absentStaff.php";
  final searchAbsentStaffUrl = baseServiceUrl+"reports/staff/absentStaff/searchAbsentStaff.php";

  //working hour
  final workingHourUrl = baseServiceUrl+"reports/staff/workingHour/workingHour.php";
  final workingHourFilterUrl = baseServiceUrl+"reports/staff/workingHour/workingHourFilter.php";
  final searchWorkingHourUrl = baseServiceUrl+"reports/staff/workingHour/searchWorkingHour.php";
  final searchWorkingHourFilterUrl = baseServiceUrl+"reports/staff/workingHour/searchWorkingHourFilter.php";

  //employee payment
  final employeePaymentUrl = baseServiceUrl+"reports/staff/employeePayment/employeePayment.php";
  final employeePaymentFilterUrl = baseServiceUrl+"reports/staff/employeePayment/employeePaymentFilter.php";
  final searchEmployeePaymentUrl = baseServiceUrl+"reports/staff/employeePayment/searchEmployeePayment.php";
  final searchEmployeePaymentFilterUrl = baseServiceUrl+"reports/staff/employeePayment/searchEmployeePaymentFilter.php";


  //task order report
  final taskOrderReportUrl = baseServiceUrl+"reports/manufacture/taskOrderReport/taskOrderReport.php";
  final taskOrderReportFilterUrl = baseServiceUrl+"reports/manufacture/taskOrderReport/taskOrderReportFilter.php";
  final searchtaskOrderReportUrl = baseServiceUrl+"reports/manufacture/taskOrderReport/searchTaskOrderReport.php";
  final searchtaskOrderReportFilterUrl = baseServiceUrl+"reports/manufacture/taskOrderReport/searchTaskOrderReportFilter.php";

  //planning
  final planningUrl = baseServiceUrl+"reports/manufacture/planning/planning.php";
  final planningFilterUrl = baseServiceUrl+"reports/manufacture/planning/planningFilter.php";
  final searchPlanningUrl = baseServiceUrl+"reports/manufacture/planning/searchPlanning.php";
  final searchPlanningFilterUrl = baseServiceUrl+"reports/manufacture/planning/searchPlanningFilter.php";

}