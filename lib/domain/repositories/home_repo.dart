import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';

abstract class HomeRepo {
  Future<PostResponseEntity> getPost(int page);

  Future<void> createPost(String content);
}
