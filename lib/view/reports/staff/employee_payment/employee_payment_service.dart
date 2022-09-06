import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'employee_payment_model.dart';
import 'employee_payment_response.dart';

abstract class  IEmployeePayment{
  Future<dynamic> employeePaymentFilter(EmployeePaymentModel model,EmployeePaymentResponseModel responseModel);
  Future<dynamic>  searchData(EmployeePaymentModel model,EmployeePaymentResponseModel responseModel);
  Future<dynamic> searchDataWithFilter(EmployeePaymentModel model,EmployeePaymentResponseModel responseModel);
  Future<dynamic> employeePaymentList(EmployeePaymentModel model,EmployeePaymentResponseModel responseModel);
}

class EmployeePaymentService implements IEmployeePayment {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> employeePaymentList(EmployeePaymentModel model, EmployeePaymentResponseModel responseModel) async {

    final response = await networkManager!.responseList<EmployeePaymentModel, EmployeePaymentResponseModel>(model, responseModel, UrlService.instance.employeePaymentUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }

  @override
  Future<dynamic> employeePaymentFilter(EmployeePaymentModel model,
      EmployeePaymentResponseModel responseModel) async {
    final response = await networkManager!.responseList<EmployeePaymentModel, EmployeePaymentResponseModel>(model, responseModel, UrlService.instance.employeePaymentFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

  @override
  Future<dynamic> searchData(EmployeePaymentModel model,
      EmployeePaymentResponseModel responseModel) async {
    final response = await networkManager!.responseList<EmployeePaymentModel, EmployeePaymentResponseModel>(model, responseModel, UrlService.instance.searchEmployeePaymentUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

  @override
  Future<dynamic> searchDataWithFilter(EmployeePaymentModel model,
      EmployeePaymentResponseModel responseModel) async {
    final response = await networkManager!.responseList<EmployeePaymentModel, EmployeePaymentResponseModel>(model, responseModel, UrlService.instance.searchEmployeePaymentFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }
}
