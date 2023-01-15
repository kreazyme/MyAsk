class RegisterRequestModel {
  final String username;
  final String password;
  final String name;

  const RegisterRequestModel({
    required this.username,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['name'] = name;
    return data;
  }
}
