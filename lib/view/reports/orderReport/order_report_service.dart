import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'order_report_model_response.dart';


abstract class  IOrderReportService{
  Future<List<OrderReportList>> orderListWithFilter(String? current,String? minDate,String? maxDate);
  Future<List<OrderReportList>>  searchData(String? current,String? find);
  Future<List<OrderReportList>> searchDataWithFilter(String? current,String? find,String?minDate,String? maxDate);
  Future<List<OrderReportList>> orderList(String? current);
}

class OrderReportService implements IOrderReportService {
  LocaleManager localeManager = LocaleManager.instance;
  BaseReportViewModel baseReportFunctions = BaseReportViewModel();

  List<OrderReportList> parseOrderReportList(String response) {
    var jsonData = json.decode(response);
    var orderResponse = OrderReportResponse.fromJson(jsonData);
    List<OrderReportList> orderList = orderResponse.orderList;
    return orderList;
  }
  @override
  Future<List<OrderReportList>> orderList(String? current) async {
    var url =Uri.parse(UrlService.instance.orderSummaryUrl);
    current ?? " ";
    Map mapData = baseReportFunctions.baseMapData();
    mapData.putIfAbsent("current", () => current);
    var response = await http.post(url, body:   mapData);
    return parseOrderReportList(response.body);
  }
  @override
  Future<List<OrderReportList>> orderListWithFilter(String? current,String? minDate,String? maxDate) async {

    var url =Uri.parse(UrlService.instance.orderSummaryFilterUrl);

    current ?? "";
    Map mapData = baseReportFunctions.baseMapData();
   mapData.putIfAbsent("current", () => current);
   mapData.putIfAbsent("minDate", () => minDate);
   mapData.putIfAbsent("maxDate", () => maxDate);

    var response = await http.post(url, body: mapData);
    return parseOrderReportList(response.body);
  }

  @override
  Future<List<OrderReportList>> searchData(String? current,String? data) async {
    var url = Uri.parse(UrlService.instance.searchOrderSummaryUrl);
    current ?? "";
    Map mapData = baseReportFunctions.baseMapData();
    mapData.putIfAbsent("current", () => current);
    mapData.putIfAbsent("data", () => data);


    var response = await http.post(url, body: mapData);
    return parseOrderReportList(response.body);
  }
  @override
  Future<List<OrderReportList>> searchDataWithFilter(String? current,String? data,String? minDate,String? maxDate) async {
    var url = Uri.parse(UrlService.instance.searchOrderSummaryFilterUrl);

    current ?? "";
    Map mapData = baseReportFunctions.baseMapData();
    mapData.putIfAbsent("current", () => current);
    mapData.putIfAbsent("data", () => data);
    mapData.putIfAbsent("minDate", () => minDate);
    mapData.putIfAbsent("maxDate", () => maxDate);

    var response = await http.post(url, body: mapData);
    return parseOrderReportList(response.body);
  }


}