import 'package:flutter_application_1/domain/entities/post/post_entity.dart';

class PostResponseEntity {
  List<PostEntity> posts;
  int totalPage;

  PostResponseEntity({
    required this.posts,
    required this.totalPage,
  });
}
