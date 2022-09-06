import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'staff_model.dart';
import 'staff_response.dart';
import 'staff_service.dart';
import 'staff_state.dart';

class StaffCubit extends Cubit<IStaffState>  with IBaseViewModel
{

  IStaffService? staffService;
  BaseReportViewModel baseReportViewModel = BaseReportViewModel();
 bool isLoading = false;
  StaffCubit({this.staffService}):super(StaffInit());

  @override
  void init() {

  }
  @override
  void dispose() {
  }
  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getStaffList() async {
    try{
      changeLoading();
      emit(StaffLoading(isLoading));

      baseReportViewModel.setDbInformation();
        final response = await staffService!.staffList(
            StaffModel(
                RegisterModel(baseReportViewModel.dbName, baseReportViewModel.dbUserName, baseReportViewModel.dbPassword)),
            StaffResponseModel());
        emit(StaffLoaded(response));
        changeLoading();
        print("başarılı");

    }
    catch(e){
      emit(StaffError("Detay Bilgileri Alınamadı $e"));
    }
  }



  bool changeLoading(){

    isLoading = !isLoading;
    return isLoading;

  }
}