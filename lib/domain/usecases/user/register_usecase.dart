import '../../../data/model/User/request/RegisterRequestModel.dart';
import '../../../data/repositories/auth_repo_impl.dart';
import '../use_case.dart';

class RegisterUsecase extends FutureUsecase<String, RegisterRequestModel> {
  @override
  Future<String> run(RegisterRequestModel request) {
    return AuthoRepoImplement().register(request);
  }
}
