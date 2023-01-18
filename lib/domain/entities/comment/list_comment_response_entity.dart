import 'package:flutter_application_1/domain/entities/comment/comment_entity.dart';

class ListCommentResponseEntity {
  final List<CommentEntity> comment;
  final int totalPage;
  const ListCommentResponseEntity({
    required this.comment,
    required this.totalPage,
  });
}
