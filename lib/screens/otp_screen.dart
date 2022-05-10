import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/widgets/buttons.dart';

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Enter OTP Code",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              MainElevatedButton(
                onPressed: () => {Navigator.of(context).pushNamed('/calander')},
                child: Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
