import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_route.dart';
import 'package:motaperp_seat_application/core/widget/alertDialog/alert_dialog_question.dart';
import 'package:motaperp_seat_application/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_seat_application/core/widget/icon/icon_widget.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_form_field_password.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_form_field_standard.dart';
import 'package:provider/src/provider.dart';

import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

late double iconBoxHeight;
final String title = "MoTap Koltuk";
final String buttonTitle = "Giriş Yap";
final String hintTextUserName="Kullanıcı Adı";
final String hintTextPassword="Şifre";
final String cacheQuestion="Cache verilerini temizlemek istiyor musunuz?Bu işlemi yetkili değilseniz yapmayınız!";
final String cacheConfirm ="Tüm Cache Verilerini Temizle";
final String textIconConfirm = "İşlemi Gerçekleştir";
final String textIconExit = "Çıkış";

@override
  void initState() {
  print(LocaleManager.instance.getStringValue(PreferencesKeys.dbName));
  print(LocaleManager.instance.getStringValue(PreferencesKeys.dbUserName));
  print(LocaleManager.instance.getStringValue(PreferencesKeys.dbPassword));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final iconBoxHeight = screenHeight / 4;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: ColorConstants.instance.appBackgroundColor,
        child: WillPopScope(
          onWillPop: () => NavigationRoute.instance.quitApp(),
          child:  Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Column(
                  children:  [
                    IconWidget(iconUrl: UrlIcon.instance.appIconUrl, height: iconBoxHeight,),
                    Text(title, style:Theme.of(context).textTheme.headline6!.apply(color: Colors.white)),
                    const SizedBox(height: 20,),
                    Form(
                      key: context.watch<LoginViewModel>().formKey,
                      child: Column(
                        children: [
                          Padding(padding:EdgeInsets.all(screenHeight/30),child: TextFormFieldStandard(tfController:context.watch<LoginViewModel>().userNameController,hintText: hintTextUserName,)),
                          Padding(padding:EdgeInsets.all(screenHeight/30),child: TextFormFieldPassword(tfController: context.watch<LoginViewModel>().passwordController,hintText: hintTextPassword, showPasswordState: () {context.read<LoginViewModel>().changeShowPassword();}, showPassword: context.watch<LoginViewModel>().showPassword,)),
                          Padding(padding:EdgeInsets.all(screenHeight/30),child: ElevatedCircularLoginButton(onPressed:(){context.read<LoginViewModel>().fetchLoginService();},
                            title: buttonTitle,primaryColor:ColorConstants.instance.loginButtonColor,isLoading: context.watch<LoginViewModel>().isLoading,),
                          ),
                          const SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                                onTap: () async {
                                  showDialog(
                                      context: context, builder: (BuildContext context){
                                   return AlertDialogQuestion(
                                       text: cacheQuestion,
                                       onpressedConfirm: () {
                                         context.read<LoginViewModel>().clearCacheAndGoRegister();
                                       },

                                       textColor: ColorConstants.instance.customBlueColor,);
                                  }
                                  );

                                },
                                child: Text(cacheConfirm,style: TextStyle(fontSize: screenWidth/25,color: Colors.orange),)),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}

