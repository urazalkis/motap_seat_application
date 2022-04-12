import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_route.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/view/login/login_service.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'login_model.dart';
class LoginViewModel extends ChangeNotifier{
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  TextEditingController? userNameController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  LocaleManager localeManager = LocaleManager.instance;
  bool isLoading = false;
  bool showPassword = false;


  Future<void> fetchLoginService() async{
try {
  if (formKey.currentState!.validate()) {
    changeLoading();
    final response = await LoginService.instance.login(
        RegisterModel(
           localeManager.getStringValue(PreferencesKeys.dbName),
            localeManager.getStringValue(PreferencesKeys.dbUserName),
            localeManager.getStringValue(PreferencesKeys.dbPassword)),
        LoginModel(
            userNameController!.text, passwordController!.text,
           ));

    if (response!.success == 1) {

    localeManager.setStringValue(PreferencesKeys.userName, userNameController!.text);
    localeManager.setStringValue(PreferencesKeys.password, passwordController!.text);
    localeManager.setStringValue(PreferencesKeys.admin,response.adminStatus!);
    localeManager.setStringValue(PreferencesKeys.staffName,response.staffName  ?? "ADMİN");
    localeManager.setStringValue(PreferencesKeys.staffId,response.staffId!);
    localeManager.setStringValue(PreferencesKeys.departmentId,response.departmentId!);
    localeManager.setStringValue(PreferencesKeys.departmentName,getDepartmentName(response.departmentId!));
    formKey.currentState!.reset();
print("admin ${response.adminStatus!}");
    changeLoading();
     notifyListeners();
     print("başarılı");
     navigateNext();

    }
    else if (response.success == 0) {
     ToastMessage.instance.errorMessage(errorMessage: response.errorMessage);
     changeLoading();
     notifyListeners();
     print("response 0");
    }

    else if (response.success == -1) {
      ToastMessage.instance.errorMessage(errorMessage: response.errorMessage);
      changeLoading();
      notifyListeners();
      print("response -1");
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

 String getDepartmentName(String departmentId){
    switch(departmentId){
      case "1": return "KESİM";
      case "2": return "DİKİM";
      case "3": return "ÇAKIM";
      case "4": return "SEVK";
      case "5": return "İDARİ İŞLER";
      default: return "ADMİN";
    }

  }
  void changeShowPassword(){

    showPassword = !showPassword;
    notifyListeners();


  }
  void changeLoading(){

    isLoading = !isLoading;
    notifyListeners();

  }
  void clearCacheAndGoRegister(){
    localeManager.clearAll();
    navigateToRegister();
  }
  Future<bool> navigateNext() async {
    await NavigationService.instance.navigateToPageClear(path:NavigationRoute.instance.initialRoute());
    return true;
  }
  Future<bool> navigateToRegister() async {
    await NavigationService.instance.navigateToPageClear(path: NavigationConstants.REGISTER);
    return true;
  }

}