import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class BalanceReportResponseModel extends IBaseModel<BalanceReportResponseModel>{
  String? currentType;
  String? currentTitle;
  String? totalDeptReceive;
  String? currencyType;
  String? status;



  BalanceReportResponseModel(
  {this.currentType,this.currentTitle,this.totalDeptReceive,this.currencyType,this.status}
      );

   BalanceReportResponseModel.fromJson(Map<String,dynamic> json){
     currentType = json["CariTuru"] as String?;
     currentTitle = json["Unvan"] as String?;
     totalDeptReceive = json["BorcAlacak"] as String?;
     currencyType = json["DovizTuru"] as String?;
     status = json["Durumu"] as String?;
   }

  @override
  BalanceReportResponseModel fromJson(Map<String, dynamic> json) {
    return BalanceReportResponseModel.fromJson(json);
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