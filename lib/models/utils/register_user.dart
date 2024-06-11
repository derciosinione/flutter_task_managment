import 'dart:convert';

class RegisterUser {
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? password;
  final String? confirmPassword;
  late final List<String>? roles;

  RegisterUser({
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
    this.roles,
  });

  RegisterUser copyWith({
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    List<String>? roles,
  }) {
    return RegisterUser(
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      roles: roles ?? this.roles,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
      'roles': roles,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser(
      username: map['username'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
      roles: List<String>.from(map['roles']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromJson(String source) =>
      RegisterUser.fromMap(json.decode(source));
}
