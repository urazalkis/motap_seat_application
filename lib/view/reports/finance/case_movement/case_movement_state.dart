
import 'package:motaperp_seat_application/view/reports/finance/case_movement/case_movement_response.dart';

abstract class ICaseMovementState{
  ICaseMovementState();

}

class CaseMovementInit extends ICaseMovementState{
  CaseMovementInit();
}
class CaseMovementLoading extends ICaseMovementState{
  late bool isLoading;
  CaseMovementLoading(isLoading);
}
class CaseMovementLoaded extends ICaseMovementState{

  List<CaseMovementResponseModel> myList;
  CaseMovementLoaded(this.myList);
}
class CaseMovementError extends ICaseMovementState{
  String errorMessage;
  CaseMovementError(this.errorMessage);
}