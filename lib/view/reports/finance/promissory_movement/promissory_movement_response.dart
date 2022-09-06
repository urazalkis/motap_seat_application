import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class PromissoryMovementResponseModel extends IBaseModel<PromissoryMovementResponseModel>{
  String? promissorySystemNo;
  String? systemNo;
  String? promissoryStatus;
  String? promissoryMovement;
  String? title;
  String? deptor;
  String? payee;
  String? tc;
  String? expiryDate;
  String? amount;
  String? explanation;
  String? bankName;
  String? currencyType;


  PromissoryMovementResponseModel(
  {  this.promissorySystemNo,this.systemNo,this.promissoryStatus,this.promissoryMovement,this.title,this.deptor,
    this.payee,this.tc,this.expiryDate,this.amount,this.explanation,this.bankName,this.currencyType,}
      );

   PromissoryMovementResponseModel.fromJson(Map<String,dynamic> json){
     promissorySystemNo = json["SenetSistemNo"] as String?;
     systemNo = json["SistemNo"] as String?;
     promissoryStatus = json["SenetDurum"] as String?;
     promissoryMovement = json["SenetHareket"] as String?;
     title = json["Unvan"] as String?;
     deptor = json["Borclu"] as String?;
     payee = json["Alacakli"] as String?;
     tc = json["TCKN"] as String?;
     expiryDate = json["VadeTarihi"] as String?;
     amount = json["Tutar"] as String?;
     explanation = json["CekSahibiTCKN"] as String?;
     expiryDate = json["Aciklama"] as String?;
     bankName = json["BankaAdi"] as String?;
     currencyType = json["DovizTuru"] as String?;


   }

  @override
  PromissoryMovementResponseModel fromJson(Map<String, dynamic> json) {
    return PromissoryMovementResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
