import 'employee_payment_response.dart';

abstract class IEmployeePaymentState{
  IEmployeePaymentState();

}

class EmployeePaymentInit extends IEmployeePaymentState{
  EmployeePaymentInit();
}
class EmployeePaymentLoading extends IEmployeePaymentState{
  late bool isLoading;
  EmployeePaymentLoading(isLoading);
}
class EmployeePaymentLoaded extends IEmployeePaymentState{

  List<EmployeePaymentResponseModel?>? myList;
  EmployeePaymentLoaded(this.myList);
}
class EmployeePaymentError extends IEmployeePaymentState{
  String errorMessage;
  EmployeePaymentError(this.errorMessage);
}