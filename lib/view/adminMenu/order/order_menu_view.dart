import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/container/transparent_icon_container.dart';
import 'package:motaperp_seat_application/view/adminMenu/staff/staff_menu_view_model.dart';

class OrderMenuView extends StatelessWidget {
   OrderMenuView({Key? key}) : super(key: key);

  String appBarTitle = "Sipariş";
  StaffMenuViewModel staffMenuViewModel = StaffMenuViewModel();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: ColorConstants.instance.appBackgroundColor,
        ),
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.navigateToPage(path: NavigationConstants.ADMIN_MENU);},),
        title:  Text(appBarTitle,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: ColorConstants.instance.appBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TransparentIconContainer(text: "Sipariş Oku", imagePath: UrlIcon.instance.scanIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.SCAN);},),
                  TransparentIconContainer(text: "Sipariş Raporu", imagePath: UrlIcon.instance.orderSummaryIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.ORDER_REPORT);},),
                ],
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),

    );
  }
}

