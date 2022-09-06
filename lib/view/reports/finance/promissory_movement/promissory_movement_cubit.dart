import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'promissory_movement_model.dart';
import 'promissory_movement_response.dart';
import 'promissory_movement_service.dart';
import 'promissory_movement_state.dart';

class PromissoryMovementCubit extends Cubit<IPromissoryMovementState>  with IBaseViewModel
{

  IPromissoryMovementService? promissoryMovementService;
  BaseReportViewModel baseReportViewModel = BaseReportViewModel();
 bool isLoading = false;
  PromissoryMovementCubit({this.promissoryMovementService}):super(PromissoryMovementInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getPromissoryMovementList() async {
    try{
      changeLoading();
      emit(PromissoryMovementLoading(isLoading));

      baseReportViewModel.setDbInformation();
        final response = await promissoryMovementService!.promissoryMovementList(
            PromissoryMovementModel(
                RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword),null,),
            PromissoryMovementResponseModel());
        emit(PromissoryMovementLoaded(response));
        changeLoading();
        print("başarılı");

    }
    catch(e){
      emit(PromissoryMovementError("Detay Bilgileri Alınamadı $e"));
    }
  }


  Future<void> searchData(String? searchedData) async {
    try{
      changeLoading();
      emit(PromissoryMovementLoading(isLoading));

      baseReportViewModel.setDbInformation();

      final response = await promissoryMovementService!.searchData(
          PromissoryMovementModel(
              RegisterModel(baseReportViewModel.dbName,baseReportViewModel.dbUserName,baseReportViewModel.dbPassword),searchedData),
          PromissoryMovementResponseModel());

      emit(PromissoryMovementLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(PromissoryMovementError("Detay Bilgileri Alınamadı $e"));
    }
  }

  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}