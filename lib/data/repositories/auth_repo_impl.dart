import 'package:flutter_application_1/data/model/User/request/LoginrequestModel.dart';
import 'package:flutter_application_1/data/model/User/request/RegisterRequestModel.dart';
import 'package:flutter_application_1/domain/repositories/auth_repo.dart';

import '../services/ApiService.dart';

class AuthoRepoImplement extends AuthoRepo {
  final ApiService _apiService = ApiService();

  @override
  Future<String> login(LoginRequestModel request) async {
    var response = await _apiService.login(request);
    return response ?? "";
  }

  @override
  Future<String> register(RegisterRequestModel request) async {
    var response = await _apiService.register(request);
    return response ?? "";
  }
}
