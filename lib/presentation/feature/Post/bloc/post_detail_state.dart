import 'package:flutter_application_1/domain/entities/comment/comment_entity.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';

class PostDetailState {
  final String postId;
  final String content;
  final List<CommentEntity> comments;
  final LoadingState isLoading;

  const PostDetailState(
      {required this.postId,
      required this.content,
      required this.comments,
      required this.isLoading});

  factory PostDetailState.initial() => const PostDetailState(
      postId: "", content: "", comments: [], isLoading: LoadingState.initial);

  PostDetailState copyWith({
    String? postId,
    String? content,
    List<CommentEntity>? comments,
    LoadingState? isLoading,
  }) =>
      PostDetailState(
          postId: postId ?? this.postId,
          content: content ?? this.content,
          comments: comments ?? this.comments,
          isLoading: isLoading ?? this.isLoading);

  PostDetailState addComment({required List<CommentEntity> data}) =>
      PostDetailState(
        postId: postId,
        content: content,
        comments: comments + data,
        isLoading: isLoading,
      );
}
