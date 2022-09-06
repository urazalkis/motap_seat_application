import 'package:motaperp_seat_application/view/reports/staff/working_hour/working_hour_response.dart';

abstract class IWorkingHourState{
  IWorkingHourState();

}

class WorkingHourInit extends IWorkingHourState{
  WorkingHourInit();
}
class WorkingHourLoading extends IWorkingHourState{
  late bool isLoading;
  WorkingHourLoading(isLoading);
}
class WorkingHourLoaded extends IWorkingHourState{

  List<WorkingHourResponseModel> myList;
  WorkingHourLoaded(this.myList);
}
class WorkingHourError extends IWorkingHourState{
  String errorMessage;
  WorkingHourError(this.errorMessage);
}