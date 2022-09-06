import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'case_movement_model.dart';
import 'case_movement_response.dart';

abstract class  ICaseMovementService{
  Future<dynamic>  searchData(CaseMovementModel model,CaseMovementResponseModel responseModel);
  Future<dynamic> caseMovementList(CaseMovementModel model,CaseMovementResponseModel responseModel);
}

class CaseMovementService implements ICaseMovementService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> caseMovementList(CaseMovementModel model, CaseMovementResponseModel responseModel) async {

    final response = await networkManager!.responseList<CaseMovementModel, CaseMovementResponseModel>(model, responseModel, UrlService.instance.caseMovementUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }


  @override
  Future<dynamic> searchData(CaseMovementModel model,
      CaseMovementResponseModel responseModel) async {
    final response = await networkManager!.responseList<CaseMovementModel, CaseMovementResponseModel>(model, responseModel, UrlService.instance.searchCaseMovementUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

}