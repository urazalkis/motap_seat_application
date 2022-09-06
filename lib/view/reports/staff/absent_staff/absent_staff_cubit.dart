import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'absent_staff_model.dart';
import 'absent_staff_response.dart';
import 'absent_staff_service.dart';
import 'absent_staff_state.dart';

class AbsentStaffCubit extends Cubit<IAbsentStaffState>  with IBaseViewModel
{

  IAbsentStaffService? absentStaffService;
  BaseReportViewModel baseReportViewModel = BaseReportViewModel();
 bool isLoading = false;
  AbsentStaffCubit({this.absentStaffService}):super(AbsentStaffInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getAbsentStaffList() async {
    try{
      changeLoading();
      emit(AbsentStaffLoading(isLoading));

      baseReportViewModel.setDbInformation();
        final response = await absentStaffService!.absentStaffList(
            AbsentStaffModel(
                RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword),null,),
            AbsentStaffResponseModel());
        emit(AbsentStaffLoaded(response));
        changeLoading();
        print("başarılı");

    }
    catch(e){
      emit(AbsentStaffError("Detay Bilgileri Alınamadı $e"));
    }
  }


  Future<void> searchData(String? searchedData) async {
    try{
      changeLoading();
      emit(AbsentStaffLoading(isLoading));

      baseReportViewModel.setDbInformation();

      final response = await absentStaffService!.searchData(
          AbsentStaffModel(
              RegisterModel(baseReportViewModel.dbName,baseReportViewModel.dbUserName,baseReportViewModel.dbPassword),searchedData),
          AbsentStaffResponseModel());

      emit(AbsentStaffLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(AbsentStaffError("Detay Bilgileri Alınamadı $e"));
    }
  }

  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}