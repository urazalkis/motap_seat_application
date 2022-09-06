import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class StationStatusResponseModel  extends IBaseModel<StationStatusResponseModel>{
  int?     success;
  String?  errorMessage;
  String?  cutStatus;
  String?  plantStatus;
  String?  tackStatus;
  String?  qualityControl;
  String?  shippingStatus;

  StationStatusResponseModel(
      {this.success,this.errorMessage,this.cutStatus,this.plantStatus,this.tackStatus,this.qualityControl
        ,this.shippingStatus}
      );

  StationStatusResponseModel.fromJson(Map<String,dynamic> json){
    success = json["success"] as int?;
    errorMessage = json["errorMessage"] as String?;
    cutStatus = json["kesimDurum"] as String?;
    plantStatus = json["dikimDurum"] as String?;
    tackStatus = json["cakimDurum"] as String?;
    qualityControl = json["cakimSonuc"] as String?;
    shippingStatus = json["sevkDurum"] as String?;
  }

  @override
  StationStatusResponseModel fromJson(Map<String, dynamic> json) {
    return StationStatusResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}



