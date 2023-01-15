import 'package:flutter_application_1/domain/entities/post/post_entity.dart';

class PostResponseEntity {
  List<PostEntity> posts;
  int totalPage;

  PostResponseEntity({
    required this.posts,
    required this.totalPage,
  });

  PostResponseEntity copyWith({
    List<PostEntity>? posts,
    int? totalPage,
  }) {
    return PostResponseEntity(
      posts: posts ?? this.posts,
      totalPage: totalPage ?? this.totalPage,
    );
  }

  PostResponseEntity addPost({
    required PostEntity post,
  }) {
    return PostResponseEntity(
      posts: [...posts, ...posts],
      totalPage: totalPage,
    );
  }
}
