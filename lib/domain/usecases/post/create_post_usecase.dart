import 'package:flutter_application_1/data/repositories/home_repo_impl.dart';

import '../use_case.dart';

class CreatePostUsecase extends FutureUsecase<void, String> {
  @override
  Future<void> run(String content) {
    return HomeRepoImplement().createPost(content);
  }
}
