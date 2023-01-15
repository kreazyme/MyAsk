import 'package:flutter_application_1/data/model/Post/request/PostRequestModel.dart';
import 'package:flutter_application_1/data/repositories/home_repo_impl.dart';
import 'package:flutter_application_1/domain/entities/post/post_entity.dart';

import '../use_case.dart';

class CreatePostUsecase extends FutureUsecase<PostEntity, PostRequestModel> {
  @override
  Future<PostEntity> run(PostRequestModel request) {
    return HomeRepoImplement().createPost(request);
  }
}
