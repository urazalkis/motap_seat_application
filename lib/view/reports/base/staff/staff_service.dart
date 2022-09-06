import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/network/http/http_manager.dart';
import 'staff_model.dart';
import 'staff_response.dart';

abstract class  IStaffService{
  Future<dynamic> staffList(StaffModel model,StaffResponseModel responseModel);
}

class StaffService implements IStaffService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic> staffList(StaffModel model, StaffResponseModel responseModel) async {

    final response = await networkManager!.responseList<StaffModel, StaffResponseModel>(model, responseModel, UrlService.instance.staffListUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }

}