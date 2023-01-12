import 'package:flutter_application_1/data/repositories/hive_repo_impl.dart';
import 'package:flutter_application_1/domain/usecases/use_case.dart';

class GetTokenUsecase extends FutureOutputUsecase<String> {
  @override
  Future<String> run() {
    return HiveRepoImplement().getToken();
  }
}
