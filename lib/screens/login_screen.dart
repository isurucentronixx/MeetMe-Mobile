import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_me_app/providers/user_service_provider.dart';
import 'package:meet_me_app/widgets/buttons.dart';
import 'package:meet_me_app/widgets/safe_padded_loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/validation/validator.dart';
import 'package:meet_me_app/providers/login_model_provider.dart';

class LoginScreen extends StatelessWidget {
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginModelProvider>(builder: (context, model, child) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafePaddedLoadingOverlay(
            isLoading: model.isInAsyncCall,
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            child: SingleChildScrollView(
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
                      child:
                          model.isEmailAuth ? Text("Login") : Text("Send OTP"),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10.h),
                    ),
                  ],
                ),
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
        keyboardType: TextInputType.text,
        onChanged: (input) {
          if (input != null) {
            model.updateModel(phoneNumber: input.trim());
          }
        },
        validator: (input) {
          if (input == null || input.isEmpty) {
            return "Enter a valid phone number";
          }
          return null;
        },
      ),
    );
  }

  _login(BuildContext context, LoginModelProvider model) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    debugPrint(model.phoneNumber);

    await Navigator.of(context)
        .pushNamed('/otp', arguments: model.phoneNumber);

    if (auth.user != null) {
      FirebaseAuth.instance.signOut();
    }

    final state = _formKey.currentState;

    // if (state != null && state.validate()) {
    //   state.save();
    //   model.updateModel(isInAsyncCall: true);
    //   final isExists = await auth.firebaseService
    //       .isUserExists(email: model.email, phoneNumber: model.phoneNumber);
    //   if (!isExists) {
    //     model.updateModel(isInAsyncCall: false);
    //     final snackBar = SnackBar(
    //       content: Text("Account doesn't exist. Please sign-up!"),
    //       backgroundColor: Theme.of(context).errorColor,
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   }
    //   else {
    //     if (model.isEmailAuth) {
    //       await auth.userService.signInWithEmail(context,
    //           email: model.email, password: model.password);
    //     } else {

    //           debugPrint(model.phoneNumber);

    //       // await Navigator.of(context)
    //       //     .pushNamed('/verifyPhone', arguments: model.phoneNumber);
    //     }
    //   }
    //   model.updateModel(isInAsyncCall: false);
    //   if (auth.user != null) {
    //     Navigator.of(context)
    //         .pushNamedAndRemoveUntil('/home', (route) => route.isFirst);
    //   }
    // }

    //debugPrint('movieTitle: $auth');
    //auth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)

    //Navigator.of(context).pushNamed('/otp');
  }
}
