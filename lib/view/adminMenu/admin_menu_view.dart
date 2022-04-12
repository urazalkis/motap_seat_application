import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
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
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: ColorConstants.instance.appBackgroundColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TransparentIconContainer(text: "Sipariş Oku", imagePath: UrlIcon.instance.scanIconUrl,onpressed: (){adminMenuViewModel.navigateToScan();},),
                    TransparentIconContainer(text: "Sipariş Özet", imagePath: UrlIcon.instance.orderSummaryIconUrl,onpressed: (){adminMenuViewModel.navigateToOrderReport();},),
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

