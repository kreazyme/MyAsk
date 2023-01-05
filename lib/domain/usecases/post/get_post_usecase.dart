import 'package:flutter_application_1/data/repositories/home_repo_impl.dart';
import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';
import 'package:flutter_application_1/domain/usecases/use_case.dart';

class GetPostUsecase extends FutureUsecase<PostResponseEntity, int> {
  @override
  Future<PostResponseEntity> run(int page) {
    return HomeRepoImplement().getPost(page);
  }
}
