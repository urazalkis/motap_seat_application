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

import 'employee_payment_model.dart';
import 'employee_payment_response.dart';
import 'employee_payment_service.dart';
import 'employee_payment_state.dart';

class EmployeePaymentCubit extends Cubit<IEmployeePaymentState>  with IBaseViewModel
{

  IEmployeePayment? employeePaymentService;
 late String dbName;
 late String dbUserName;
 late String dbPassword;
 bool isLoading = false;
  EmployeePaymentCubit({this.employeePaymentService}):super(EmployeePaymentInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getEmployeePaymentList(String? employee) async {
    try{
      changeLoading();
      emit(EmployeePaymentLoading(isLoading));

      setDbInformation();
      if(employee!=null) {
        final response = await employeePaymentService!.employeePaymentList(
            EmployeePaymentModel(
                RegisterModel(dbName, dbUserName, dbPassword),
                employee, null, null, null),
            EmployeePaymentResponseModel());
        emit(EmployeePaymentLoaded(response));
        changeLoading();
        print("başarılı");
      }
    }
    catch(e){
      emit(EmployeePaymentError("Detay Bilgileri Alınamadı $e"));
    }
  }

  Future<void> getEmployeePaymentFilter(String? employee,String? dateMin,String? dateMax) async {
    try{
      changeLoading();
      emit(EmployeePaymentLoading(isLoading));

      setDbInformation();

      final response = await employeePaymentService!.employeePaymentFilter(
          EmployeePaymentModel(
              RegisterModel(dbName,dbUserName,dbPassword),
              employee, null, dateMin, dateMax),
          EmployeePaymentResponseModel());

      emit(EmployeePaymentLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(EmployeePaymentError("Detay Bilgileri Alınamadı $e"));
    }

  }
  Future<void> searchData(String? employee,String? searchedData) async {
    try{
      changeLoading();
      emit(EmployeePaymentLoading(isLoading));

      setDbInformation();

      final response = await employeePaymentService!.searchData(
          EmployeePaymentModel(
              RegisterModel(dbName,dbUserName,dbPassword),
              employee, searchedData, null, null),
          EmployeePaymentResponseModel());

      emit(EmployeePaymentLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(EmployeePaymentError("Detay Bilgileri Alınamadı $e"));
    }
  }
  Future<void> searchDataWithFilter(String? employee,String? searchedData,String? dateMin,String? dateMax) async {
    try{
      changeLoading();
      emit(EmployeePaymentLoading(isLoading));

      setDbInformation();

      final response = await employeePaymentService!.searchDataWithFilter(
          EmployeePaymentModel(
              RegisterModel(dbName,dbUserName,dbPassword),
              employee, searchedData, dateMin, dateMax),
          EmployeePaymentResponseModel());

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