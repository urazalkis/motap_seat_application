import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/base/model/base_error.dart';
import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/core/constant/message/error_message.dart';
import 'http_response_model.dart';

class HttpManager {
  static HttpManager? _instance;

  static HttpManager? get instance => _instance ??= HttpManager._init();

  HttpManager._init();


  Future<IResponseModel<dynamic>> response<T extends IBaseModel,R extends IBaseModel>(T model, R responseModel, String url) async {
    var _url = Uri.parse(url);

    var responseRaw = await http.post(_url, body: model.toJson());

    print(responseRaw.body);
    if (responseRaw.statusCode == 200) {
      final response = _responseParser(responseModel, responseRaw);
      print("response type:${response.runtimeType}");

        print("type R");
        if (response is List) {
          return ResponseModel<List<R>>(data: response as List<R>);
        }
        else{
          return ResponseModel<R>(data: response);
        }
    }
    else {
      return ResponseModel(
          error: BaseError(message:ErrorMessage.instance.connectionErrorMessage));
    }
  }
 Future<IResponseModel<List<R>>> responseList<T extends IBaseModel,R extends IBaseModel>(T model, R responseModel, String url) async {
    var _url = Uri.parse(url);

    var responseRaw = await http.post(_url, body: model.toJson());

    print(responseRaw.body);
    if (responseRaw.statusCode == 200) {
      final response = _responseParser(responseModel, responseRaw);
      print("response type:${response.runtimeType}");

        print("type list<R>");
        return ResponseModel<List<R>>(data: response);
    }
    else {
      return ResponseModel(
          error: BaseError(message:ErrorMessage.instance.connectionErrorMessage));
    }
  }
  dynamic _responseParser<R extends IBaseModel>(R responseModel, http.Response responseRaw) {

    var jsonData = json.decode(responseRaw.body);

    if (jsonData is List) {
      print("bu bir liste");
     final parsed = jsonData.cast<Map<String, dynamic>>();
      return parsed.map<R>((json) => responseModel.fromJson(json)).toList();

      var jsonArray = jsonData;
      var responseList = jsonArray.map<R>((jsonArrayObject) =>
          responseModel.fromJson(jsonArrayObject)).toList().cast<Map<String, dynamic>>();
      return responseList;
    }
    else if (jsonData is Map<String,dynamic>) {
      var response = responseModel.fromJson(jsonData);
      print("bu bir map");
      return response;
    }
    print("farklı bir şey");
    return jsonData as R;


  }


}