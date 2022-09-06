class RegisterModelResponse{
  int success;
  String? errorMessage;

  RegisterModelResponse(this.success,this.errorMessage);

  factory RegisterModelResponse.fromJson(Map<String,dynamic> json){
    return RegisterModelResponse(json["success"] as int,json["errorMessage"] as String?);
  }
}
