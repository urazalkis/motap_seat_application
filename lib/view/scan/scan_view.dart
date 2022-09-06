import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_route.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/icon/icon_widget.dart';
import 'package:motaperp_seat_application/view/scan/scan_view_model.dart';
import 'package:provider/src/provider.dart';


class ScanView extends StatefulWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  final String appBarTitle="QR Kod Tarama";
  final String scanButtonText="Taramayı Başlat";


  void initState() {
    print(LocaleManager.instance.getStringValue(PreferencesKeys.dbName));
    print(LocaleManager.instance.getStringValue(PreferencesKeys.dbUserName));
    print(LocaleManager.instance.getStringValue(PreferencesKeys.dbPassword));
    context.read<ScanViewModel>().getStaffInformation();
    super.initState();
  }
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
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {context.read<ScanViewModel>().navigateToBack();},),
        title:  Text(appBarTitle,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: ColorConstants.instance.appBackgroundColor,
        child: WillPopScope(
          onWillPop: () => context.read<ScanViewModel>().navigateToBack(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          readOnly: true,
                          enabled: false,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintMaxLines: 2,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:BorderConstant.instance.radiusAllCircularMin,
                            ),
                            hintText: "Kullanıcı : ${context.read<ScanViewModel>().staffName}",

                          ),

                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Flexible(
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          readOnly: true,
                          enabled: false,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintMaxLines: 2,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:BorderConstant.instance.radiusAllCircularMin,
                            ),
                            hintText: "Departman : ${context.read<ScanViewModel>().departmentName}",
                            alignLabelWithHint: true
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),

              IconWidget(
                iconUrl: UrlIcon.instance.scanIconUrl,
                height: screenHeight/4,
              ),

              ElevatedButton(
                onPressed: () {
                  context.read<ScanViewModel>().scan(context);
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color:   Colors.lightBlue, width: 2.0),
                        borderRadius: BorderConstant.instance.radiusAllCircularMedium)),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient:ColorConstants.instance.buttonGradientBlueColor,
                      borderRadius:BorderConstant.instance.radiusAllCircularMedium),
                  child: Container(
                    width: screenWidth / 3,
                    height:screenHeight / 15,
                    alignment: Alignment.center,
                    child: Text(
                      scanButtonText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),



            ],

          ),

        ),

      ),
    );
  }
}

