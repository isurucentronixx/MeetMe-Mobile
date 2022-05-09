import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_me_app/widgets/Buttons.dart';
import 'package:meet_me_app/widgets/safe_padded_loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/validation/validator.dart';
import 'package:meet_me_app/providers/login_model_provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginModelProvider>(builder: (context, model, child) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafePaddedLoadingOverlay(
            isLoading: model.isInAsyncCall,
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 130.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: Image.asset(
                      'assets/images/meet-me.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          model.updateModel(isEmailAuth: !model.isEmailAuth);
                        },
                        child: model.isEmailAuth
                            ? Text(
                                "Use phone number insted",
                                style: TextStyle(fontSize: 12.sp),
                              )
                            : Text(
                                "Use Email Insted",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                      )
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: _buildLoginForm(context, model),
                  ),
                  MainElevatedButton(
                    onPressed: () => {
                      if (!FocusScope.of(context).hasPrimaryFocus)
                        {
                          FocusScope.of(context).unfocus(),
                        },
                      _login(context, model)
                    },
                    child: model.isEmailAuth ? Text("Login") : Text("Send OTP"),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.h),
                  ),
                ],
              ),
            ),
          ));
    });
  }

  Widget _buildLoginForm(BuildContext context, LoginModelProvider model) {
    if (model.isEmailAuth) {
      return _buildLoginFormEmailAuth(context, model);
    } else {
      return _buildLoginFormPhoneAuth(context, model);
    }
  }

  Widget _buildLoginFormEmailAuth(
      BuildContext context, LoginModelProvider model) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            labelText: "Email",
          ),
          keyboardType: TextInputType.emailAddress,
          onSaved: (email) {
            if (email != null) {
              model.updateModel(email: email.trim());
            }
          },
          validator: (email) {
            if (!Validator.validateEmail(email)) {
              return "Enter a valid email address";
            }
            return null;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Password",
            icon: Padding(
              padding: EdgeInsets.only(
                top: 15.0.h,
              ),
              child: Icon(Icons.lock),
            ),
            suffixIcon: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(
                  top: 5.0.h,
                ),
                child: model.isPasswordVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
              onPressed: () {
                model.updateModel(isPasswordVisible: !model.isPasswordVisible);
              },
            ),
          ),
          obscureText: !model.isPasswordVisible,
          onSaved: (password) {
            if (password != null) {
              model.updateModel(password: password.trim());
            }
          },
          validator: (input) {
            if (!Validator.validatePassword(input)) {
              return "Password length must be at least 7";
            }
            return null;
          },
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10.h),
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => {},
            child: Text("Forgot Password?"),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginFormPhoneAuth(
      BuildContext context, LoginModelProvider model) {
    return SizedBox(
      height: 169,
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.phone),
          labelText: "Phone number",
        ),
        keyboardType: TextInputType.emailAddress,
        onSaved: (phoneNumber) {
          // if (email != null) {
          //   model.updateModel(email: email.trim());
          // }
        },
        validator: (email) {
          // if (!Validator.validateEmail(email)) {
          //   return "Enter a valid email address";
          // }
          // return null;
        },
      ),
    );
  }

  _login(BuildContext context, LoginModelProvider model) async {
    Navigator.of(context).pushNamed('/otp');
  }
}
