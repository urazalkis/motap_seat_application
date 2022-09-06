import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';

import 'order_report_model.dart';
import 'order_report_model_response.dart';
import 'order_report_service.dart';
import 'order_report_state.dart';

class OrderReportCubit extends Cubit<IOrderReportState>  with IBaseViewModel
{

  IOrderReportService? orderReportService;
 late String dbName;
 late String dbUserName;
 late String dbPassword;
 bool isLoading = false;
  OrderReportCubit({this.orderReportService}):super(OrderReportInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getOrderList(String? current) async {
    try{
      changeLoading();
      emit(EmployeePaymentLoading(isLoading));

      setDbInformation();
      if(current!=null) {
        final response = await orderReportService!.orderList(
            OrderReportModel(
                RegisterModel(dbName, dbUserName, dbPassword),
                current, null, null, null),
            OrderReportResponseModel());
        emit(EmployeePaymentLoaded(response));
        changeLoading();
        print("başarılı");
      }
    }
    catch(e){
      emit(EmployeePaymentError("Detay Bilgileri Alınamadı $e"));
    }
  }

  Future<void> getOrderListWithFilter(String? current,String? dateMin,String? dateMax) async {
    try{
      changeLoading();
      emit(EmployeePaymentLoading(isLoading));

      setDbInformation();

      final response = await orderReportService!.orderListWithFilter(
          OrderReportModel(
              RegisterModel(dbName,dbUserName,dbPassword),
              current, null, dateMin, dateMax),
          OrderReportResponseModel());

      emit(EmployeePaymentLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(EmployeePaymentError("Detay Bilgileri Alınamadı $e"));
    }

  }
  Future<void> searchData(String? current,String? searchedData) async {
    try{
      changeLoading();
      emit(EmployeePaymentLoading(isLoading));

      setDbInformation();

      final response = await orderReportService!.searchData(
          OrderReportModel(
              RegisterModel(dbName,dbUserName,dbPassword),
              current, searchedData, null, null),
          OrderReportResponseModel());

      emit(EmployeePaymentLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(EmployeePaymentError("Detay Bilgileri Alınamadı $e"));
    }
  }
  Future<void> searchDataWithFilter(String? current,String? searchedData,String? dateMin,String? dateMax) async {
    try{
      changeLoading();
      emit(EmployeePaymentLoading(isLoading));

      setDbInformation();

      final response = await orderReportService!.searchDataWithFilter(
          OrderReportModel(
              RegisterModel(dbName,dbUserName,dbPassword),
              current, searchedData, dateMin, dateMax),
          OrderReportResponseModel());

      emit(EmployeePaymentLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(EmployeePaymentError("Detay Bilgileri Alınamadı $e"));
    }
  }
  void setDbInformation(){
    dbName =  localeManager.getStringValue(PreferencesKeys.dbName);
    dbUserName =   localeManager.getStringValue(PreferencesKeys.dbUserName);
    dbPassword =   localeManager.getStringValue(PreferencesKeys.dbPassword);
  }
  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }


}