class TaskOrderModelResponse{
  int? success;
  String? errorMessage;

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

  TaskOrderModelResponse(
  this.success,this.errorMessage,this.title, this.customerName, this.combination, this.modelName, this.sofaType,
      this.fabricName, this.fabricCode, this.legType,this.colour,this.cutStatus,this.plantStatus,this.tackStatus,this.qualityControl
      ,this.shippingStatus
      );

  factory TaskOrderModelResponse.fromJson(Map<String,dynamic> json){
    return TaskOrderModelResponse(
      json["success"] as int?,
      json["errorMessage"] as String?,
      json["unvan"] as String?,
      json["musteriAdi"] as String?,
      json["kombinasyon"] as String?,
      json["modelAdi"] as String?,
      json["koltukTuru"] as String?,
      json["kumasAdi"] as String?,
      json["kumasKodu"] as String?,
      json["ayakTuru"] as String?,
      json["renk"] as String?,
      json["kesimDurum"] as String?,
      json["dikimDurum"] as String?,
      json["cakimDurum"] as String?,
      json["cakimSonuc"] as String?,
      json["sevkDurum"] as String?,
    );

  }
}

