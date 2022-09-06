import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_route.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/container/transparent_icon_container.dart';
import 'package:motaperp_seat_application/view/adminMenu/admin_menu_view_model.dart';
import 'package:motaperp_seat_application/view/adminMenu/manufacture/manufacture_menu_view_model.dart';

class ManufactureMenuView extends StatelessWidget {
   ManufactureMenuView({Key? key}) : super(key: key);

  String appBarTitle = "Üretim";
  ManufactureMenuViewModel manufactureMenuViewModel = ManufactureMenuViewModel();
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
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
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
                  TransparentIconContainer(text: "İş Emri İstatistiği", imagePath: UrlIcon.instance.taskOrderIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.TASK_ORDER_REPORT);},),
                  TransparentIconContainer(text: "Planlama Listesi", imagePath: UrlIcon.instance.planningIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.PLANNNING);},),
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

