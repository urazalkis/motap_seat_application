import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/register/register_service.dart';

class RegisterViewModel extends ChangeNotifier{
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  TextEditingController? dbNameController = TextEditingController();
  TextEditingController? dbUserNameController = TextEditingController();
  TextEditingController? dbPasswordController  = TextEditingController();
  LocaleManager localeManager = LocaleManager.instance;
  bool isLoading = false;
  bool showPassword = false;

  void changeShowPassword(){

      showPassword = !showPassword;
      notifyListeners();


  }
  void changeLoading(){

    isLoading = !isLoading;
    notifyListeners();

  }
  Future<void> fetchRegisterService() async{
try {
  if (formKey.currentState!.validate()) {
    changeLoading();
    final response = await RegisterService.instance.register(RegisterModel(
        dbNameController!.text, dbUserNameController!.text,
        dbPasswordController!.text));
    notifyListeners();
    if (response!.success == 1) {


    localeManager.setStringValue(PreferencesKeys.dbName, dbNameController!.text);
    localeManager.setStringValue(PreferencesKeys.dbUserName, dbUserNameController!.text);
    localeManager.setStringValue(PreferencesKeys.dbPassword, dbPasswordController!.text);
    formKey.currentState!.reset();
    changeLoading();
     notifyListeners();

     navigateToLogin();

    }
    else if (response.success == 0) {
     ToastMessage.instance.errorMessage(errorMessage: response.errorMessage);
     changeLoading();
     notifyListeners();
    }
    else if (response.success == -1) {
      ToastMessage.instance.errorMessage(errorMessage: response.errorMessage);
      changeLoading();
      notifyListeners();
    }
    else {
      ToastMessage.instance.dbConnectionErrorMessage();
      changeLoading();
     notifyListeners();
    }
  }

  }
catch(e){
  ToastMessage.instance.errorMessage(errorMessage: e.toString());
}
  }
  void clear(){
    dbNameController!.clear();
    dbUserNameController!.clear();
    dbPasswordController!.clear();
    isLoading = false;
    showPassword = false;
  }
  Future<bool> navigateToLogin() async {
    await NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN);
    return true;
  }


}