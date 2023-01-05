import 'package:flutter_application_1/data/model/User/request/LoginrequestModel.dart';
import 'package:flutter_application_1/data/model/User/request/RegisterRequestModel.dart';

abstract class AuthoRepo {
  Future<String> login(LoginRequestModel request);

  Future<String> register(RegisterRequestModel request);
}
