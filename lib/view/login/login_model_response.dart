class LoginModelResponse{
  int? success;
  String? adminStatus;
  String? staffName;
  String? staffId;
  String? departmentId;
  String? errorMessage;

  LoginModelResponse(this.success,this.adminStatus,this.staffName,this.staffId,this.departmentId,this.errorMessage);

  factory LoginModelResponse.fromJson(Map<String,dynamic> json){
    return LoginModelResponse(json["success"] as int?,json["adminStatus"] as String?,json["staffName"] as String?
        ,json["staffId"] as String?,json["departmentId"] as String?,json["errorMessage"] as String?);
  }
}
