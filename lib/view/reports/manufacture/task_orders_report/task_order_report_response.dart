import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class TaskOrderReportResponseModel extends IBaseModel<TaskOrderReportResponseModel>{
  String? modelName;
  String? sofaType;
  String? total;
  String? cuted;
  String? unCut;
  String? planted;
  String? unPlanted;
  String? onProduction;
  String? tacked;
  String? notTacked;
  String? delivered;
  String? waiting;


  TaskOrderReportResponseModel(
  {this.modelName,this.sofaType,this.total,this.cuted,this.unCut,
    this.planted,this.unPlanted,this.onProduction,this.tacked,this.notTacked,this.delivered
    ,this.waiting}
      );

   TaskOrderReportResponseModel.fromJson(Map<String,dynamic> json){
     modelName = json["ModelAdi"] as String?;
     sofaType = json["KoltukTuru"] as String?;
     total = json["Toplam"] as String?;
     cuted = json["Kesilen"] as String?;
     unCut = json["Kesilmeyen"] as String?;
     planted = json["Dikilen"] as String?;
     unPlanted = json["Dikilmeyen"] as String?;
     onProduction = json["Uretimde"] as String?;
     tacked = json["Cakilan"] as String?;
     notTacked = json["Cakilmayan"] as String?;
     delivered = json["SevkEdilen"] as String?;
     waiting = json["Bekleyen"] as String?;


   }

  @override
  TaskOrderReportResponseModel fromJson(Map<String, dynamic> json) {
    return TaskOrderReportResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
