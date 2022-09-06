import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

class BalanceReportModel extends IBaseModel<BalanceReportModel>{
  RegisterModel registerModel;
  String? current;
  String? searchedData;

  BalanceReportModel(this.registerModel,this.current,this.searchedData);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['current'] = current ?? "";
    data['data'] = searchedData ?? "";
    return data;
  }

  @override
  BalanceReportModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }



}
