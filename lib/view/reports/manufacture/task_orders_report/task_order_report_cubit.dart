import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_model.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_response.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_service.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_state.dart';

class TaskOrderCubit extends Cubit<ITaskOrderState> with IBaseViewModel
{

  ITaskOrderReportService? taskOrderReportService;
  BaseReportViewModel baseReportViewModel = BaseReportViewModel();
  bool isLoading = false;
  TaskOrderCubit({this.taskOrderReportService}):super(TaskOrderReportInit());

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
    emit(TaskOrderReportLoading(isLoading));

    baseReportViewModel.setDbInformation();
    final response = await taskOrderReportService!.taskOrderReportList(
        TaskOrderReportModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword)),
        TaskOrderReportResponseModel());
    emit(TaskOrderReportLoaded(response));
    changeLoading();
    print("başarılı");

  }
  Future<void> getListFilter(String minDate,String maxDate) async {
    try{
      changeLoading();
      emit(TaskOrderReportLoading(isLoading));

      baseReportViewModel.setDbInformation();
      final response = await taskOrderReportService!.taskOrderReportFilter(
          TaskOrderReportModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), maxDate: maxDate, minDate: minDate,),
          TaskOrderReportResponseModel());
      emit(TaskOrderReportLoaded(response));
      changeLoading();
      print("başarılı");

    }
    catch(e){
      emit(TaskOrderReportError("Detay Bilgileri Alınamadı $e"));
    }
  }


  Future<void> searchData(String? data) async {
    try{
      changeLoading();
      emit(TaskOrderReportLoading(isLoading));

      baseReportViewModel.setDbInformation();
      final response = await taskOrderReportService!.searchData(
          TaskOrderReportModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), searchedData: data,),
          TaskOrderReportResponseModel());
      emit(TaskOrderReportLoaded(response));
      changeLoading();
      print("başarılı");

    }
    catch(e){
      emit(TaskOrderReportError("Detay Bilgileri Alınamadı $e"));
    }
  }
  Future<void> searchDataFilter(String minDate,String maxDate,String? data) async {
    try{
      changeLoading();
      emit(TaskOrderReportLoading(isLoading));

      baseReportViewModel.setDbInformation();

      final response = await taskOrderReportService!.searchDataFilter(
          TaskOrderReportModel(registerModel:RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword), maxDate: maxDate, minDate: minDate,searchedData:data),
          TaskOrderReportResponseModel());

      emit(TaskOrderReportLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(TaskOrderReportError("Detay Bilgileri Alınamadı $e"));
    }
  }


  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}