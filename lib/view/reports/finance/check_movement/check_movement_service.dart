import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'check_movement_model.dart';
import 'check_movement_response.dart';

abstract class  ICheckMovementService{
  Future<dynamic>  searchData(CheckMovementModel model,CheckMovementResponseModel responseModel);
  Future<dynamic> checkMovementList(CheckMovementModel model,CheckMovementResponseModel responseModel);
}

class CheckMovementService implements ICheckMovementService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> checkMovementList(CheckMovementModel model, CheckMovementResponseModel responseModel) async {

    final response = await networkManager!.responseList<CheckMovementModel, CheckMovementResponseModel>(model, responseModel, UrlService.instance.checkMovementUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }


  @override
  Future<dynamic> searchData(CheckMovementModel model,
      CheckMovementResponseModel responseModel) async {
    final response = await networkManager!.responseList<CheckMovementModel, CheckMovementResponseModel>(model, responseModel, UrlService.instance.searchCheckMovementUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

}