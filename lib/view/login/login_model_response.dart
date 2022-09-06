import 'package:flutter/src/foundation/basic_types.dart';
import 'package:motaperp_seat_application/core/base/model/base_error.dart';
import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_response_model.dart';

class LoginModelResponse extends IBaseModel<LoginModelResponse>{

  int? success;
  BaseError? error;
  String? adminStatus;
  String? staffName;
  String? staffId;
  String? departmentId;



  LoginModelResponse({this.success,this.adminStatus,this.staffName,this.staffId,this.departmentId,this.error});


  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    adminStatus = json['adminStatus'] as String?;
    staffName = json['staffName'] as String?;
    staffId = json['staffId'] as String?;
    departmentId = json['departmentId'] as String?;
    error!.message = json['errorMessage'] as String?;
  // BaseError.fromJson(json['errorMessage']);
  }
  @override
  LoginModelResponse fromJson(Map<String, dynamic> json) {
    return LoginModelResponse.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['adminStatus'] = adminStatus;
    data['staffName'] = staffName;
    data['staffId'] = staffId;
    data['departmentId'] = departmentId;
    data['errorMessage'] = error!.message;
    return data;
  }


 /* factory LoginModelResponse.fromJson(Map<String,dynamic> json){
    return LoginModelResponse(json["success"] as int?,json["adminStatus"] as String?,json["staffName"] as String?
        ,json["staffId"] as String?,json["departmentId"] as String?,json["errorMessage"] as String?);
  }*/


/*  @override
  Map<String, dynamic> toJson(LoginModelResponse instance) => <String, dynamic>{
    'success': instance.success,
    'adminStatus': instance.adminStatus,
    'staffName': instance.staffName,
    'staffId': instance.staffId,
    'departmentId': instance.departmentId,
    'errorMessage': instance.error!.message,
  };*/

 /* Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['adminStatus'] = adminStatus;
    data['staffName'] = staffName;
    data['staffId'] = staffId;
    return data;
  }*/

}
