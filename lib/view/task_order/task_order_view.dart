import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/base/view/base_view.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/alertDialog/alert_dialog_question.dart';
import 'package:motaperp_seat_application/core/widget/appBar/rounded_rectangle_app_bar.dart';
import 'package:motaperp_seat_application/core/widget/container/station_container.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/text/bold_text.dart';
import 'package:motaperp_seat_application/view/scan/scan_view_model.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_view_model.dart';
import 'package:provider/src/provider.dart';

class TaskOrderView extends StatelessWidget {
   TaskOrderView({Key? key}) : super(key: key);
  String alertDialogText = "İşlemi gerçekleştirmek istediğinize emin misiniz?";
  @override
  Widget build(BuildContext context) {
    TaskOrderViewModel taskOrderViewModelWatch = context.watch<TaskOrderViewModel>();
    TaskOrderViewModel taskOrderViewModelRead = context.read<TaskOrderViewModel>();
    String qrCodeResult = context.watch<ScanViewModel>().qrCodeResult;
    return BaseView<TaskOrderViewModel>(
      viewModel: TaskOrderViewModel(),
      init:(viewModel) {
        context.read<TaskOrderViewModel>().setContext(context);
        context.read<TaskOrderViewModel>().init();
      },

      onPageBuilder: (BuildContext context, TaskOrderViewModel viewModel) => Scaffold(
        appBar: RoundedRectangleAppBar(
            title:BoldText(text: "Ürün Detay Ve İş Emirleri")),
        body: taskOrderViewModelWatch.isLoading==true ?
        const CustomCircularProgressIndicator() :
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: context.screenHeight,
            width: context.screenWidth,
            decoration: ColorConstants.instance.appBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: context.screenWidth/1.1,
                  decoration:BoxDecoration(
                    border:Border.all(width: 0.0,color: Colors.white),
                    borderRadius: BorderConstant.instance.radiusAllCircularMin,
                  ),
                  constraints:const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BoldText(text: "Müşteri/Ürün Bilgileri",color: Colors.white,underLine: true,fontSize: 20,),const SizedBox(height: 5,),
                      BoldText(text: "Cari Ünvan: ${taskOrderViewModelWatch.taskOrderResponseModel!.title}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Müşteri Adı: ${taskOrderViewModelWatch.taskOrderResponseModel!.customerName}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Kombinasyon: ${taskOrderViewModelWatch.taskOrderResponseModel!.combination}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Model: ${taskOrderViewModelWatch.taskOrderResponseModel!.modelName}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Koltuk Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.sofaType}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Kumaş Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.fabricName}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Kumaş Kodu: ${taskOrderViewModelWatch.taskOrderResponseModel!.fabricCode}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Ayak Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.legType}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Renk: ${taskOrderViewModelWatch.taskOrderResponseModel!.colour}",color: Colors.white,),const SizedBox(height: 5,),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StationContainer(text: "Kesim", imagePath: UrlIcon.instance.cutUrl,
                      isProcess:taskOrderViewModelWatch.isProcessCut,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessCut == true ? null : taskOrderViewModelWatch.cutProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelRead.stationStatusModel!.cutStatus,
                    ),
                    StationContainer(text: "Dikim", imagePath: UrlIcon.instance.plantUrl,
                      isProcess: taskOrderViewModelWatch.isProcessPlant,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessPlant == true ? null :
                              taskOrderViewModelWatch.plantProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                          Navigator.pop(context);
                        });

                      },
                      colorStatus:taskOrderViewModelRead.stationStatusModel!.plantStatus,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StationContainer(text: "Çakım", imagePath: UrlIcon.instance.tackUrl,
                      isProcess:taskOrderViewModelWatch.isProcessTack,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessTack == true ? null : taskOrderViewModelWatch.tackProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelWatch.stationStatusModel!.tackStatus,),
                    StationContainer(text: "Sevk", imagePath: UrlIcon.instance.shippingUrl,
                      isProcess: taskOrderViewModelWatch.isProcessShipping,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessShipping == true ? null :  taskOrderViewModelWatch.shippingProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelWatch.stationStatusModel!.shippingStatus,),
                  /*  StationContainer(text: "Kalite Kontrol", imagePath: UrlIcon.instance.quanlityControlUrl,
                      isProcess: taskOrderViewModelWatch.isProcessQualityControl,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessQualityControl == true ? null :  taskOrderViewModelWatch.qualityControlProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelWatch.stationStatusModel!.qualityControl,),*/
                  ],
                ),
               /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StationContainer(text: "Sevk", imagePath: UrlIcon.instance.shippingUrl,
                      isProcess: taskOrderViewModelWatch.isProcessShipping,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessShipping == true ? null :  taskOrderViewModelWatch.shippingProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelWatch.stationStatusModel!.shippingStatus,),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),

    );

    /*return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: ColorConstants.instance.appBackgroundColor,
        ),
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
        title:  const Text("Ürün Detay Ve iş Emirleri",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: taskOrderViewModelWatch.isLoading==true ?
     const CustomCircularProgressIndicator() :
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: context.screenHeight,
          width: screenWidth,
          decoration: ColorConstants.instance.appBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth/1.1,
                decoration:BoxDecoration(
                  border:Border.all(width: 0.0,color: Colors.white),
                  borderRadius: BorderConstant.instance.radiusAllCircularMin,
                ),
                constraints:const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BoldText(text: "Müşteri/Ürün Bilgileri",color: Colors.white,underLine: true,fontSize: 20,),const SizedBox(height: 5,),
                    BoldText(text: "Cari Ünvan: ${taskOrderViewModelWatch.taskOrderResponseModel!.title}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Müşteri Adı: ${taskOrderViewModelWatch.taskOrderResponseModel!.customerName}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Kombinasyon: ${taskOrderViewModelWatch.taskOrderResponseModel!.combination}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Model: ${taskOrderViewModelWatch.taskOrderResponseModel!.modelName}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Koltuk Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.sofaType}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Kumaş Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.fabricName}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Kumaş Kodu: ${taskOrderViewModelWatch.taskOrderResponseModel!.fabricCode}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Ayak Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.legType}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Renk: ${taskOrderViewModelWatch.taskOrderResponseModel!.colour}",color: Colors.white,),const SizedBox(height: 5,),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StationContainer(text: "Kesim", imagePath: UrlIcon.instance.cutUrl,
                    isProcess:taskOrderViewModelWatch.isProcessCut,
                    onPressed: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialogQuestion(
                        text: alertDialogText,
                        onpressedConfirm: () {
                          taskOrderViewModelWatch.isProcessCut == true ? null : taskOrderViewModelWatch.cutProcess(qrCodeResult);
                          Navigator.pop(context);
                        },
                        textColor: ColorConstants.instance.customBlueColor,);
                    });

                    },
                    colorStatus: taskOrderViewModelRead.stationStatusModel!.cutStatus,
                  ),
                  StationContainer(text: "Dikim", imagePath: UrlIcon.instance.plantUrl,
                    isProcess: taskOrderViewModelWatch.isProcessPlant,
                    onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialogQuestion(
                          text: alertDialogText,
                          onpressedConfirm: () {
                            taskOrderViewModelWatch.isProcessPlant == true ? null :
                            taskOrderViewModelWatch.plantProcess(qrCodeResult);
                            Navigator.pop(context);
                          },
                          textColor: ColorConstants.instance.customBlueColor,);
                        Navigator.pop(context);
                      });

                    },
                    colorStatus:taskOrderViewModelRead.stationStatusModel!.plantStatus,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StationContainer(text: "Çakım", imagePath: UrlIcon.instance.tackUrl,
                    isProcess:taskOrderViewModelWatch.isProcessTack,
                    onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialogQuestion(
                          text: alertDialogText,
                          onpressedConfirm: () {
                            taskOrderViewModelWatch.isProcessTack == true ? null : taskOrderViewModelWatch.tackProcess(qrCodeResult);
                            Navigator.pop(context);
                          },
                          textColor: ColorConstants.instance.customBlueColor,);
                      });

                    },
                    colorStatus: taskOrderViewModelWatch.stationStatusModel!.tackStatus,),
                  StationContainer(text: "Kalite Kontrol", imagePath: UrlIcon.instance.quanlityControlUrl,
                    isProcess: taskOrderViewModelWatch.isProcessQualityControl,
                    onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialogQuestion(
                          text: alertDialogText,
                          onpressedConfirm: () {
                            taskOrderViewModelWatch.isProcessQualityControl == true ? null :  taskOrderViewModelWatch.qualityControlProcess(qrCodeResult);
                            Navigator.pop(context);
                          },
                          textColor: ColorConstants.instance.customBlueColor,);
                      });

                    },
                    colorStatus: taskOrderViewModelWatch.stationStatusModel!.qualityControl,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StationContainer(text: "Sevk", imagePath: UrlIcon.instance.shippingUrl,
                    isProcess: taskOrderViewModelWatch.isProcessShipping,
                    onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialogQuestion(
                          text: alertDialogText,
                          onpressedConfirm: () {
                            taskOrderViewModelWatch.isProcessShipping == true ? null :  taskOrderViewModelWatch.shippingProcess(qrCodeResult);
                            Navigator.pop(context);
                          },
                          textColor: ColorConstants.instance.customBlueColor,);
                      });

                    },
                    colorStatus: taskOrderViewModelWatch.stationStatusModel!.shippingStatus,),
                ],
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
/*class TaskOrderView extends StatefulWidget {

  const TaskOrderView({Key? key}) : super(key: key);

  @override
  _TaskOrderViewState createState() => _TaskOrderViewState();
}
@override


class _TaskOrderViewState extends State<TaskOrderView> {

  String alertDialogText = "İşlemi gerçekleştirmek istediğinize emin misiniz?";

  @override
  Widget build(BuildContext context) {
    TaskOrderViewModel taskOrderViewModelWatch = context.watch<TaskOrderViewModel>();
    TaskOrderViewModel taskOrderViewModelRead = context.read<TaskOrderViewModel>();
    String qrCodeResult = context.watch<ScanViewModel>().qrCodeResult;
    return BaseView<TaskOrderViewModel>(
      viewModel: TaskOrderViewModel(),
      init:(viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },

      onPageBuilder: (BuildContext context, TaskOrderViewModel viewModel) => Scaffold(
        appBar: RoundedRectangleAppBar(
            title:BoldText(text: "Ürün Detay Ve İş Emirleri")),
        body: taskOrderViewModelWatch.isLoading==true ?
        const CustomCircularProgressIndicator() :
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: context.screenHeight,
            width: context.screenWidth,
            decoration: ColorConstants.instance.appBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: context.screenWidth/1.1,
                  decoration:BoxDecoration(
                    border:Border.all(width: 0.0,color: Colors.white),
                    borderRadius: BorderConstant.instance.radiusAllCircularMin,
                  ),
                  constraints:const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BoldText(text: "Müşteri/Ürün Bilgileri",color: Colors.white,underLine: true,fontSize: 20,),const SizedBox(height: 5,),
                      BoldText(text: "Cari Ünvan: ${taskOrderViewModelRead.taskOrderResponseModel!.title}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Müşteri Adı: ${taskOrderViewModelWatch.taskOrderResponseModel!.customerName}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Kombinasyon: ${taskOrderViewModelWatch.taskOrderResponseModel!.combination}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Model: ${taskOrderViewModelWatch.taskOrderResponseModel!.modelName}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Koltuk Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.sofaType}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Kumaş Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.fabricName}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Kumaş Kodu: ${taskOrderViewModelWatch.taskOrderResponseModel!.fabricCode}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Ayak Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.legType}",color: Colors.white,),const SizedBox(height: 5,),
                      BoldText(text: "Renk: ${taskOrderViewModelWatch.taskOrderResponseModel!.colour}",color: Colors.white,),const SizedBox(height: 5,),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StationContainer(text: "Kesim", imagePath: UrlIcon.instance.cutUrl,
                      isProcess:taskOrderViewModelWatch.isProcessCut,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessCut == true ? null : taskOrderViewModelWatch.cutProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelRead.stationStatusModel!.cutStatus,
                    ),
                    StationContainer(text: "Dikim", imagePath: UrlIcon.instance.plantUrl,
                      isProcess: taskOrderViewModelWatch.isProcessPlant,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessPlant == true ? null :
                              taskOrderViewModelWatch.plantProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                          Navigator.pop(context);
                        });

                      },
                      colorStatus:taskOrderViewModelRead.stationStatusModel!.plantStatus,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StationContainer(text: "Çakım", imagePath: UrlIcon.instance.tackUrl,
                      isProcess:taskOrderViewModelWatch.isProcessTack,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessTack == true ? null : taskOrderViewModelWatch.tackProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelWatch.stationStatusModel!.tackStatus,),
                    StationContainer(text: "Kalite Kontrol", imagePath: UrlIcon.instance.quanlityControlUrl,
                      isProcess: taskOrderViewModelWatch.isProcessQualityControl,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessQualityControl == true ? null :  taskOrderViewModelWatch.qualityControlProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelWatch.stationStatusModel!.qualityControl,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StationContainer(text: "Sevk", imagePath: UrlIcon.instance.shippingUrl,
                      isProcess: taskOrderViewModelWatch.isProcessShipping,
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialogQuestion(
                            text: alertDialogText,
                            onpressedConfirm: () {
                              taskOrderViewModelWatch.isProcessShipping == true ? null :  taskOrderViewModelWatch.shippingProcess(qrCodeResult);
                              Navigator.pop(context);
                            },
                            textColor: ColorConstants.instance.customBlueColor,);
                        });

                      },
                      colorStatus: taskOrderViewModelWatch.stationStatusModel!.shippingStatus,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );

    /*return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: ColorConstants.instance.appBackgroundColor,
        ),
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
        title:  const Text("Ürün Detay Ve iş Emirleri",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: taskOrderViewModelWatch.isLoading==true ?
     const CustomCircularProgressIndicator() :
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: context.screenHeight,
          width: screenWidth,
          decoration: ColorConstants.instance.appBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth/1.1,
                decoration:BoxDecoration(
                  border:Border.all(width: 0.0,color: Colors.white),
                  borderRadius: BorderConstant.instance.radiusAllCircularMin,
                ),
                constraints:const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BoldText(text: "Müşteri/Ürün Bilgileri",color: Colors.white,underLine: true,fontSize: 20,),const SizedBox(height: 5,),
                    BoldText(text: "Cari Ünvan: ${taskOrderViewModelWatch.taskOrderResponseModel!.title}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Müşteri Adı: ${taskOrderViewModelWatch.taskOrderResponseModel!.customerName}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Kombinasyon: ${taskOrderViewModelWatch.taskOrderResponseModel!.combination}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Model: ${taskOrderViewModelWatch.taskOrderResponseModel!.modelName}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Koltuk Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.sofaType}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Kumaş Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.fabricName}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Kumaş Kodu: ${taskOrderViewModelWatch.taskOrderResponseModel!.fabricCode}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Ayak Türü: ${taskOrderViewModelWatch.taskOrderResponseModel!.legType}",color: Colors.white,),const SizedBox(height: 5,),
                    BoldText(text: "Renk: ${taskOrderViewModelWatch.taskOrderResponseModel!.colour}",color: Colors.white,),const SizedBox(height: 5,),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StationContainer(text: "Kesim", imagePath: UrlIcon.instance.cutUrl,
                    isProcess:taskOrderViewModelWatch.isProcessCut,
                    onPressed: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialogQuestion(
                        text: alertDialogText,
                        onpressedConfirm: () {
                          taskOrderViewModelWatch.isProcessCut == true ? null : taskOrderViewModelWatch.cutProcess(qrCodeResult);
                          Navigator.pop(context);
                        },
                        textColor: ColorConstants.instance.customBlueColor,);
                    });

                    },
                    colorStatus: taskOrderViewModelRead.stationStatusModel!.cutStatus,
                  ),
                  StationContainer(text: "Dikim", imagePath: UrlIcon.instance.plantUrl,
                    isProcess: taskOrderViewModelWatch.isProcessPlant,
                    onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialogQuestion(
                          text: alertDialogText,
                          onpressedConfirm: () {
                            taskOrderViewModelWatch.isProcessPlant == true ? null :
                            taskOrderViewModelWatch.plantProcess(qrCodeResult);
                            Navigator.pop(context);
                          },
                          textColor: ColorConstants.instance.customBlueColor,);
                        Navigator.pop(context);
                      });

                    },
                    colorStatus:taskOrderViewModelRead.stationStatusModel!.plantStatus,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StationContainer(text: "Çakım", imagePath: UrlIcon.instance.tackUrl,
                    isProcess:taskOrderViewModelWatch.isProcessTack,
                    onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialogQuestion(
                          text: alertDialogText,
                          onpressedConfirm: () {
                            taskOrderViewModelWatch.isProcessTack == true ? null : taskOrderViewModelWatch.tackProcess(qrCodeResult);
                            Navigator.pop(context);
                          },
                          textColor: ColorConstants.instance.customBlueColor,);
                      });

                    },
                    colorStatus: taskOrderViewModelWatch.stationStatusModel!.tackStatus,),
                  StationContainer(text: "Kalite Kontrol", imagePath: UrlIcon.instance.quanlityControlUrl,
                    isProcess: taskOrderViewModelWatch.isProcessQualityControl,
                    onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialogQuestion(
                          text: alertDialogText,
                          onpressedConfirm: () {
                            taskOrderViewModelWatch.isProcessQualityControl == true ? null :  taskOrderViewModelWatch.qualityControlProcess(qrCodeResult);
                            Navigator.pop(context);
                          },
                          textColor: ColorConstants.instance.customBlueColor,);
                      });

                    },
                    colorStatus: taskOrderViewModelWatch.stationStatusModel!.qualityControl,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StationContainer(text: "Sevk", imagePath: UrlIcon.instance.shippingUrl,
                    isProcess: taskOrderViewModelWatch.isProcessShipping,
                    onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialogQuestion(
                          text: alertDialogText,
                          onpressedConfirm: () {
                            taskOrderViewModelWatch.isProcessShipping == true ? null :  taskOrderViewModelWatch.shippingProcess(qrCodeResult);
                            Navigator.pop(context);
                          },
                          textColor: ColorConstants.instance.customBlueColor,);
                      });

                    },
                    colorStatus: taskOrderViewModelWatch.stationStatusModel!.shippingStatus,),
                ],
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}*/