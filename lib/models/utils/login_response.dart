import 'dart:convert';

class LoginResponse {
  final String? username;
  final String? fullName;
  final String? token;

  LoginResponse(this.username, this.fullName, this.token);

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'fullName': fullName,
      'token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      map['username'],
      map['fullName'],
      map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginResponse(username: $username, fullName: $fullName, token: $token)';
}
