import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'balance_report_model.dart';
import 'balance_report_model_response.dart';

abstract class  IBalanceReportService{
  Future<dynamic>  searchData(BalanceReportModel model,BalanceReportResponseModel responseModel);
  Future<dynamic> balanceList(BalanceReportModel model,BalanceReportResponseModel responseModel);
}

class BalanceReportService implements IBalanceReportService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> balanceList(BalanceReportModel model, BalanceReportResponseModel responseModel) async {

    final response = await networkManager!.response<BalanceReportModel, BalanceReportResponseModel>(model, responseModel, UrlService.instance.balanceReportUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }


  @override
  Future<dynamic> searchData(BalanceReportModel model,
      BalanceReportResponseModel responseModel) async {
    final response = await networkManager!.response<BalanceReportModel, BalanceReportResponseModel>(model, responseModel, UrlService.instance.searchBalanceReportUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

}