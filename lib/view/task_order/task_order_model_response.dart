import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class TaskOrderResponseModel  extends IBaseModel<TaskOrderResponseModel>{
  int?     success;
  String?  errorMessage;
  String?  title;
  String?  customerName;
  String?  combination;
  String?  modelName;
  String?  sofaType;
  String?  fabricName;
  String?  fabricCode;
  String?  legType;
  String?  colour;
  String?  cutStatus;
  String?  plantStatus;
  String?  tackStatus;
  String?  qualityControl;
  String?  shippingStatus;

  TaskOrderResponseModel(
      {this.success,this.errorMessage,this.title, this.customerName, this.combination, this.modelName, this.sofaType,
      this.fabricName, this.fabricCode, this.legType,this.colour,this.cutStatus,this.plantStatus,this.tackStatus,this.qualityControl
      ,this.shippingStatus}
      );

   TaskOrderResponseModel.fromJson(Map<String,dynamic> json){
      success = json["success"] as int? ;
      errorMessage = json["errorMessage"] as String? ?? "";
      title = json["unvan"] as String? ?? "";
      customerName = json["musteriAdi"] as String? ?? "";
      combination = json["kombinasyon"] as String? ?? "";
      modelName = json["modelAdi"] as String? ?? "";
      sofaType = json["koltukTuru"] as String? ?? "";
      fabricName = json["kumasAdi"] as String? ?? "";
      fabricCode = json["kumasKodu"] as String? ?? "";
      legType = json["ayakTuru"] as String? ?? "";
      colour = json["renk"] as String? ?? "";
      cutStatus = json["kesimDurum"] as String? ?? "";
      plantStatus = json["dikimDurum"] as String? ?? "";
      tackStatus = json["cakimDurum"] as String? ?? "";
      qualityControl = json["cakimSonuc"] as String? ?? "";
      shippingStatus = json["sevkDurum"] as String? ?? "";

  }

  @override
  TaskOrderResponseModel fromJson(Map<String, dynamic> json) {
    return TaskOrderResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

