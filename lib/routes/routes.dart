import 'package:meet_me_app/screens/AddMeScreen.dart';
import 'package:meet_me_app/screens/CalendarScreen.dart';
import 'package:meet_me_app/screens/EditMeeting.dart';
import 'package:meet_me_app/screens/HomeScreen.dart';
import 'package:meet_me_app/screens/MapScreen.dart';
import 'package:meet_me_app/screens/OTPScreen.dart';
import 'package:meet_me_app/screens/ProfileScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:meet_me_app/screens/LoginScreen.dart';

//routes

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

      case '/map':
        return MaterialPageRoute(builder: (context) => MapScreen());  

      case '/profile':
        return MaterialPageRoute(builder: (context) => ProfileScreen());   

      case '/addMeeting':
        return MaterialPageRoute(builder: (context) => AddMeScreen());   

      case '/editMeeting':
        return MaterialPageRoute(builder: (context) => EditMeetingScreen());   

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
