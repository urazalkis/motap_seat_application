import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/register/register_model_response.dart';
class RegisterService {
  static RegisterService instance = RegisterService._init();
  RegisterService._init();
  Future<RegisterModelResponse?> register(RegisterModel registerModel) async{
      var url = Uri.parse(UrlService.instance.registerUrl);
      Map data = {
        'db_name': registerModel.dbName,
        'db_userName': registerModel.dbUserName,
        'db_password': registerModel.dbPassword,
      };
      var responseRaw = await http.post(url, body: data);

      var jsonData = json.decode(responseRaw.body);
      var jsonObject = jsonData["status"];
      var response = RegisterModelResponse.fromJson(jsonObject);

      if(responseRaw.statusCode==200){
        return response;
      }
      else{
        return null;
      }

  }
}