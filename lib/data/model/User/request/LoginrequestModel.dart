// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    required this.username,
    required this.password,
  });
  LoginRequestModel copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequestModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginRequestModel(username: $username, password: $password)';

  @override
  bool operator ==(covariant LoginRequestModel other) {
    if (identical(this, other)) return true;

    return other.username == username && other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
