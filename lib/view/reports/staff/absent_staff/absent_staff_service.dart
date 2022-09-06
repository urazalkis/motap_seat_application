import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'absent_staff_model.dart';
import 'absent_staff_response.dart';

abstract class  IAbsentStaffService{
  Future<dynamic>  searchData(AbsentStaffModel model,AbsentStaffResponseModel responseModel);
  Future<dynamic> absentStaffList(AbsentStaffModel model,AbsentStaffResponseModel responseModel);
}

class AbsentStaffService implements IAbsentStaffService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> absentStaffList(AbsentStaffModel model, AbsentStaffResponseModel responseModel) async {

    final response = await networkManager!.responseList<AbsentStaffModel, AbsentStaffResponseModel>(model, responseModel, UrlService.instance.absentStaffUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }


  @override
  Future<dynamic> searchData(AbsentStaffModel model,
      AbsentStaffResponseModel responseModel) async {
    final response = await networkManager!.responseList<AbsentStaffModel, AbsentStaffResponseModel>(model, responseModel, UrlService.instance.absentStaffUrl);
    print("gelen response data:${response.data!}");
    return response.data;
  }

}