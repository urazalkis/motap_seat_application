import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/init/notifier/provider_list.dart';
import 'package:provider/provider.dart';
import 'core/constant/navigation/navigation_constants.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/network/connection_activity/connection_activity.dart';
import 'core/init/notifier/bloc_list.dart';


Future<void> main() async {
  await _init();
  runApp( MyApp());
}
Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.instance.preferencesInit();
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[...ApplicationProvider.instance.dependItems],
      child:MultiBlocProvider(
        providers: [...ApplicationBloc.instance.dependItems],
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
          initialRoute: NavigationRoute.instance.initialRoute(),

          //initialRoute:NavigationConstants.TASK_ORDER,


        ),
      )



    );
  }
}