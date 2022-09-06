import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'order_report_model.dart';
import 'order_report_model_response.dart';

abstract class  IOrderReportService{
  Future<dynamic> orderListWithFilter(OrderReportModel model,OrderReportResponseModel responseModel);
  Future<dynamic>  searchData(OrderReportModel model,OrderReportResponseModel responseModel);
  Future<dynamic> searchDataWithFilter(OrderReportModel model,OrderReportResponseModel responseModel);
  Future<dynamic> orderList(OrderReportModel model,OrderReportResponseModel responseModel);
}

class OrderReportService implements IOrderReportService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> orderList(OrderReportModel model, OrderReportResponseModel responseModel) async {

    final response = await networkManager!.responseList<OrderReportModel, OrderReportResponseModel>(model, responseModel, UrlService.instance.orderSummaryUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }

  @override
  Future<dynamic> orderListWithFilter(OrderReportModel model,
      OrderReportResponseModel responseModel) async {
    final response = await networkManager!.responseList<OrderReportModel, OrderReportResponseModel>(model, responseModel, UrlService.instance.orderSummaryFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

  @override
  Future<dynamic> searchData(OrderReportModel model,
      OrderReportResponseModel responseModel) async {
    final response = await networkManager!.responseList<OrderReportModel, OrderReportResponseModel>(model, responseModel, UrlService.instance.searchOrderSummaryUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

  @override
  Future<dynamic> searchDataWithFilter(OrderReportModel model,
      OrderReportResponseModel responseModel) async {
    final response = await networkManager!.responseList<OrderReportModel, OrderReportResponseModel>(model, responseModel, UrlService.instance.searchOrderSummaryFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }
}
/*
abstract class  IOrderReportService{
  Future<List<OrderReportResponseModel>> orderListWithFilter(String? current,String? minDate,String? maxDate);
  Future<List<OrderReportResponseModel>>  searchData(String? current,String? find);
  Future<List<OrderReportResponseModel>> searchDataWithFilter(String? current,String? find,String?minDate,String? maxDate);
  Future<List<OrderReportResponseModel>> orderList(String? current);
}

class OrderReportService implements IOrderReportService {
  LocaleManager localeManager = LocaleManager.instance;
  BaseReportViewModel baseReportFunctions = BaseReportViewModel();

  List<OrderReportResponseModel> parseOrderReportList(String response) {
    var jsonData = json.decode(response);
    var orderResponse = OrderReportResponse.fromJson(jsonData);
    List<OrderReportResponseModel> orderList = orderResponse.orderList;
    return orderList;
  }
  @override
  Future<List<OrderReportResponseModel>> orderList(String? current) async {
    var url =Uri.parse(UrlService.instance.orderSummaryUrl);
    current ?? " ";
    Map mapData = baseReportFunctions.baseMapData();
    mapData.putIfAbsent("current", () => current);
    var response = await http.post(url, body:   mapData);
    return parseOrderReportList(response.body);
  }
  @override
  Future<List<OrderReportResponseModel>> orderListWithFilter(String? current,String? minDate,String? maxDate) async {

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
  Future<List<OrderReportResponseModel>> searchData(String? current,String? data) async {
    var url = Uri.parse(UrlService.instance.searchOrderSummaryUrl);
    current ?? "";
    Map mapData = baseReportFunctions.baseMapData();
    mapData.putIfAbsent("current", () => current);
    mapData.putIfAbsent("data", () => data);


    var response = await http.post(url, body: mapData);
    return parseOrderReportList(response.body);
  }
  @override
  Future<List<OrderReportResponseModel>> searchDataWithFilter(String? current,String? data,String? minDate,String? maxDate) async {
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


}*/