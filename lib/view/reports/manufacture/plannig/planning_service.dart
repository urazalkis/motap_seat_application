import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_model.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_response.dart';
abstract class  IPlanningService{
  Future<dynamic>  planningList(PlanningModel model,PlanningResponseModel responseModel);
  Future<dynamic> planningFilter(PlanningModel model,PlanningResponseModel responseModel);
  Future<dynamic>  searchData(PlanningModel model,PlanningResponseModel responseModel);
  Future<dynamic> searchDataFilter(PlanningModel model,PlanningResponseModel responseModel);
}

class PlanningService implements IPlanningService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> planningList(PlanningModel model, PlanningResponseModel responseModel) async {

    final response = await networkManager!.responseList<PlanningModel, PlanningResponseModel>(model, responseModel, UrlService.instance.planningUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }
  @override
  Future<dynamic> planningFilter(PlanningModel model,
      PlanningResponseModel responseModel) async {
    final response = await networkManager!.responseList<PlanningModel, PlanningResponseModel>(model, responseModel, UrlService.instance.planningFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

  @override
  Future<dynamic> searchData(PlanningModel model,
      PlanningResponseModel responseModel) async {
    final response = await networkManager!.responseList<PlanningModel, PlanningResponseModel>(model, responseModel, UrlService.instance.searchPlanningUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }
  @override
  Future<dynamic> searchDataFilter(PlanningModel model,
      PlanningResponseModel responseModel) async {
    final response = await networkManager!.responseList<PlanningModel, PlanningResponseModel>(model, responseModel, UrlService.instance.searchPlanningFilterUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }


}