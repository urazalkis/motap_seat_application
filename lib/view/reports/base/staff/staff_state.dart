import 'package:motaperp_seat_application/view/reports/base/staff/staff_response.dart';

abstract class IStaffState{
  IStaffState();

}

class StaffInit extends IStaffState{
  StaffInit();
}
class StaffLoading extends IStaffState{
  late bool isLoading;
  StaffLoading(isLoading);
}
class StaffLoaded extends IStaffState{

  List<StaffResponseModel> myList;
  StaffLoaded(this.myList);
}
class StaffError extends IStaffState{
  String errorMessage;
  StaffError(this.errorMessage);
}