import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';

import 'balance_report_model.dart';
import 'balance_report_model_response.dart';
import 'balance_report_service.dart';
import 'balance_report_state.dart';

class BalanceReportCubit extends Cubit<IBalanceReportState>  with IBaseViewModel
{

  IBalanceReportService? balancerReportService;
 late String dbName;
 late String dbUserName;
 late String dbPassword;
 bool isLoading = false;
  BalanceReportCubit({this.balancerReportService}):super(BalanceReportInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getBalanceList(String? current) async {
    try{
      changeLoading();
      emit(CaseMovementLoading(isLoading));

      setDbInformation();
      if(current!=null) {
        final response = await balancerReportService!.balanceList(
            BalanceReportModel(
                RegisterModel(dbName, dbUserName, dbPassword),
                current, null,),
            BalanceReportResponseModel());
        emit(BalanceReportLoaded(response));
        changeLoading();
        print("başarılı");
      }
    }
    catch(e){
      print(e);
      emit(BalanceReportError("Detay Bilgileri Alınamadı $e"));
    }
  }


  Future<void> searchData(String? current,String? searchedData) async {
    try{
      changeLoading();
      emit(CaseMovementLoading(isLoading));

      setDbInformation();

      final response = await balancerReportService!.searchData(
          BalanceReportModel(
              RegisterModel(dbName,dbUserName,dbPassword),
              current, searchedData),
          BalanceReportResponseModel());

      emit(BalanceReportLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(BalanceReportError("Detay Bilgileri Alınamadı $e"));
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