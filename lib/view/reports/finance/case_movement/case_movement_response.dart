import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class CaseMovementResponseModel extends IBaseModel<CaseMovementResponseModel>{
  String? type;
  String? amount;
  String? currencyType;
  String? accountNumber;
  String? annexNumber;
  String? bank;
  String? caseType;



  CaseMovementResponseModel(
  {this.type,this.amount,this.currencyType,this.accountNumber,this.annexNumber,this.bank,this.caseType}
      );

   CaseMovementResponseModel.fromJson(Map<String,dynamic> json){
     type = json["Turu"] as String?;
     amount = json["Toplam"] as String?;
     currencyType = json["DovizTuru"] as String? ?? "";
     accountNumber = json["HesapNo"] as String? ?? "";
     annexNumber = json["EkNo"] as String? ?? "";
     bank = json["Banka"] as String? ?? "";
     caseType = json["KasaTuru"] as String? ?? "";

   }

  @override
  CaseMovementResponseModel fromJson(Map<String, dynamic> json) {
    return CaseMovementResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }

/*
class OrderReportResponse{
  List<OrderReportList> orderList;

  OrderReportResponse(this.orderList);

  factory OrderReportResponse.fromJson(Map<String,dynamic> json){
    var jsonArray = json["orderSummaryList"] as List;
    List<OrderReportList> orderReportList = jsonArray.map((jsonArrayObject) =>
        OrderReportList.fromJson(jsonArrayObject)).toList();

    return OrderReportResponse(orderReportList);
  }
}

class OrderReportList{
  String? systemNo;
  String? orderDate;
  String? deliveryDate;
  String? title;
  String? customerName;
  String? type;
  String? modelName;
  String? label;
  String? skelationtatus;
  String? whiteningStatus;
  String? cutStatus;
  String? plantStatus;
  String? tackStatus;
  String? qualityControlStatus;
  String? packageStatus;
  String? storageStatus;
  String? shippingStatus;
  String? accountingSatatus;



  OrderReportList(
      this.systemNo,this.orderDate,this.deliveryDate,this.title,this.customerName,this.type,this.modelName,this.label,
      this.skelationtatus,this.whiteningStatus,this.cutStatus,this.plantStatus,this.tackStatus,this.qualityControlStatus,this.packageStatus,this.storageStatus,
      this.shippingStatus,this.accountingSatatus
      );

  factory OrderReportList.fromJson(Map<String,dynamic> json){
    return OrderReportList(
      json["SistemNo"] as dynamic,
      json["SiparisTarihi"] as dynamic,
      json["TeslimTarihi"] as dynamic,
      json["Unvan"] as dynamic,
      json["MusteriAdi"] as dynamic,
      json["Turu"] as dynamic,
      json["ModelAdi"] as dynamic,
      json["Yazdirma"] as dynamic,
      json["IskeletDurum"] as dynamic,
      json["BeyazlamaDurum"] as dynamic,
      json["KesimDurum"] as dynamic,
      json["DikimDurum"] as dynamic,
      json["CakimDurum"] as dynamic,
      json["CakimSonuc"] as dynamic,
      json["PaketlemeDurum"] as dynamic,
      json["DepoDurum"] as dynamic,
      json["SevkDurum"] as dynamic,
      json["MuhasebeDurum"] as dynamic,
    );

  }
}*/