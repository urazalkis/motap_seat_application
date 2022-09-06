import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

class TaskOrderReportModel extends IBaseModel<TaskOrderReportModel>{
  RegisterModel registerModel;
  String? searchedData;
  String? minDate;
  String? maxDate;

  TaskOrderReportModel({required this.registerModel,this.searchedData,this.minDate, this.maxDate});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['minDate'] = minDate ?? "";
    data['maxDate'] = maxDate ?? "";
    data['data'] = searchedData ?? "";
    return data;
  }

  @override
  TaskOrderReportModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
