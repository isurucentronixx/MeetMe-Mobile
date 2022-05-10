import 'package:meet_me_app/screens/add_meeting_screen.dart';
import 'package:meet_me_app/screens/calendar_screen.dart';
import 'package:meet_me_app/screens/edit_meeting_screen.dart';
import 'package:meet_me_app/screens/home_screen.dart';
import 'package:meet_me_app/screens/map_screen.dart';
import 'package:meet_me_app/screens/notifications_screen.dart';
import 'package:meet_me_app/screens/otp_screen.dart';
import 'package:meet_me_app/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:meet_me_app/screens/login_screen.dart';

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

      case '/notifications':
        return MaterialPageRoute(builder: (context) => NotificationsScreen());    

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
