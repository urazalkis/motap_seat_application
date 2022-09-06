import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

class OrderReportModel extends IBaseModel<OrderReportModel>{
  RegisterModel registerModel;
  String? current;
  String? searchedData;
  String? minDate;
  String? maxDate;

  OrderReportModel(this.registerModel,this.current,this.searchedData,this.minDate,this.maxDate);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['current'] = current ?? "";
    data['data'] = searchedData ?? "";
    data['minDate'] = minDate ?? "";
    data['maxDate'] = maxDate ?? "";
    return data;
  }

  @override
  OrderReportModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }



}
