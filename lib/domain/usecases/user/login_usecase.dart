import 'package:flutter_application_1/data/model/User/request/LoginrequestModel.dart';
import 'package:flutter_application_1/data/repositories/auth_repo_impl.dart';
import 'package:flutter_application_1/domain/usecases/use_case.dart';

class LoginUsecase extends FutureUsecase<String, LoginRequestModel> {
  @override
  Future<String> run(LoginRequestModel request) {
    return AuthoRepoImplement().login(request);
  }
}
