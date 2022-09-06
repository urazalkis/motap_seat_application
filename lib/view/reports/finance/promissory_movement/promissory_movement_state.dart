import 'package:motaperp_seat_application/view/reports/finance/check_movement/check_movement_response.dart';
import 'package:motaperp_seat_application/view/reports/finance/promissory_movement/promissory_movement_response.dart';

abstract class IPromissoryMovementState{
  IPromissoryMovementState();

}

class PromissoryMovementInit extends IPromissoryMovementState{
  PromissoryMovementInit();
}
class PromissoryMovementLoading extends IPromissoryMovementState{
  late bool isLoading;
  PromissoryMovementLoading(isLoading);
}
class PromissoryMovementLoaded extends IPromissoryMovementState{

  List<PromissoryMovementResponseModel> myList;
  PromissoryMovementLoaded(this.myList);
}
class PromissoryMovementError extends IPromissoryMovementState{
  String errorMessage;
  PromissoryMovementError(this.errorMessage);
}