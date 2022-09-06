import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'case_movement_model.dart';
import 'case_movement_response.dart';
import 'case_movement_service.dart';
import 'case_movement_state.dart';

class CaseMovementCubit extends Cubit<ICaseMovementState>  with IBaseViewModel
{

  ICaseMovementService? caseMovementService;
 late String dbName;
 late String dbUserName;
 late String dbPassword;
 bool isLoading = false;
  CaseMovementCubit({this.caseMovementService}):super(CaseMovementInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getCaseMovementList() async {
    try{
      changeLoading();
      emit(CaseMovementLoading(isLoading));

      setDbInformation();
        final response = await caseMovementService!.caseMovementList(
            CaseMovementModel(
                RegisterModel(dbName, dbUserName, dbPassword),null,),
            CaseMovementResponseModel());
        emit(CaseMovementLoaded(response));
        changeLoading();
        print("başarılı");

    }
    catch(e){
      emit(CaseMovementError("Detay Bilgileri Alınamadı $e"));
    }
  }


  Future<void> searchData(String? searchedData) async {
    try{
      changeLoading();
      emit(CaseMovementLoading(isLoading));

      setDbInformation();

      final response = await caseMovementService!.searchData(
          CaseMovementModel(
              RegisterModel(dbName,dbUserName,dbPassword),searchedData),
          CaseMovementResponseModel());

      emit(CaseMovementLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(CaseMovementError("Detay Bilgileri Alınamadı $e"));
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