import 'package:flutter_application_1/data/model/Post/CommentResponseModel.dart';
import 'package:flutter_application_1/domain/entities/comment/list_comment_response_entity.dart';

class ListCommentResponseModel {
  final List<CommentResponseModel> comment;
  final int totalPage;

  ListCommentResponseModel({
    required this.comment,
    required this.totalPage,
  });

  factory ListCommentResponseModel.fromJson(Map<String, dynamic> json) =>
      ListCommentResponseModel(
        comment: List<CommentResponseModel>.from(
            json["data"].map((x) => CommentResponseModel.fromJson(x))),
        totalPage: json["totalPage"],
      );

  ListCommentResponseEntity toEntity() => ListCommentResponseEntity(
        comment: comment.map((e) => e.toEntity()).toList(),
        totalPage: totalPage,
      );
}
