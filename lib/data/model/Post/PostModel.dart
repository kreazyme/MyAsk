import 'package:flutter_application_1/data/model/Post/CommentResponseModel.dart';
import 'package:flutter_application_1/domain/entities/post/post_entity.dart';
import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';
import 'package:flutter_application_1/domain/entities/user/user_entity.dart';

class PostModel {
  List<PostItemModel>? data;
  int? totalPage;

  PostModel({this.data, this.totalPage});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PostItemModel>[];
      json['data'].forEach((v) {
        data!.add(PostItemModel.fromJson(v));
      });
    }
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalPage'] = totalPage;
    return data;
  }

  PostResponseEntity toEntity() {
    return PostResponseEntity(
      posts: data!.map((e) => e.toEntity()).toList(),
      totalPage: totalPage!,
    );
  }
}

class PostItemModel {
  final User user;
  final String sId;
  final String content;
  final String createdAt;
  final String updatedAt;
  final List<CommentResponseModel> comments;

  PostItemModel({
    required this.user,
    required this.sId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.comments,
  });

  factory PostItemModel.fromJson(Map<String, dynamic> json) => PostItemModel(
        user: User.fromJson(json['user']),
        sId: json['_id'],
        content: json['content'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        comments: json['comments'] != null
            ? List<CommentResponseModel>.from(
                json['comments'].map((x) => CommentResponseModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = user.toJson();
    data['_id'] = sId;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['comments'] = comments.map((v) => v.toJson()).toList();
    return data;
  }

  PostEntity toEntity() {
    return PostEntity(
      user: user.toEntity(),
      postId: sId,
      content: content,
      createdAt: createdAt,
      comments: comments.map((e) => e.toEntity()).toList(),
    );
  }
}

class User {
  const User({
    required this.userId,
    required this.username,
    required this.name,
  });

  final String userId;
  final String username;
  final String name;

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
