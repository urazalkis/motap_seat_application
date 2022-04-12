import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/widget/alertDialog/alert_dialog_question.dart';
import 'package:motaperp_seat_application/core/widget/container/station_container.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/text/bold_text.dart';
import 'package:motaperp_seat_application/view/scan/scan_view_model.dart';
import 'package:motaperp_seat_application/view/task_order/task_order_view_model.dart';
import 'package:provider/src/provider.dart';

class TaskOrderView extends StatefulWidget {

 const TaskOrderView({Key? key}) : super(key: key);

  @override
  _TaskOrderViewState createState() => _TaskOrderViewState();
}
@override


class _TaskOrderViewState extends State<TaskOrderView> {

  String alertDialogText = "İşlemi gerçekleştirmek istediğinize emin misiniz?";
  @override
  void initState() {

      context.read<TaskOrderViewModel>().fetchOrderInformation(context.read<ScanViewModel>().qrCodeResult);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TaskOrderViewModel taskOrderViewModelWatch = context.watch<TaskOrderViewModel>();
    TaskOrderViewModel taskOrderViewModelRead = context.read<TaskOrderViewModel>();
    String qrCodeResult = context.watch<ScanViewModel>().qrCodeResult;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: ColorConstants.instance.appBackgroundColor,
        ),
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {taskOrderViewModelWatch.navigateToScan();},),
        title:  const Text("Ürün Detay Ve iş Emirleri",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: taskOrderViewModelWatch.isLoading==true ?
     const CustomCircularProgressIndicator() :
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: screenHeight,
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
                    BoldText(text: "Müşteri/Ürün Bilgileri",color: Colors.white,underLine: true,fontSize: 20,),
                    BoldText(text: "Cari Ünvan: ${taskOrderViewModelWatch.taskOrderModel!.title}",color: Colors.white,),
                    BoldText(text: "Müşteri Adı: ${taskOrderViewModelWatch.taskOrderModel!.customerName}",color: Colors.white,),
                    BoldText(text: "Kombinasyon: ${taskOrderViewModelWatch.taskOrderModel!.combination}",color: Colors.white,),
                    BoldText(text: "Model: ${taskOrderViewModelWatch.taskOrderModel!.modelName}",color: Colors.white,),
                    BoldText(text: "Koltuk Türü: ${taskOrderViewModelWatch.taskOrderModel!.sofaType}",color: Colors.white,),
                    BoldText(text: "Kumaş Türü: ${taskOrderViewModelWatch.taskOrderModel!.fabricName}",color: Colors.white,),
                    BoldText(text: "Kumaş Kodu: ${taskOrderViewModelWatch.taskOrderModel!.fabricCode}",color: Colors.white,),
                    BoldText(text: "Ayak Türü: ${taskOrderViewModelWatch.taskOrderModel!.legType}",color: Colors.white,),
                    BoldText(text: "Renk: ${taskOrderViewModelWatch.taskOrderModel!.colour}",color: Colors.white,),

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
    );
  }
}
