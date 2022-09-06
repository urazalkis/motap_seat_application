import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/container/transparent_icon_container.dart';
import 'finance_menu_view_model.dart';

class FinanceMenuView extends StatelessWidget {
   FinanceMenuView({Key? key}) : super(key: key);

  String appBarTitle = "Finans";
  FinanceMenuViewModel financeMenuViewModel = FinanceMenuViewModel();
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
                  TransparentIconContainer(text: "Bakiye Raporu", imagePath: UrlIcon.instance.balanceIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.BALANCE_REPORT);},),
                  TransparentIconContainer(text: "Kasa Hareketi", imagePath: UrlIcon.instance.caseMovementIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.CASE_MOVEMENT);},),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TransparentIconContainer(text: "Çek Hareketi", imagePath: UrlIcon.instance.checkIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.CHECK_MOVEMENT);},),
                  TransparentIconContainer(text: "Senet Hareketi", imagePath: UrlIcon.instance.promissoryIconUrl,onpressed: (){NavigationService.instance.navigateToPage(path: NavigationConstants.PROMISSORY_MOVEMENT);},),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}

