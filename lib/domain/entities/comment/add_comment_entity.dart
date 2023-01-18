import 'package:flutter_application_1/domain/entities/comment/comment_entity.dart';
import 'package:flutter_application_1/domain/entities/user/user_entity.dart';

class AddCommentEntity {
  final UserEntity user;
  final List<CommentEntity> comments;

  const AddCommentEntity({
    required this.user,
    required this.comments,
  });
}
