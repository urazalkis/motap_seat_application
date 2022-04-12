import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

import 'login_model.dart';
import 'login_model_response.dart';

class LoginService {
  LocaleManager localeManager = LocaleManager.instance;
  static LoginService instance = LoginService._init();
  LoginService._init();

  Future<LoginModelResponse?> login(RegisterModel registerModel,LoginModel loginModel) async{

      var url = Uri.parse(UrlService.instance.loginUrl);
      Map data = {
        'db_name': registerModel.dbName,
        'db_userName': registerModel.dbUserName,
        'db_password': registerModel.dbPassword,
        'userName': loginModel.userName,
        'password': loginModel.password,
      };
      var responseRaw = await http.post(url, body: data);

      var jsonData = json.decode(responseRaw.body);
      var jsonObject = jsonData["status"];
      var response = LoginModelResponse.fromJson(jsonObject);

      if(responseRaw.statusCode==200){
        return response;
      }
      else{
        return null;
      }

  }
}