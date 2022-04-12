class StationStatusModelResponse{


  String?  cutStatus;
  String?  plantStatus;
  String?  tackStatus;
  String?  qualityControl;
  String?  shippingStatus;

  StationStatusModelResponse(
      this.cutStatus,this.plantStatus,this.tackStatus,this.qualityControl
      ,this.shippingStatus
      );

  factory StationStatusModelResponse.fromJson(Map<String,dynamic> json){
    return StationStatusModelResponse(
      json["kesimDurum"] as String?,
      json["dikimDurum"] as String?,
      json["cakimDurum"] as String?,
      json["cakimSonuc"] as String?,
      json["sevkDurum"] as String?,
    );

  }
}

