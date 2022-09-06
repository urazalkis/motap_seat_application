import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class CheckMovementResponseModel extends IBaseModel<CheckMovementResponseModel>{
  String? checkMovement;
  String? checkSystemNo;
  String? systemNo;
  String? checkStatus;
  String? checkBank;
  String? current;
  String? checkType;
  String? drawPlace;
  String? checkNo;
  String? checkHolder;
  String? checkHolderTc;
  String? expiryDate;
  String? amount;
  String? explanation;
  String? currencyType;


  CheckMovementResponseModel(
  { this.checkMovement,this.checkSystemNo,this.systemNo,this.checkStatus,this.checkBank,this.current,this.checkType,
  this.drawPlace,this.checkNo,this.checkHolder,this.checkHolderTc,this.expiryDate,this.amount,this.explanation,
  this.currencyType}
      );

   CheckMovementResponseModel.fromJson(Map<String,dynamic> json){
     checkMovement = json["CekHareket"] as String?;
     checkSystemNo = json["CekSistemNo"] as String?;
     systemNo = json["SistemNo"] as String?;
     checkStatus = json["CekDurum"] as String?;
     checkBank = json["CekBankasi"] as String?;
     current = json["Cari"] as String?;
     checkType = json["CekTuru"] as String?;
     drawPlace = json["KesideYeri"] as String?;
     checkNo = json["CekNo"] as String?;
     checkHolder = json["CekSahibi"] as String?;
     checkHolderTc = json["CekSahibiTCKN"] as String?;
     expiryDate = json["VadeTarihi"] as String?;
     amount = json["Tutar"] as String?;
     explanation = json["Aciklama"] as String?;
     currencyType = json["DovizTuru"] as String?;

   }

  @override
  CheckMovementResponseModel fromJson(Map<String, dynamic> json) {
    return CheckMovementResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
