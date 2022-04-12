import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/constant/url/url_icon.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_route.dart';
import 'package:motaperp_seat_application/core/widget/button/elevated_circular_login_button.dart';
import 'package:motaperp_seat_application/core/widget/icon/icon_widget.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_form_field_password.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_form_field_standard.dart';
import 'package:motaperp_seat_application/view/register/register_view_model.dart';
import 'package:provider/src/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterViewModel registerViewModel = RegisterViewModel();
late double iconBoxHeight;
final String title = "MoTap Koltuk";
final String buttonTitle = "Bilgileri Kaydet";
final String hintTextDbName="DB Adı";
final String hintTextDbUserName="DB Kullanıcı Adı";
final String hintTextDbPassword="DB Şifre";
@override
  void initState() {
  print(LocaleManager.instance.getStringValue(PreferencesKeys.dbName));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final iconBoxHeight = screenHeight / 4;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                      key: context.read<RegisterViewModel>().formKey,
                      child: Column(
                        children: [
                          Padding(padding:EdgeInsets.all(screenHeight/30),child: TextFormFieldStandard(tfController:context.read<RegisterViewModel>().dbNameController,hintText: hintTextDbName,)),
                          Padding(padding:EdgeInsets.all(screenHeight/30),child: TextFormFieldStandard(tfController: context.read<RegisterViewModel>().dbUserNameController,hintText: hintTextDbUserName,)),
                          Padding(padding:EdgeInsets.all(screenHeight/30),child: TextFormFieldPassword(tfController: context.read<RegisterViewModel>().dbPasswordController,hintText: hintTextDbPassword,
                            showPasswordState: () {context.read<RegisterViewModel>().changeShowPassword();}, showPassword:context.watch<RegisterViewModel>().showPassword,
                          )),
                          Padding(padding:EdgeInsets.all(screenHeight/30),child: ElevatedCircularLoginButton(onPressed:(){context.read<RegisterViewModel>().fetchRegisterService();},
                            title: buttonTitle,primaryColor:ColorConstants.instance.loginButtonColor,isLoading: context.read<RegisterViewModel>().isLoading,),
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

