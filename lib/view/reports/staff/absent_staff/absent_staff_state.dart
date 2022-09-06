import 'package:motaperp_seat_application/view/reports/staff/absent_staff/absent_staff_response.dart';

abstract class IAbsentStaffState{
  IAbsentStaffState();

}

class AbsentStaffInit extends IAbsentStaffState{
  AbsentStaffInit();
}
class AbsentStaffLoading extends IAbsentStaffState{
  late bool isLoading;
  AbsentStaffLoading(isLoading);
}
class AbsentStaffLoaded extends IAbsentStaffState{

  List<AbsentStaffResponseModel> myList;
  AbsentStaffLoaded(this.myList);
}
class AbsentStaffError extends IAbsentStaffState{
  String errorMessage;
  AbsentStaffError(this.errorMessage);
}