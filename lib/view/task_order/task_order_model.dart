import 'package:motaperp_seat_application/core/base/model/base_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';

class TaskOrderModel extends IBaseModel<TaskOrderModel>{
  RegisterModel registerModel;
  String qrCodeResult;
  String? staffId;

  TaskOrderModel({required this.registerModel,required this.qrCodeResult,this.staffId});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['qrCodeResult'] = qrCodeResult;
    data['staffId'] = staffId ?? "";
    return data;
  }

  @override
  TaskOrderModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }



}
