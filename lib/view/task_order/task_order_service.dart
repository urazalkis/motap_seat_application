import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/view/task_order/station_status_model_response.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_model_response.dart';


class TaskOrderService {
  LocaleManager localeManager = LocaleManager.instance;
  static TaskOrderService instance = TaskOrderService._init();
  TaskOrderService._init();


  Future<TaskOrderModelResponse?> orderInformation(String qrCodeResult) async{

    var url = Uri.parse(UrlService.instance.orderInformationUrl);

    Map mapData = {
      'db_name': localeManager.getStringValue(PreferencesKeys.dbName),
      'db_userName': localeManager.getStringValue(PreferencesKeys.dbUserName),
      'db_password': localeManager.getStringValue(PreferencesKeys.dbPassword),
      'id': qrCodeResult,
    };
    var responseRaw = await http.post(url, body: mapData);

    print(responseRaw.body);

    var jsonData = json.decode(responseRaw.body);
    var jsonObject = jsonData["data"];
    var response = TaskOrderModelResponse.fromJson(jsonObject);

    if(responseRaw.statusCode==200){
      return response;
    }
    else{
      return null;
    }

  }
  Future<StationStatusModelResponse?> stationStatus(String qrCodeResult) async{

    var url = Uri.parse(UrlService.instance.orderInformationUrl);

    Map mapData = {
      'db_name': localeManager.getStringValue(PreferencesKeys.dbName),
      'db_userName': localeManager.getStringValue(PreferencesKeys.dbUserName),
      'db_password': localeManager.getStringValue(PreferencesKeys.dbPassword),
      'id': qrCodeResult,
    };
    var responseRaw = await http.post(url, body: mapData);

    print(responseRaw.body);

    var jsonData = json.decode(responseRaw.body);
    var jsonObject = jsonData["data"];
    var response = StationStatusModelResponse.fromJson(jsonObject);

    if(responseRaw.statusCode==200){
      return response;
    }
    else{
      return null;
    }

  }
  Future<TaskOrderModelResponse?> cut(String qrCodeResult) async{

    var url = Uri.parse(UrlService.instance.cutUrl);

    Map mapData = baseMapData(qrCodeResult);

    var responseRaw = await http.post(url, body: mapData);

    print(responseRaw.body);

    var jsonData = json.decode(responseRaw.body);
    var jsonObject = jsonData["status"];
    var response = TaskOrderModelResponse.fromJson(jsonObject);

    if(responseRaw.statusCode==200){
      return response;
    }
    else{
      return null;
    }

  }
  Future<TaskOrderModelResponse?> plant(String qrCodeResult) async{

    var url = Uri.parse(UrlService.instance.plantUrl);


    Map mapData = baseMapData(qrCodeResult);

    var responseRaw = await http.post(url, body: mapData);

    print(responseRaw.body);

    var jsonData = json.decode(responseRaw.body);
    var jsonObject = jsonData["status"];
    var response = TaskOrderModelResponse.fromJson(jsonObject);

    if(responseRaw.statusCode==200){
      return response;
    }
    else{
      return null;
    }
  }
  Future<TaskOrderModelResponse?> tack(String qrCodeResult) async{

    var url = Uri.parse(UrlService.instance.tackUrl);


    Map mapData = baseMapData(qrCodeResult);

    var responseRaw = await http.post(url, body: mapData);

    print(responseRaw.body);

    var jsonData = json.decode(responseRaw.body);
    var jsonObject = jsonData["status"];
    var response = TaskOrderModelResponse.fromJson(jsonObject);

    if(responseRaw.statusCode==200){
      return response;
    }
    else{
      return null;
    }

  }
  Future<TaskOrderModelResponse?> qualityControl(String qrCodeResult) async{

    var url = Uri.parse(UrlService.instance.quanlityControlUrl);


    Map mapData = baseMapData(qrCodeResult);

    var responseRaw = await http.post(url, body: mapData);

    print(responseRaw.body);

    var jsonData = json.decode(responseRaw.body);
    var jsonObject = jsonData["status"];
    var response = TaskOrderModelResponse.fromJson(jsonObject);

    if(responseRaw.statusCode==200){
      return response;
    }
    else{
      return null;
    }

  }
  Future<TaskOrderModelResponse?> shipping(String qrCodeResult) async{

    var url = Uri.parse(UrlService.instance.shippingUrl);

    Map mapData = baseMapData(qrCodeResult);

    var responseRaw = await http.post(url, body: mapData);

    print(responseRaw.body);

    var jsonData = json.decode(responseRaw.body);
    var jsonObject = jsonData["status"];
    var response = TaskOrderModelResponse.fromJson(jsonObject);

    if(responseRaw.statusCode==200){
      return response;
    }
    else{
      return null;
    }

  }

  Map baseMapData(String qrCodeResult){
    Map data = {
      'db_name': localeManager.getStringValue(PreferencesKeys.dbName),
      'db_userName': localeManager.getStringValue(PreferencesKeys.dbUserName),
      'db_password': localeManager.getStringValue(PreferencesKeys.dbPassword),
      'id' : qrCodeResult,
      'staffId' : localeManager.getStringValue(PreferencesKeys.staffId),
    };

    return data;

  }

}