import 'package:motaperp_seat_application/view/reports/finance/check_movement/check_movement_response.dart';

abstract class ICheckMovementState{
  ICheckMovementState();

}

class CheckMovementInit extends ICheckMovementState{
  CheckMovementInit();
}
class CheckMovementLoading extends ICheckMovementState{
  late bool isLoading;
  CheckMovementLoading(isLoading);
}
class CheckMovementLoaded extends ICheckMovementState{

  List<CheckMovementResponseModel> myList;
  CheckMovementLoaded(this.myList);
}
class CheckMovementError extends ICheckMovementState{
  String errorMessage;
  CheckMovementError(this.errorMessage);
}