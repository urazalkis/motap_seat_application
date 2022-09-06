import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'working_hour_model.dart';
import 'working_hour_response.dart';

abstract class  IWorkingHourService{
  Future<dynamic>  workingHourList(WorkingHourModel model,WorkingHourResponseModel responseModel);
  Future<dynamic> workingHourFilter(WorkingHourModel model,WorkingHourResponseModel responseModel);
  Future<dynamic>  searchData(WorkingHourModel model,WorkingHourResponseModel responseModel);
  Future<dynamic> searchDataFilter(WorkingHourModel model,WorkingHourResponseModel responseModel);
}

class WorkingHourService implements IWorkingHourService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> workingHourList(WorkingHourModel model, WorkingHourResponseModel responseModel) async {

    final response = await networkManager!.responseList<WorkingHourModel, WorkingHourResponseModel>(model, responseModel, UrlService.instance.workingHourUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }
  @override
  Future<dynamic> workingHourFilter(WorkingHourModel model,
      WorkingHourResponseModel responseModel) async {
    final response = await networkManager!.responseList<WorkingHourModel, WorkingHourResponseModel>(model, responseModel, UrlService.instance.workingHourFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

  @override
  Future<dynamic> searchData(WorkingHourModel model,
      WorkingHourResponseModel responseModel) async {
    final response = await networkManager!.responseList<WorkingHourModel, WorkingHourResponseModel>(model, responseModel, UrlService.instance.searchWorkingHourUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }
  @override
  Future<dynamic> searchDataFilter(WorkingHourModel model,
      WorkingHourResponseModel responseModel) async {
    final response = await networkManager!.responseList<WorkingHourModel, WorkingHourResponseModel>(model, responseModel, UrlService.instance.searchWorkingHourFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }


}