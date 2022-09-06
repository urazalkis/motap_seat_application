import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class AbsentStaffResponseModel extends IBaseModel<AbsentStaffResponseModel>{
  String? employeeName;
  String? status;


  AbsentStaffResponseModel(
  {this.employeeName,this.status}
      );

   AbsentStaffResponseModel.fromJson(Map<String,dynamic> json){
     employeeName = json["AdSoyad"] as String?;
     status = json["GelmeDurumu"] as String?;


   }

  @override
  AbsentStaffResponseModel fromJson(Map<String, dynamic> json) {
    return AbsentStaffResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
