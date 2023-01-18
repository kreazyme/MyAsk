import 'package:flutter_application_1/data/model/Post/CommentResponseModel.dart';
import 'package:flutter_application_1/domain/entities/comment/add_comment_entity.dart';

class AddCommentResponseModel {
  final User user;
  final List<CommentResponseModel> comments;

  AddCommentResponseModel({
    required this.user,
    required this.comments,
  });

  factory AddCommentResponseModel.fromJson(Map<String, dynamic> json) {
    return AddCommentResponseModel(
      user: User.fromJson(json['user']),
      comments: List<CommentResponseModel>.from(
          json['comments'].map((x) => CommentResponseModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['comments'] = comments.map((x) => x.toJson()).toList();
    return data;
  }

  AddCommentEntity toEntity() {
    return AddCommentEntity(
      user: user.toEntity(),
      comments: comments.map((e) => e.toEntity()).toList(),
    );
  }
}
