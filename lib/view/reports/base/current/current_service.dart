import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motaperp_seat_application/core/constant/url/url_service.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'current_model_response.dart';




abstract class  ICurrentService{
  Future<List<Current>> getCurrent();
}

class CurrentService implements ICurrentService {
   BaseReportViewModel baseReportFunctions = BaseReportViewModel();



  List<Current> parseCurrentList(String response) {
    var jsonData = json.decode(response);
    var currentListResponse = CurrentResponse.fromJson(jsonData);
    List<Current> currentList = currentListResponse.currentList;
    return currentList;
  }

  @override
  Future<List<Current>> getCurrent() async {
    var url = Uri.parse(UrlService.instance.currentUrl);

    var response = await http.post(url, body: baseReportFunctions.baseMapData());
    return parseCurrentList(response.body);
  }


}