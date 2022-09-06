
import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_response_model.dart';

class BaseError extends IErrorModel implements IBaseModel<BaseError> {
  String? message;

  BaseError({this.message});


  BaseError.fromJson(Map<String, dynamic> json) {
    message = json['errorMessage'] as String?;
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  BaseError fromJson(Map<String, dynamic> json) {
  return  BaseError.fromJson(json);
  }
}
