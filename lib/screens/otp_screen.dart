import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../providers/verify_phone_provider.dart';

enum VerifyPhoneStatus { COMPLETED, OTP, ERROR }

class OTPScreen extends StatelessWidget {
  late final String phoneNumber;
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  OTPScreen({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyPhoneProvider>(builder: (context, model, child) {
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
                  onPressed: () =>
                      {Navigator.of(context).pushNamed('/calander')},
                  child: Text("Confirm"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
