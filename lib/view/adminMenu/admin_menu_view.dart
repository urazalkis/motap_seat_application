import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/container/transparent_icon_container.dart';
import 'package:motaperp_seat_application/view/adminMenu/admin_menu_view_model.dart';

class AdminMenuView extends StatelessWidget {
   AdminMenuView({Key? key}) : super(key: key);

  String appBarTitle = "Admin Paneli";
  AdminMenuViewModel adminMenuViewModel = AdminMenuViewModel();
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
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {adminMenuViewModel.navigateToLogin();},),
        title:  Text(appBarTitle,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: WillPopScope(
        onWillPop: () => adminMenuViewModel.navigateToLogin(),
        child: Container(
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
                    TransparentIconContainer(text: "Sipariş", imagePath: UrlIcon.instance.orderSummaryIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.ORDER_MENU);},),
                    TransparentIconContainer(text: "Finans", imagePath: UrlIcon.instance.caseMovementIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.FINANCE_MENU);},),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TransparentIconContainer(text: "Üretim", imagePath: UrlIcon.instance.taskOrderIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.MANUFACTURE_MENU);},),
                    TransparentIconContainer(text: "Personel", imagePath: UrlIcon.instance.staffIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.STAFF_MENU);},),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

