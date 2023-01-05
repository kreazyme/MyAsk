import 'package:flutter_application_1/domain/entities/user/user_entity.dart';

class CommentEntity {
  final UserEntity user;
  final String content;
  final String createdAt;

  const CommentEntity({
    required this.user,
    required this.content,
    required this.createdAt,
  });
}
