import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'promissory_movement_model.dart';
import 'promissory_movement_response.dart';

abstract class  IPromissoryMovementService{
  Future<dynamic>  searchData(PromissoryMovementModel model,PromissoryMovementResponseModel responseModel);
  Future<dynamic> promissoryMovementList(PromissoryMovementModel model,PromissoryMovementResponseModel responseModel);
}

class PromissoryMovementService implements IPromissoryMovementService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> promissoryMovementList(PromissoryMovementModel model, PromissoryMovementResponseModel responseModel) async {

    final response = await networkManager!.responseList<PromissoryMovementModel, PromissoryMovementResponseModel>(model, responseModel, UrlService.instance.promissoryMovementUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }


  @override
  Future<dynamic> searchData(PromissoryMovementModel model,
      PromissoryMovementResponseModel responseModel) async {
    final response = await networkManager!.responseList<PromissoryMovementModel, PromissoryMovementResponseModel>(model, responseModel, UrlService.instance.searchPromissoryMovementUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

}