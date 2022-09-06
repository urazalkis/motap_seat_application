import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_route.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/view/login/login_model_response.dart';
import 'package:motaperp_seat_application/view/login/login_service.dart';
import 'package:motaperp_seat_application/view/register/register_model.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_view.dart';
import 'login_model.dart';
class LoginViewModel extends ChangeNotifier implements IBaseViewModel{
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  TextEditingController? userNameController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  @override
  BuildContext? context;
  @override
   LocaleManager localeManager = LocaleManager.instance;
  @override
   NavigationService navigation = NavigationService.instance;
   LoginService loginService = LoginService.instance;
  bool isLoading = false;
  bool showPassword = false;

  @override
  void init() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }
  Future<void> fetchLoginService() async{
    try {
      if (formKey.currentState!.validate()) {
        changeLoading();
      String dbname =  localeManager.getStringValue(PreferencesKeys.dbName);
          String dbUserName =   localeManager.getStringValue(PreferencesKeys.dbUserName);
    String dbPassword =   localeManager.getStringValue(PreferencesKeys.dbPassword);
        final response = await LoginService.instance.fetchUserControl(LoginModel(RegisterModel(dbname,dbUserName,dbPassword), userNameController!.text, passwordController!.text),
            LoginModelResponse());

        print("gelen response staffname:${response!.staffName ?? "null"}");

        if (response.success == 1) {


          localeManager.setStringValue(PreferencesKeys.userName, userNameController!.text);
          localeManager.setStringValue(PreferencesKeys.password, passwordController!.text);
          localeManager.setStringValue(PreferencesKeys.admin,response.adminStatus!);
          localeManager.setStringValue(PreferencesKeys.staffName,response.staffName  ?? "ADMİN");
          localeManager.setStringValue(PreferencesKeys.staffId,response.staffId!);
          localeManager.setStringValue(PreferencesKeys.departmentId,response.departmentId!);
          localeManager.setStringValue(PreferencesKeys.departmentName,getDepartmentName(response.departmentId!));
          formKey.currentState!.reset();
          userNameController!.clear();
          passwordController!.clear();

          notifyListeners();

         // NavigationService.instance.navigateToPageClear(path:NavigationConstants.TASK_ORDER);
          NavigationService.instance.navigateToPageClear(path:NavigationRoute.instance.initialRoute());

        }
        else if (response.success == 0) {
          ToastMessage.instance.errorMessage(errorMessage: response.error!.message);

          notifyListeners();
          print("response 0");
        }

        else if (response.success == -1) {
          ToastMessage.instance.errorMessage(errorMessage: response.error!.message);

          notifyListeners();
          print("response -1");
        }
        else {
          ToastMessage.instance.dbConnectionErrorMessage();

          notifyListeners();
        }
        changeLoading();
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
    NavigationService.instance.navigateToPageClear(path: NavigationConstants.REGISTER);
  }


  @override
  void setContext(BuildContext context) => this.context = context;







/*Future<void> fetchLoginService() async{
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

     notifyListeners();
     print("başarılı");
     navigateNext();

    }
    else if (response.success == 0) {
     ToastMessage.instance.errorMessage(errorMessage: response.error!.message);

     notifyListeners();
     print("response 0");
    }

    else if (response.success == -1) {
      ToastMessage.instance.errorMessage(errorMessage: response.error!.message);

      notifyListeners();
      print("response -1");
    }
    else {
      ToastMessage.instance.dbConnectionErrorMessage();

     notifyListeners();
    }
    changeLoading();
  }

  }
catch(e){
  ToastMessage.instance.errorMessage(errorMessage: e.toString());
}
  }*/

}