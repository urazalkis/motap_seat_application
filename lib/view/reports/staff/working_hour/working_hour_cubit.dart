import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'working_hour_model.dart';
import 'working_hour_response.dart';
import 'working_hour_service.dart';
import 'working_hour_state.dart';

class WorkingHourCubit extends Cubit<IWorkingHourState> with IBaseViewModel
{

  IWorkingHourService? workingHourService;
  BaseReportViewModel baseReportViewModel = BaseReportViewModel();
 bool isLoading = false;
  WorkingHourCubit({this.workingHourService}):super(WorkingHourInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getWorkingHourList() async {

      changeLoading();
      emit(WorkingHourLoading(isLoading));

      baseReportViewModel.setDbInformation();
      final response = await workingHourService!.workingHourList(
          WorkingHourModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword)),
          WorkingHourResponseModel());
      emit(WorkingHourLoaded(response));
      changeLoading();
      print("başarılı");

  }
  Future<void> getWorkingHourListFilter(String minDate,String maxDate) async {
    try{
      changeLoading();
      emit(WorkingHourLoading(isLoading));

      baseReportViewModel.setDbInformation();
        final response = await workingHourService!.workingHourFilter(
            WorkingHourModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), maxDate: maxDate, minDate: minDate,),
            WorkingHourResponseModel());
        emit(WorkingHourLoaded(response));
        changeLoading();
        print("başarılı");

    }
    catch(e){
      emit(WorkingHourError("Detay Bilgileri Alınamadı $e"));
    }
  }


  Future<void> searchData(String? data) async {
    try{
      changeLoading();
      emit(WorkingHourLoading(isLoading));

      baseReportViewModel.setDbInformation();
      final response = await workingHourService!.searchData(
          WorkingHourModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), searchedData: data,),
          WorkingHourResponseModel());
      emit(WorkingHourLoaded(response));
      changeLoading();
      print("başarılı");

    }
    catch(e){
      emit(WorkingHourError("Detay Bilgileri Alınamadı $e"));
    }
  }
  Future<void> searchDataFilter(String minDate,String maxDate,String? data) async {
    try{
      changeLoading();
      emit(WorkingHourLoading(isLoading));

      baseReportViewModel.setDbInformation();

      final response = await workingHourService!.searchDataFilter(
          WorkingHourModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), maxDate: maxDate, minDate: minDate,searchedData:data),
          WorkingHourResponseModel());

      emit(WorkingHourLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(WorkingHourError("Detay Bilgileri Alınamadı $e"));
    }
  }


  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}