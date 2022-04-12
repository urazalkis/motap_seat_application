import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_route.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_service.dart';

class ScanViewModel extends ChangeNotifier {

  LocaleManager localeManager = LocaleManager.instance;
  late String qrCodeResult="20210915134512";
  String? staffName;
  String? departmentId;
  String? departmentName;

  Future<void> goToScan(BuildContext context) async {

   try {
     final response = await TaskOrderService.instance.orderInformation(qrCodeResult);

     if (response!.success == 1) {
       navigateToTaskOrder();
     }
     else if (response.success == 0) {
       ToastMessage.instance.errorMessage(
           errorMessage: "Bu numaraya ait bir sipariş bulunamadı!");
     }
     else if (response.errorMessage!=null){
       ToastMessage.instance.errorMessage(
           errorMessage:response.errorMessage);
     }
     else{
       ToastMessage.instance.errorMessage(
           errorMessage: "Bir hata meydana geldi!");
     }

   }
   catch(e){
     ToastMessage.instance.errorMessage(errorMessage: e.toString());
   }

    }


  void scan(BuildContext context) async {
try {
  BarcodeScanner.scan().then((value) {
    qrCodeResult = value.rawContent;
    notifyListeners();
    goToScan(context);
    //qrCodeResult = "";
  });
}
catch(e){
  ToastMessage.instance.errorMessage(errorMessage: e.toString());
}


  }
Future<void> getStaffInformation() async {

   staffName = localeManager.getStringValue(PreferencesKeys.staffName);
   departmentId = localeManager.getStringValue(PreferencesKeys.departmentId);
   departmentName = localeManager.getStringValue(PreferencesKeys.departmentName);

}


  Future<bool> navigateToBack() async {
    if(localeManager.getStringValue(PreferencesKeys.admin)=="1") {
      await NavigationService.instance.navigateToPageClear(path: NavigationConstants.ADMIN_MENU);
    }
    else{
      await NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN);
    }

    return true;
  }
Future<bool> navigateToTaskOrder() async {
  await NavigationService.instance.navigateToPage(path: NavigationConstants.TASK_ORDER);
  return true;
}
}