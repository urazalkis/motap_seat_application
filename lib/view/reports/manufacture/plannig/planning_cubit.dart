import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_model.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_response.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_service.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_state.dart';


class PlanningCubit extends Cubit<IPlanningState> with IBaseViewModel
{

  IPlanningService? planningService;
  BaseReportViewModel baseReportViewModel = BaseReportViewModel();
  bool isLoading = false;
  PlanningCubit({this.planningService}):super(PlanningInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getList() async {

    changeLoading();
    emit(PlanningLoading(isLoading));

    baseReportViewModel.setDbInformation();
    final response = await planningService!.planningList(
        PlanningModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword)),
        PlanningResponseModel());
    emit(PlanningLoaded(response));
    changeLoading();
    print("başarılı");

  }
  Future<void> getListFilter(String minDate,String maxDate) async {
    try{
      changeLoading();
      emit(PlanningLoading(isLoading));

      baseReportViewModel.setDbInformation();
      final response = await planningService!.planningFilter(
          PlanningModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), maxDate: maxDate, minDate: minDate,),
          PlanningResponseModel());
      emit(PlanningLoaded(response));
      changeLoading();
      print("başarılı");

    }
    catch(e){
      emit(PlanningError("Detay Bilgileri Alınamadı $e"));
    }
  }


  Future<void> searchData(String? data) async {
    try{
      changeLoading();
      emit(PlanningLoading(isLoading));

      baseReportViewModel.setDbInformation();
      final response = await planningService!.searchData(
          PlanningModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), searchedData: data,),
          PlanningResponseModel());
      emit(PlanningLoaded(response));
      changeLoading();
      print("başarılı");

    }
    catch(e){
      emit(PlanningError("Detay Bilgileri Alınamadı $e"));
    }
  }
  Future<void> searchDataFilter(String minDate,String maxDate,String? data) async {
    try{
      changeLoading();
      emit(PlanningLoading(isLoading));

      baseReportViewModel.setDbInformation();

      final response = await planningService!.searchDataFilter(
          PlanningModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), maxDate: maxDate, minDate: minDate,searchedData:data),
          PlanningResponseModel());

      emit(PlanningLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(PlanningError("Detay Bilgileri Alınamadı $e"));
    }
  }


  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}