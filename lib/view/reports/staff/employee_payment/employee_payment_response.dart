import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class EmployeePaymentResponseModel extends IBaseModel<EmployeePaymentResponseModel>{
  String? tc;
  String? employeeName;
  String? title;
  String? customerName;
  String? orderNo;
  String? modelName;
  String? type;
  String? payment;
  String? paymentDate;
  String? id;
  String? explanation;



  EmployeePaymentResponseModel(
  {this.tc,this.employeeName,this.title,this.customerName,this.orderNo,this.modelName,this.type,this.payment,
    this.paymentDate,this.id,this.explanation}
      );

   EmployeePaymentResponseModel.fromJson(Map<String,dynamic> json){
    tc = json["TCKN"] as String?;
    employeeName = json["AdSoyad"] as String?;
    title = json["Unvan"] as String?;
    customerName = json["MusteriAdi"] as String?;
    orderNo = json["SiparisNo"] as String?;
    modelName = json["ModelAdi"] as String?;
    type = json["Turu"] as String?;
    payment = json["Hakedis"] as String?;
    paymentDate = json["HakedisTarihi"] as String?;
    id = json["ID"] as String?;
    explanation = json["Aciklama"] as String? ?? "";
   }

  @override
  EmployeePaymentResponseModel fromJson(Map<String, dynamic> json) {
    return EmployeePaymentResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
