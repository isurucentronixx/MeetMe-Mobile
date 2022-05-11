import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:meet_me_app/screens/profile_screen.dart';

import '../themes/app_colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool status1 = true;
  bool status2 = true;
  bool status3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: AppColors.text,
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400.w,
            margin: EdgeInsets.only(
              top: 25.h,
              left: 15.w,
              right: 15.w,
              bottom: 280.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Notifiction before leaving',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outlined,
                          size: 30,
                        ),
                        color: Colors.redAccent,
                        onPressed: () {},
                        iconSize: 45,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          'Add new',
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 2.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: Text(
                          'Disable In-app-notifications',
                          style: TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                      ),
                      FlutterSwitch(
                        width: 85.0,
                        height: 45.0,
                        toggleSize: 35.0,
                        value: status2,
                        borderRadius: 30.0,
                        padding: 2.0,
                        toggleColor: Color.fromRGBO(225, 225, 225, 1),
                        inactiveColor: Colors.black38,
                        onToggle: (val) {
                          setState(() {
                            status2 = val;
                          });
                        },
                      ),
                      
                    ],
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 2.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: Text(
                          'Disable push-notifications',
                          style: TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                      ),
                      FlutterSwitch(
                        width: 85.0,
                        height: 45.0,
                        toggleSize: 35.0,
                        value: status2,
                        borderRadius: 30.0,
                        padding: 2.0,
                        toggleColor: Color.fromRGBO(225, 225, 225, 1),
                        inactiveColor: Colors.black38,
                        onToggle: (val) {
                          setState(() {
                            status1 = val;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 2.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: Text(
                          'Vibrte',
                          style: TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                      ),
                      FlutterSwitch(
                        width: 85.0,
                        height: 45.0,
                        toggleSize: 35.0,
                        value: status2,
                        borderRadius: 30.0,
                        padding: 2.0,
                        toggleColor: Color.fromRGBO(225, 225, 225, 1),
                        inactiveColor: Colors.black38,
                        onToggle: (val) {
                          setState(() {
                            status3 = val;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
