import 'package:flutter_application_1/domain/entities/comment/comment_entity.dart';
import 'package:flutter_application_1/domain/entities/post/post_entity.dart';
import 'package:flutter_application_1/domain/entities/user/user_entity.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';

class PostDetailState {
  final PostEntity post;
  final LoadingState isLoading;
  final int currentPage;
  final int totalPage;
  final bool isLogin;
  final String comment;

  const PostDetailState({
    required this.post,
    required this.isLoading,
    required this.currentPage,
    required this.totalPage,
    required this.comment,
    required this.isLogin,
  });

  factory PostDetailState.initial() => const PostDetailState(
      isLoading: LoadingState.initial,
      currentPage: 1,
      totalPage: 1,
      comment: "",
      isLogin: false,
      post: PostEntity(
        comments: [],
        content: "",
        createdAt: "",
        postId: "",
        user: UserEntity(userId: "", name: "", username: "s"),
      ));

  PostDetailState copyWith({
    PostEntity? post,
    LoadingState? isLoading,
    int? currentPage,
    int? totalPage,
    String? comment,
    bool? isLogin,
  }) =>
      PostDetailState(
        post: post ?? this.post,
        isLoading: isLoading ?? this.isLoading,
        currentPage: currentPage ?? this.currentPage,
        totalPage: totalPage ?? this.totalPage,
        comment: comment ?? this.comment,
        isLogin: isLogin ?? this.isLogin,
      );

  PostDetailState addComment({required List<CommentEntity> data}) =>
      PostDetailState(
        post: post.copyWith(comments: [...post.comments, ...data]),
        isLoading: isLoading,
        currentPage: currentPage,
        totalPage: totalPage,
        comment: comment,
        isLogin: isLogin,
      );

  PostDetailState changeComment({required List<CommentEntity> data}) =>
      PostDetailState(
        post: post.copyWith(comments: data),
        isLoading: isLoading,
        currentPage: currentPage,
        totalPage: totalPage,
        comment: comment,
        isLogin: isLogin,
      );
}
