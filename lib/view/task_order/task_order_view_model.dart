import 'package:flutter/cupertino.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/view/task_order/station_status_model_response.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_model_response.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_service.dart';

class TaskOrderViewModel extends ChangeNotifier{
  bool isLoading = false;
  bool isProcessCut = false;
  bool isProcessPlant = false;
  bool isProcessTack = false;
  bool isProcessQualityControl = false;
  bool isProcessShipping = false;
  LocaleManager localeManager = LocaleManager.instance;
  TaskOrderModelResponse? taskOrderModel;
  StationStatusModelResponse? stationStatusModel;

  Future<void> fetchOrderInformation(String qrCodeResult) async {
    try{
      changeLoading();
      final response = await TaskOrderService.instance.orderInformation(qrCodeResult);
         //title = response!.title;
        // print("title $title");
        taskOrderModel = TaskOrderModelResponse(null,null,response!.title,response.customerName, response.combination,response.modelName,response.sofaType,
            response.fabricName,response.fabricCode,response.legType,response.colour,response.cutStatus,response.plantStatus,response.tackStatus,
            response.qualityControl,response.shippingStatus);
      print("title ${taskOrderModel!.title}");

     await getStationStatus(qrCodeResult);
       changeLoading();

        notifyListeners();
   }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }

}
  Future<void> getStationStatus(String qrCodeResult) async {
    try{
      final response = await TaskOrderService.instance.stationStatus(qrCodeResult);
      //title = response!.title;
      // print("title $title");
      stationStatusModel = StationStatusModelResponse(response!.cutStatus,response.plantStatus,response.tackStatus,
          response.qualityControl,response.shippingStatus);
      print("title ${taskOrderModel!.title}");

      notifyListeners();
    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }

  }
  Future<void> cutProcess(String qrCodeResult) async
  {
    try {
      changeProcessCut();
      if (stationStatusModel!.cutStatus == "0") {
        final response =  await TaskOrderService.instance.cut(qrCodeResult);
      if (response!.success != 0)
     {


          if (response.success == 1) {
            ToastMessage.instance.success();
            getStationStatus(qrCodeResult);


          }
          else if (response.errorMessage != null) {
            ToastMessage.instance.errorMessage(errorMessage: response.errorMessage);

          }
          else{
            ToastMessage.instance.standardErrorMessage();

          }
      }
      else {
        ToastMessage.instance.wrongDepartmentErrorMessage();

      }
      }
      else{
        ToastMessage.instance.alreadyProcessedMessage();

      }
    }
    catch(e){
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
    finally{
      changeProcessCut();
    }
  }
  Future<void> plantProcess(String qrCodeResult) async
  {
    try {
      changeProcessPlant();
      if (stationStatusModel!.cutStatus == "1") {
        if (stationStatusModel!.plantStatus == "0") {
          final response =  await TaskOrderService.instance.plant(qrCodeResult);
          if (response!.success != 0 ) {

            if (response!.success == 1) {
              ToastMessage.instance.success();
              getStationStatus(qrCodeResult);
            }
            else if (response.errorMessage != null) {
              ToastMessage.instance.errorMessage(
                  errorMessage: response.errorMessage);
            }
            else {
              ToastMessage.instance.standardErrorMessage();
            }
          }
          else {
            ToastMessage.instance.wrongDepartmentErrorMessage();
          }
        }
        else {
          ToastMessage.instance.alreadyProcessedMessage();
        }
      }
      else {
        ToastMessage.instance.completePreviousStationsErrorMessage();
      }
    }
    catch (e) {
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
    finally{
      changeProcessPlant();
    }
  }
  Future<void> tackProcess(String qrCodeResult) async
  {
    try {
      changeProcessTack();
      if (stationStatusModel!.cutStatus == "1"||stationStatusModel!.plantStatus == "1") {
        if (stationStatusModel!.tackStatus == "0") {
          final response = await TaskOrderService.instance.tack(qrCodeResult);
          if (response!.success != 0) {


            if (response!.success == 1) {
              ToastMessage.instance.success();
              getStationStatus(qrCodeResult);
            }
            else if (response.errorMessage != null) {
              ToastMessage.instance.errorMessage(
                  errorMessage: response.errorMessage);
            }
            else {
              ToastMessage.instance.standardErrorMessage();
            }
          }
          else {
            ToastMessage.instance.wrongDepartmentErrorMessage();
          }
        }
        else {
          ToastMessage.instance.alreadyProcessedMessage();
        }
      }
      else {
        ToastMessage.instance.completePreviousStationsErrorMessage();
      }
    }
    catch (e) {
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
    finally{
      changeProcessTack();
    }
  }
  Future<void> qualityControlProcess(String qrCodeResult) async
  {
    try {
      changeProcessQualityControl();
      if (stationStatusModel!.cutStatus == "1"||stationStatusModel!.plantStatus == "1"||stationStatusModel!.tackStatus == "1") {
        if (stationStatusModel!.qualityControl == "0") {
          final response = await TaskOrderService.instance.qualityControl(qrCodeResult);
          if (response!.success != 0){


            if (response!.success == 1) {
              ToastMessage.instance.success();
              getStationStatus(qrCodeResult);
            }
            else if (response.errorMessage != null) {
              ToastMessage.instance.errorMessage(
                  errorMessage:response.errorMessage);
            }
            else {
              ToastMessage.instance.standardErrorMessage();
            }
          }
          else {
            ToastMessage.instance.wrongDepartmentErrorMessage();
          }
        }
        else {
          ToastMessage.instance.alreadyProcessedMessage();
        }
      }
      else {
        ToastMessage.instance.completePreviousStationsErrorMessage();
      }
    }
    catch (e) {
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
    finally{
      changeProcessQualityControl();
    }
  }
  Future<void> shippingProcess(String qrCodeResult) async
  {
    try {
      changeProcessShipping();
      if (stationStatusModel!.cutStatus == "1"||stationStatusModel!.plantStatus == "1"||stationStatusModel!.tackStatus == "1"||stationStatusModel!.qualityControl == "1") {
        if (stationStatusModel!.shippingStatus == "0") {

            final response = await TaskOrderService.instance.shipping(
                qrCodeResult);

            if (response!.success == 1) {
              ToastMessage.instance.success();
              getStationStatus(qrCodeResult);
            }
            else if (response.errorMessage != null) {
              ToastMessage.instance.errorMessage(
                  errorMessage: response.errorMessage);
            }
            else {
              ToastMessage.instance.standardErrorMessage();
            }

        }
        else {
          ToastMessage.instance.alreadyProcessedMessage();
        }
      }
      else {
        ToastMessage.instance.completePreviousStationsErrorMessage();
      }
    }
    catch (e) {
      ToastMessage.instance.errorMessage(errorMessage: e.toString());
    }
    finally{
      changeProcessShipping();
    }
  }



  void changeLoading(){

    isLoading = !isLoading;
  }
  Future<bool> navigateToScan() async {
    await NavigationService.instance.navigateToPage(path: NavigationConstants.SCAN);
    return true;
  }
  void changeProcessCut(){

    isProcessCut = !isProcessCut;
    notifyListeners();
  }
  void changeProcessPlant(){

    isProcessPlant = !isProcessPlant;
    notifyListeners();
  }
  void changeProcessTack(){

    isProcessTack = !isProcessTack;
    notifyListeners();
  }

  void changeProcessQualityControl(){

    isProcessQualityControl = !isProcessQualityControl;
    notifyListeners();
  }
  void changeProcessShipping(){

    isProcessShipping = !isProcessShipping;
    notifyListeners();
  }

}