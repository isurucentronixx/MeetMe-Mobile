import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_me_app/providers/user_service_provider.dart';
import 'package:meet_me_app/providers/verify_phone_provider.dart';
import 'package:meet_me_app/themes/app_theme.dart';
//import 'package:meet_me_app/routes/router.gr.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:meet_me_app/providers/login_model_provider.dart';
import 'package:meet_me_app/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //final appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginModelProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => VerifyPhoneProvider()),
      ],
      child: ScreenUtilInit(
        builder: (_) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Meet me',
            theme: getAppTheme(),
            //routerDelegate: appRouter.delegate(),
            //routeInformationParser: appRouter.defaultRouteParser(),
            onGenerateRoute: Routes.generateRoute,
          );
        },
        designSize: Size(375, 812),
      ),
    );
  }
}
