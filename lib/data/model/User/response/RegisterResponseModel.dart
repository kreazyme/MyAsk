class RegisterResponseModel {
  final String token;
  const RegisterResponseModel({required this.token});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
    };
  }
}
