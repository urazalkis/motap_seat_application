import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'check_movement_model.dart';
import 'check_movement_response.dart';
import 'check_movement_service.dart';
import 'check_movement_state.dart';

class CheckMovementCubit extends Cubit<ICheckMovementState>  with IBaseViewModel
{

  ICheckMovementService? checkMovementService;
  BaseReportViewModel baseReportViewModel = BaseReportViewModel();
 bool isLoading = false;
  CheckMovementCubit({this.checkMovementService}):super(CheckMovementInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getCheckMovementList() async {
    try{
      changeLoading();
      emit(CheckMovementLoading(isLoading));

      baseReportViewModel.setDbInformation();
        final response = await checkMovementService!.checkMovementList(
            CheckMovementModel(
                RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword),null,),
            CheckMovementResponseModel());
        emit(CheckMovementLoaded(response));
        changeLoading();
        print("başarılı");

    }
    catch(e){
      emit(CheckMovementError("Detay Bilgileri Alınamadı $e"));
    }
  }


  Future<void> searchData(String? searchedData) async {
    try{
      changeLoading();
      emit(CheckMovementLoading(isLoading));

      baseReportViewModel.setDbInformation();

      final response = await checkMovementService!.searchData(
          CheckMovementModel(
              RegisterModel(baseReportViewModel.dbName,baseReportViewModel.dbUserName,baseReportViewModel.dbPassword),searchedData),
          CheckMovementResponseModel());

      emit(CheckMovementLoaded(response));
      changeLoading();
      print("başarılı");
    }
    catch(e){
      emit(CheckMovementError("Detay Bilgileri Alınamadı $e"));
    }
  }

  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}