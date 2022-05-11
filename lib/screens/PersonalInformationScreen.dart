import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meet_me_app/screens/profile_screen.dart';

import '../gen/assets.gen.dart';
import '../themes/app_colors.dart';
import '../widgets/buttons.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

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
          'Personal information',
          style: TextStyle(
            color: AppColors.text,
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
                top: 20.h, left: 15.w, right: 15.w, bottom: 100.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0.r),
              color: Colors.white,
            ),
            // height: 375,
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
                    'Full Name',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  personAddTxtFld(text: 'User',),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  personAddTxtFld(text: '0088 112 254',),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  personAddTxtFld(text: 'Email',),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 165.w, bottom: 5.h),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Resend Verification',
                            style: TextStyle(fontSize: 15.sp, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  personAddTxtFld(text: 'Password',),
                  SizedBox(
                    height: 25.h,
                  ),
                  MainElevatedButton(
                    onPressed: () => {},
                    child: Text("UPDATE"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () => {Navigator.of(context).pushNamed('/calander')},
                icon: Assets.images.calendar.image()),
            IconButton(
                onPressed: () => {}, icon: Assets.images.markerMap.image()),
            IconButton(
                onPressed: () => {Navigator.of(context).pushNamed('/addMeet')},
                icon: Assets.images.roundPlus.image()),
            IconButton(onPressed: () => {}, icon: Assets.images.bell.image()),
            IconButton(
                onPressed: () => {Navigator.of(context).pushNamed('/profile')},
                icon: Assets.images.profile.image()),
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class personAddTxtFld extends StatelessWidget {
  final String? text;
  const personAddTxtFld({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 15.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        hintText: text,
      ),
    );
  }
}
