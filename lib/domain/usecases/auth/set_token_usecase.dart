// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter_application_1/data/repositories/hive_repo_impl.dart';
import 'package:flutter_application_1/domain/usecases/use_case.dart';

class SetTokenUsecase extends FutureInputUsecase<String> {
  @override
  Future<void> run(String token) async {
    HiveRepoImplement().setToken(token);
  }
}
