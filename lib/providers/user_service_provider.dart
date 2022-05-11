import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:meet_me_app/services/firebase_service.dart';
import 'package:meet_me_app/services/user_service.dart';

class AuthProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _userService = UserService();
  final _firebaseService = FirebaseService();

  String? _photoUrl;
  String? _userName;
  String? _email;
  String? _phoneNumber;
  String? _password;
  String? _company = "";
  String? _role;
  File? _profileImage;
  bool _isPasswordVisible = false;
  bool _isInAsyncCall = false;
  bool _isEnable = false;
  String? _avatar;

  String _rating = "0";
  bool isPortPassAvailable = false;

  String? get photoUrl => _photoUrl;
  File? get profileImage => _profileImage;
  String? get name => _userName;
  String? get email => _email;
  String? get password => _password;
  String? get phoneNumber => _phoneNumber;
  String? get company => _company;
  bool get isPasswordVisible => _isPasswordVisible;
  String? get avatar => _avatar;

  bool get isInAsyncCall => _isInAsyncCall;

  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();
  User? get user => _auth.currentUser;

  UserService get userService => _userService;

  FirebaseService get firebaseService => _firebaseService;

  bool get isEnable => _isEnable;

  String get rating => _rating;

  setEnableState({bool? isEnable}) {
    if (isEnable != null) {
      _isEnable = isEnable;
      notifyListeners();
    }
  }

  set setIsEnable(bool value) {
    _isEnable = value;
  }

  set setEmail(String value) {
    _email = value;
  }

  getAvatar() {
    userService.getPhotoUrl().then((value) {
      _photoUrl = value;
      if (_photoUrl != null) {
        final Reference storageReference =
            FirebaseStorage.instance.ref().child(_photoUrl!);
        storageReference.getDownloadURL().then((value) {
          _avatar = value;
        });
      } else {
        _avatar = user!.photoURL;
      }
    });
  }

  update({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? company,
    String? photoUrl,
    File? profileImage,
    bool? isPasswordVisible,
    bool? isInAsyncCall,
  }) {
    if (photoUrl != null) _photoUrl = photoUrl;
    if (profileImage != null) _profileImage = profileImage;

    if (name != null) _userName = name;
    if (email != null) _email = email;
    if (password != null) _password = password;
    if (phoneNumber != null) _phoneNumber = phoneNumber;
    if (company != null) _company = company;
    if (isPasswordVisible != null) _isPasswordVisible = isPasswordVisible;
    if (isInAsyncCall != null) _isInAsyncCall = isInAsyncCall;
    notifyListeners();
  }

  setRating() {
    userService.getUserRating().then((value) => _rating = value.toString());
  }
}
