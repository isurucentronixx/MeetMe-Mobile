import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

extension MyIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}

class FirebaseService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final _functions = FirebaseFunctions.instance;

  Future<bool> isUserExists({String? email, String? phoneNumber}) async {
    try {
      final result = await _functions.httpsCallable('user-isUserExists').call({
        'email': email,
        'phoneNumber': phoneNumber,
      });
      return result.data;
    } on FirebaseException catch (_) {
      return false;
    }
  }

  Future<void> driverSignup({
    required String displayName,
    required String email,
    required String phoneNumber,
    String? company,
  }) async {
    await _functions.httpsCallable('user-driverSignup').call({
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
      'company': company,
    });
  }
}
