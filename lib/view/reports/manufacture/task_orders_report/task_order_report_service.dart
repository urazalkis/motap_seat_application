import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_model.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/task_orders_report/task_order_report_response.dart';

abstract class  ITaskOrderReportService{
  Future<dynamic>  taskOrderReportList(TaskOrderReportModel model,TaskOrderReportResponseModel responseModel);
  Future<dynamic> taskOrderReportFilter(TaskOrderReportModel model,TaskOrderReportResponseModel responseModel);
  Future<dynamic>  searchData(TaskOrderReportModel model,TaskOrderReportResponseModel responseModel);
  Future<dynamic> searchDataFilter(TaskOrderReportModel model,TaskOrderReportResponseModel responseModel);
}

class TaskOrderReportService implements ITaskOrderReportService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> taskOrderReportList(TaskOrderReportModel model, TaskOrderReportResponseModel responseModel) async {

    final response = await networkManager!.responseList<TaskOrderReportModel, TaskOrderReportResponseModel>(model, responseModel, UrlService.instance.taskOrderReportUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }
  @override
  Future<dynamic> taskOrderReportFilter(TaskOrderReportModel model,
      TaskOrderReportResponseModel responseModel) async {
    final response = await networkManager!.responseList<TaskOrderReportModel, TaskOrderReportResponseModel>(model, responseModel, UrlService.instance.taskOrderReportFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

  @override
  Future<dynamic> searchData(TaskOrderReportModel model,
      TaskOrderReportResponseModel responseModel) async {
    final response = await networkManager!.responseList<TaskOrderReportModel, TaskOrderReportResponseModel>(model, responseModel, UrlService.instance.searchtaskOrderReportUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }
  @override
  Future<dynamic> searchDataFilter(TaskOrderReportModel model,
      TaskOrderReportResponseModel responseModel) async {
    final response = await networkManager!.responseList<TaskOrderReportModel, TaskOrderReportResponseModel>(model, responseModel, UrlService.instance.searchtaskOrderReportFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }


}