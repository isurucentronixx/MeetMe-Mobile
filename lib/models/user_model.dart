class UserModel {
  late final String displayName;
  late final String email;
  late final String phoneNumber;
  late final String role;

  UserModel({
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return new UserModel(
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      role: map['role'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'displayName': this.displayName,
      'email': this.email,
      'phoneNumber': this.phoneNumber,
      'role': this.role,
    } as Map<String, dynamic>;
  }
}
