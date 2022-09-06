import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class WorkingHourResponseModel extends IBaseModel<WorkingHourResponseModel>{
  String? entryDate;
  String? day;
  String? entryHour;
  String? exitHour;
  String? personalName;


  WorkingHourResponseModel(
  {this.entryDate,this.day,this.entryHour,this.exitHour,this.personalName}
      );

   WorkingHourResponseModel.fromJson(Map<String,dynamic> json){
     entryDate = json["GirisTarihi"] as String? ?? "";
     day = json["GunAdi"] as String? ?? "";
     entryHour = json["GirisSaat"] as String? ?? "";
     exitHour = json["CikisSaat"] as String? ?? "";
     personalName = json["AdSoyad"] as String? ?? "";


   }

  @override
  WorkingHourResponseModel fromJson(Map<String, dynamic> json) {
    return WorkingHourResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
