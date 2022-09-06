import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

class PromissoryMovementModel extends IBaseModel<PromissoryMovementModel>{
  RegisterModel registerModel;
  String? searchedData;

  PromissoryMovementModel(this.registerModel,this.searchedData);

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
  PromissoryMovementModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }



}
