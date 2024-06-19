import 'dart:convert';

class RegisterUser {
  final String? email;
  final String? fullName;
  final String? phoneNumber;
  final String? password;
  final String? confirmPassword;

  RegisterUser({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
  });

  RegisterUser copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterUser(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser(
      fullName: map['fullName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromJson(String source) =>
      RegisterUser.fromMap(json.decode(source));
}
