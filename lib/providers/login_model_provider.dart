import 'package:flutter/cupertino.dart';
import 'package:meet_me_app/models/login_model.dart';

class LoginModelProvider with ChangeNotifier {
  final _model = LoginModel();

  String get email => _model.email;
  String get password => _model.password;
  String get phoneNumber => _model.phoneNumber;
  bool get isEmailAuth => _model.isEmailAuth;
  bool get isPasswordVisible => _model.isPasswordVisible;
  bool get isInAsyncCall => _model.isInAsyncCall;
  bool get isPasswordReset => _model.isPasswordReset;

  updateModel({
    String? email,
    String? password,
    String? phoneNumber,
    bool? isEmailAuth,
    bool? isPasswordVisible,
    bool? isInAsyncCall,
    bool? isPasswordReset,
  }) {
    if (email != null) _model.email = email;
    if (password != null) _model.password = password;
    if (phoneNumber != null) _model.phoneNumber = phoneNumber;
    if (isEmailAuth != null) _model.isEmailAuth = isEmailAuth;
    if (isPasswordVisible != null) _model.isPasswordVisible = isPasswordVisible;
    if (isInAsyncCall != null) _model.isInAsyncCall = isInAsyncCall;
    if (isPasswordReset != null) _model.isPasswordReset = isPasswordReset;
    notifyListeners();
  }
}
