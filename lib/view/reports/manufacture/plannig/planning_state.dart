import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_response.dart';

abstract class IPlanningState{
  IPlanningState();

}

class PlanningInit extends IPlanningState{
  PlanningInit();
}
class PlanningLoading extends IPlanningState{
  late bool isLoading;
  PlanningLoading(isLoading);
}
class PlanningLoaded extends IPlanningState{

  List<PlanningResponseModel> myList;
  PlanningLoaded(this.myList);
}
class PlanningError extends IPlanningState{
  String errorMessage;
  PlanningError(this.errorMessage);
}