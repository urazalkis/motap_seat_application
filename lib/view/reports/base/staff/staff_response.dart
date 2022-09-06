import 'package:motaperp_seat_application/core/base/model/base_model.dart';

class StaffResponseModel extends IBaseModel<StaffResponseModel>{
  String? id;
  String? name;
  String? address;
  String? tel;
  String? entranceDate;
  String? leaveDate;
  String? salary;
  String? roadWage;
  String? mealWage;
  String? status;
  String? salaryStatus;
  String? bloodGroup;
  String? department;


  StaffResponseModel(
  {this.id,this.name,this.address,this.tel,this.entranceDate,this.leaveDate,this.salary,this.roadWage,this.mealWage,this.status,this.salaryStatus,
    this.bloodGroup,this.department}
      );

   StaffResponseModel.fromJson(Map<String,dynamic> json){
  id =    json["ID"] as  String? ?? "";
  name =    json["AdSoyad"] as  String? ?? "";
  address =    json["Adres"] as  String? ?? "";
  tel =    json["GSM"] as  String? ?? "";
  entranceDate =    json["GirisTarihi"] as  String? ?? "";
  leaveDate =    json["AyrilmaTarihi"] as  String? ?? "";
  salary =    json["Maas"] as  String? ?? "";
  roadWage =    json["Yol"] as  String? ?? "";
  mealWage =    json["Yemek"] as  String? ?? "";
  status =    json["Durumu"] as  String? ?? "";
  salaryStatus =    json["UcretDurumu"] as  String? ?? "";
  bloodGroup =    json["KanGrubu"] as  String? ?? "";
  department =    json["DepartmanAdi"] as  String? ?? "";


   }

  @override
  StaffResponseModel fromJson(Map<String, dynamic> json) {
    return StaffResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
