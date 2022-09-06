import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';

class AdminMenuViewModel{
  Future<bool> navigateToLogin() async {
    clearStaffInformationFromCache();
    await NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN);
    return true;

  }
  void clearStaffInformationFromCache(){
    LocaleManager.instance.clearStringValue(PreferencesKeys.staffId);
    LocaleManager.instance.clearStringValue(PreferencesKeys.staffName);
    LocaleManager.instance.clearStringValue(PreferencesKeys.admin);
    LocaleManager.instance.clearStringValue(PreferencesKeys.departmentId);
  }

}