import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

class CheckMovementModel extends IBaseModel<CheckMovementModel>{
  RegisterModel registerModel;
  String? searchedData;

  CheckMovementModel(this.registerModel,this.searchedData);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['data'] = searchedData ?? "";
    return data;
  }

  @override
  CheckMovementModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }



}
