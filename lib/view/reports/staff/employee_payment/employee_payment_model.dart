import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

class EmployeePaymentModel extends IBaseModel<EmployeePaymentModel>{
  RegisterModel registerModel;
  String? employee;
  String? searchedData;
  String? minDate;
  String? maxDate;

  EmployeePaymentModel(this.registerModel,this.employee,this.searchedData,this.minDate,this.maxDate);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['employee'] = employee ?? "";
    data['data'] = searchedData ?? "";
    data['minDate'] = minDate ?? "";
    data['maxDate'] = maxDate ?? "";
    return data;
  }

  @override
  EmployeePaymentModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }



}
