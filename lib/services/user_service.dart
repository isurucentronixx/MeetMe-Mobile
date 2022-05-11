import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_me_app/models/user_model.dart';
import 'package:uuid/uuid.dart';

class UserService {
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;
  final _functions = FirebaseFunctions.instance;
  final _firestore = FirebaseFirestore.instance;
  String? _verificationId;
  int? _forceResendingToken;

  UserService() {
    // FirebaseFunctions.instance
    //     .useFunctionsEmulator(origin: "http://localhost:5001");
  }

  signOut() async {
    await _auth.signOut().catchError((error) {
      print(error.toString());
    });
  }

  forgotPassword(BuildContext context, {required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message!),
        backgroundColor: Theme.of(context).errorColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on Exception catch (e) {
      print(e);
    }
  }

  changeEmail(BuildContext context) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        print(user.email);
        if (!user.emailVerified) {
          user.sendEmailVerification();
        } else {
          final snackBar = SnackBar(
            content: Text("Email is already exists in the system."),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    } on FirebaseException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message!),
        backgroundColor: Theme.of(context).errorColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on Exception catch (e) {
      print(e);
    }
  }





  Future<String?> getPhotoUrl() async {
    final doc =
        await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
    if (doc.exists) {
      final data = doc.data();
      if (data!.containsKey('photoUrl')) {
        return data['photoUrl'];
      }
    }
    return null;
  }



  Future<UserCredential> linkEmail({
    required String email,
    required String password,
  }) async {
    final credential =
        EmailAuthProvider.credential(email: email, password: password);
    return await _auth.currentUser!.linkWithCredential(credential);
  }

  signInWithEmail(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final credential =
            EmailAuthProvider.credential(email: email, password: password);
        await user.linkWithCredential(credential);
      } else {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } on FirebaseException catch (e) {
      print(e);
      final snackBar = SnackBar(
        content: Text(e.message!),
        backgroundColor: Theme.of(context).errorColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on Exception catch (e) {
      print(e);
    }
  }

  signInWithPhone(
    BuildContext context, {
    required String phoneNumber,
    required void Function() onSuccess,
    void Function()? onError,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (cred) =>
            _signIn(context, cred, onSuccess, onError),
        verificationFailed: (e) => _onError(context, e, onError),
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
        forceResendingToken: _forceResendingToken,
      );
    } on FirebaseException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message!),
        backgroundColor: Theme.of(context).errorColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on Exception catch (e) {
      print(e);
    }
  }

  _onError(
      BuildContext context, FirebaseAuthException e, void Function()? onError) {
    final snackBar = SnackBar(
      content: Text(e.message!),
      backgroundColor: Theme.of(context).errorColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (onError != null) onError();
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    _codeSent(verificationId, null);
  }

  _codeSent(String verificationId, int? forceResendingToken) {
    _verificationId = verificationId;
    _forceResendingToken = forceResendingToken;
  }

  _signIn(BuildContext context, AuthCredential credential,
      void Function() onSuccess, void Function()? onError) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.linkWithCredential(credential).then((user) {
        onSuccess();
      }, onError: (e) => _onError(context, e, onError));
    } else {
      _auth.signInWithCredential(credential).then((user) {
        onSuccess();
      }, onError: (e) => _onError(context, e, onError));
    }
  }

  verifyOtp(BuildContext context, String otp, void Function() onSuccess,
      void Function() onError) async {
    if (_verificationId != null) {
      final credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!, smsCode: otp);
      await _signIn(context, credential, onSuccess, onError);
    }
  }

  Future<int> getUserRating() async {
    final doc = await _firestore
        .collection('user_ratings')
        .doc(_auth.currentUser!.uid)
        .get();
    if (doc.exists) {
      return doc.get('rating') as int;
    }
    return 0;
  }

  // Future<bool> isIdAvailable() async {
  //   final doc = await _firestore
  //       .collection('users')
  //       .doc(_auth.currentUser!.uid)
  //       .doc("id")
  //       .get();
  //   if (doc.exists) {
  //     return true;
  //   }
  //   return false;
  // }






}
