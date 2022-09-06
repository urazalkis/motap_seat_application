import 'package:motaperp_seat_application/core/base/model/base_error.dart';
import 'package:motaperp_seat_application/core/base/model/base_model.dart';
class OrderReportList extends IBaseModel<OrderReportList> {
  List<OrderReportResponseModel>? myList;
  BaseError? error;
  OrderReportList({this.myList});

  OrderReportList.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    myList = json['orderSummaryList'] as List<OrderReportResponseModel>?;
    error!.message = json['errorMessage'] as String?;
  }
  @override
  OrderReportList fromJson(Map<String, dynamic> json) {
    return OrderReportList.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  /*factory OrderReportList.fromJson(Map<String,dynamic> json){
    var jsonArray = json["orderSummaryList"] as List;
    List<OrderReportResponseModel> myList = jsonArray.map((jsonArrayObject) =>
        OrderReportResponseModel.fromJson(jsonArrayObject)).toList();

    return OrderReportList(myList);
  }*/
}
class OrderReportResponseModel extends IBaseModel<OrderReportResponseModel>{
  List<OrderReportResponseModel?>? myList;
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



  OrderReportResponseModel(
  {this.systemNo,this.orderDate,this.deliveryDate,this.title,this.customerName,this.type,this.modelName,this.label,
      this.skelationtatus,this.whiteningStatus,this.cutStatus,this.plantStatus,this.tackStatus,this.qualityControlStatus,this.packageStatus,this.storageStatus,
      this.shippingStatus,this.accountingSatatus}
      );

   OrderReportResponseModel.fromJson(Map<String,dynamic> json){
   systemNo =  json["SistemNo"] as String?;
   orderDate =  json["SiparisTarihi"] as String?;
   deliveryDate =  json["TeslimTarihi"] as String?;
   title =  json["Unvan"] as String?;
   customerName =  json["MusteriAdi"] as String?;
   type =  json["Turu"] as String?;
   modelName =  json["ModelAdi"] as String?;
   label =  json["Yazdirma"] as String?;
   skelationtatus =  json["IskeletDurum"] as String?;
   whiteningStatus =  json["BeyazlamaDurum"] as String?;
   cutStatus =  json["KesimDurum"] as String?;
   plantStatus =  json["DikimDurum"] as String?;
   tackStatus =  json["CakimDurum"] as String?;
   qualityControlStatus =  json["CakimSonuc"] as String?;
   packageStatus =  json["PaketlemeDurum"] as String?;
   storageStatus =  json["DepoDurum"] as String?;
   shippingStatus =  json["SevkDurum"] as String?;
   accountingSatatus =  json["MuhasebeDurum"] as String?;
   }

  @override
  OrderReportResponseModel fromJson(Map<String, dynamic> json) {
    return OrderReportResponseModel.fromJson(json);
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