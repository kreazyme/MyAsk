import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/model/User/request/LoginrequestModel.dart';
import 'package:flutter_application_1/data/model/User/request/RegisterRequestModel.dart';
import 'package:flutter_application_1/data/services/api_client.dart';
import 'package:flutter_application_1/domain/repositories/auth_repo.dart';

class AuthoRepoImplement extends AuthoRepo {
  final ApiClient _apiClient = ApiClient(Dio());

  @override
  Future<String> login(LoginRequestModel request) async {
    var response = await _apiClient.login(request);
    return response.token;
  }

  @override
  Future<String> register(RegisterRequestModel request) async {
    var response = await _apiClient.register(request);
    return response.token;
  }
}
