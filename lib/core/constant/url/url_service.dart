class UrlService {
  static UrlService instance = UrlService._init();
  UrlService._init();

  final registerUrl = "https://www.motaperp.com/UrazMobil/MoTapService/Common/register.php";
  final loginUrl = "https://www.motaperp.com/UrazMobil/MoTapService/Common/login.php";
  final orderInformationUrl = "https://www.motaperp.com/UrazMobil/MoTapService/TaskOrder/orderInformation.php";
  final stationStatusUrl = "https://www.motaperp.com/UrazMobil/MoTapService/TaskOrder/getStationStatus.php";
  final cutUrl = "https://www.motaperp.com/UrazMobil/MoTapService/TaskOrder/cut.php";
  final plantUrl = "https://www.motaperp.com/UrazMobil/MoTapService/TaskOrder/plant.php";
  final tackUrl = "https://www.motaperp.com/UrazMobil/MoTapService/TaskOrder/tack.php";
  final quanlityControlUrl = "https://www.motaperp.com/UrazMobil/MoTapService/TaskOrder/qualityControl.php";
  final shippingUrl = "https://www.motaperp.com/UrazMobil/MoTapService/TaskOrder/shipping.php";


  //reports
  final orderSummaryUrl = "https://www.motaperp.com/UrazMobil/MoTapService/Reports/OrderReport/orderSummaryList.php";
  final orderSummaryFilterUrl = "https://www.motaperp.com/UrazMobil/MoTapService/Reports/OrderReport/orderSummaryListFilter.php";
  final searchOrderSummaryUrl = "https://www.motaperp.com/UrazMobil/MoTapService/Reports/OrderReport/searchOrderSummaryList.php";
  final searchOrderSummaryFilterUrl = "https://www.motaperp.com/UrazMobil/MoTapService/Reports/OrderReport/searchOrderSummaryListFilter.php";

  final currentUrl = "https://www.motaperp.com/UrazMobil/MoTapService/Reports/Current/currentList.php";

}