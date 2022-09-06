import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class PlanningResponseModel extends IBaseModel<PlanningResponseModel>{
  String? systemNo;
  String? title;
  String? customerName;
  String? modelName;
  String? combination;
  String? orderDate;
  String? deliveryDate;
  String? planningDate;
  String? orderNumber;

  PlanningResponseModel(
  {this.systemNo,this.title,this.customerName,this.modelName,this.combination,this.orderDate,this.deliveryDate,this.planningDate
    ,this.orderNumber}
      );

   PlanningResponseModel.fromJson(Map<String,dynamic> json){
    systemNo = json["SistemNo"] as String?;
    title = json["Unvan"] as String?;
    customerName = json["MusteriAdi"] as String?;
    modelName = json["ModelAdi"] as String?;
    combination = json["Kombinasyon"] as String?;
    orderDate = json["SiparisTarihi"] as String?;
    deliveryDate = json["TeslimTarihi"] as String?;
    planningDate = json["PlanlamaTarihi"] as String?;
    orderNumber = json["SiparisNumara"] as String?;

   }

  @override
  PlanningResponseModel fromJson(Map<String, dynamic> json) {
    return PlanningResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
