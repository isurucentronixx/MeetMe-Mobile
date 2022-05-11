import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum VerifyPhoneStatus { COMPLETED, OTP, ERROR }

class VerifyPhoneProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  int get resendTimeout => _resendTimeout;
  TextEditingController get otpController => otpController;
  String get otp => _otp;

  String _verificationId = "";
  int _resendTimeout = 60;
  String _otp = "";

  resendVerificationCode() {
    _otp = "";
    notifyListeners();
  }

  Future<VerifyPhoneStatus> verifyPhoneNumber(
      {required String phoneNumber}) async {
    final completer = Completer<VerifyPhoneStatus>();

    onCompleted(AuthCredential credential) async {
      await _signIn(credential);
      if (!completer.isCompleted) {
        completer.complete(VerifyPhoneStatus.COMPLETED);
      }
    }

    onError(FirebaseAuthException ex) {
      if (!completer.isCompleted) {
        completer.completeError(ex);
      }
    }

    onCodeSent(String verificationId, int? forceResendingToken) {
      _verificationId = verificationId;
      if (!completer.isCompleted) {
        completer.complete(VerifyPhoneStatus.OTP);
      }
    }

    await _auth.verifyPhoneNumber(
      timeout: Duration(seconds: 30),
      phoneNumber: phoneNumber,
      verificationCompleted: onCompleted,
      verificationFailed: onError,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: (verificationId) =>
          onCodeSent(verificationId, null),
    );

    return completer.future;
  }

  Future<void> verifyOtp({required String otp}) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    await _signIn(credential);
    return;
  }

  Future<void> _signIn(AuthCredential credential) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.linkWithCredential(credential);
    } else {
      await _auth.signInWithCredential(credential);
    }
    return;
  }
}
