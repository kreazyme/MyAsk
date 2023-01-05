import 'package:flutter_application_1/domain/entities/comment/comment_entity.dart';
import 'package:flutter_application_1/domain/entities/user/user_entity.dart';

class PostEntity {
  final UserEntity user;
  final String postId;
  final String content;
  final String createdAt;
  final List<CommentEntity> comments;

  const PostEntity({
    required this.user,
    required this.postId,
    required this.content,
    required this.createdAt,
    required this.comments,
  });
}
