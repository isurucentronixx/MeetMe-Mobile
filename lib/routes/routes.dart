import 'package:meet_me_app/screens/CalenderScreen.dart';
import 'package:meet_me_app/screens/HomeScreen.dart';
import 'package:meet_me_app/screens/OTPScreen.dart';
import 'package:meet_me_app/screens/ProfileScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:meet_me_app/screens/LoginScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case '/otp':
        return MaterialPageRoute(builder: (context) => OTPScreen());

      case '/home':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/calander':
        return MaterialPageRoute(builder: (context) => CalanderScreen());

      case '/profile':
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
