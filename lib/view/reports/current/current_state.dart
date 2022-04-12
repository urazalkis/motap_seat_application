import 'current_model_response.dart';

abstract class ICurrentState{
  ICurrentState();

}

class CurrentInit extends ICurrentState{
  CurrentInit();
}
class CurrentLoading extends ICurrentState{
  CurrentLoading();
}
class CurrentLoaded extends ICurrentState{

  List<Current> showList;
  CurrentLoaded(this.showList);
}
class CurrentError extends ICurrentState{
  String errorMessage;
  CurrentError(this.errorMessage);
}