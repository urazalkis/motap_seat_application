import 'package:flutter/foundation.dart';
import 'package:motaperp_seat_application/core/base/model/base_error.dart';

/*abstract class IResponseModel<T,R> {
  T? data;
  BaseError? error;
  R fromJson(Map<String, Object> json);
  Map<String, Object?> toJson(R instance) => <String, dynamic>{};
}
class ResponseModel<T,R> extends IResponseModel<T,R>  {
  @override
  T? data;
  @override
  BaseError? error;

  ResponseModel({this.data, this.error});

  @override
  R fromJson(Map<String, Object> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, Object?> toJson(R instance) => <String, dynamic> {
  };

}*/

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {
  void statusCode() {}
}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T? data;
  @override
  final IErrorModel? error;

  ResponseModel({this.data, this.error});
}
