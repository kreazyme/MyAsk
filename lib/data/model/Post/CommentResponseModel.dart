import 'package:flutter_application_1/domain/entities/comment/comment_entity.dart';
import 'package:flutter_application_1/domain/entities/user/user_entity.dart';

class CommentResponseModel {
  final User user;
  final String content;
  final String createdAt;

  CommentResponseModel({
    required this.user,
    required this.content,
    required this.createdAt,
  });

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) =>
      CommentResponseModel(
        user: User.fromJson(json['user']),
        content: json['content'],
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = user.toJson();
    data['content'] = content;
    data['createdAt'] = createdAt;
    return data;
  }

  CommentEntity toEntity() {
    return CommentEntity(
      user: user.toEntity(),
      content: content,
      createdAt: createdAt,
    );
  }
}

class User {
  String userId;
  String username;
  String name;

  User({
    required this.userId,
    required this.username,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['user_id'],
        username: json['username'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['username'] = username;
    data['name'] = name;
    return data;
  }

  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      username: username,
      name: name,
    );
  }
}
