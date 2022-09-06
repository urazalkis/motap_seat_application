import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

class LoginModel extends IBaseModel<LoginModel>{
  RegisterModel registerModel;
  String? userName;
  String? password;


  LoginModel(this.registerModel,this.userName,this.password);

 /* LoginModel.fromJson(Map<String, Object> json) {
    registerModel.dbName = (json['db_name'] as String?)!;
    registerModel.dbUserName = (json['db_userName'] as String?)!;
    registerModel.dbPassword = (json['db_password'] as String?)!;
    userName = json['userName'] as String?;
    password = json['password'] as String?;
  }
  @override
  LoginModel fromJson(Map<String, Object> json) {
    return LoginModel.fromJson(json);
  }*/
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['userName'] = userName;
    data['password'] = password;
    return data;
  }

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }



}
