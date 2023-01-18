import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/Comment/request/AddCommentRequestModel.dart';
import 'package:flutter_application_1/data/model/Comment/request/CommentRequestModel.dart';
import 'package:flutter_application_1/domain/entities/comment/list_comment_response_entity.dart';
import 'package:flutter_application_1/domain/entities/post/post_entity.dart';
import 'package:flutter_application_1/domain/usecases/auth/get_token_usecase.dart';
import 'package:flutter_application_1/domain/usecases/comment/add_comment_usecase.dart';
import 'package:flutter_application_1/domain/usecases/comment/get_comment_usecase.dart';
import 'package:flutter_application_1/presentation/feature/Post/bloc/post_detail_state.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailPresenter extends Cubit<PostDetailState> {
  PostDetailPresenter({
    @visibleForTesting PostDetailState? state,
  }) : super(PostDetailState.initial());

  final GetCommentUsecase _getCommentUsecase = GetCommentUsecase();
  final GetTokenUsecase _getTokenUsecase = GetTokenUsecase();
  final AddCommentUsecase _addCommentUsecase = AddCommentUsecase();

  init(PostEntity post) async {
    var data = PostEntity(
      user: post.user,
      postId: post.postId,
      content: post.content,
      createdAt: post.createdAt,
      comments: [],
    );
    emit(state.copyWith(
      post: data,
      isLoading: LoadingState.loading,
    ));
    getToken();
    try {
      final comment = await getComment(1);
      emit(state.copyWith(totalPage: comment.totalPage));
      emit(state.addComment(data: comment.comment));
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: LoadingState.success));
  }

  void onChangeComment(String value) {
    emit(state.copyWith(comment: value));
  }

  Future<ListCommentResponseEntity> getComment(int page) async {
    final CommentRequestModel request = CommentRequestModel(
      postId: state.post.postId,
      page: page,
    );
    return await _getCommentUsecase.run(request);
  }

  Future<void> addComment() async {
    emit(state.copyWith(isLoading: LoadingState.loading));
    AddCommentRequestModel request = AddCommentRequestModel(
      postId: state.post.postId,
      content: state.comment,
    );
    try {
      var result = await _addCommentUsecase.run(request);
      emit(state.copyWith(comment: ""));
      emit(state.changeComment(data: result.comments));
    } catch (err) {
      debugPrint(err.toString());
    }
    emit(state.copyWith(isLoading: LoadingState.success));
  }

  void loadMore(int page) {}

  Future<void> getToken() async {
    String token = await _getTokenUsecase.run();
    try {
      if (token != "") {
        emit(state.copyWith(isLogin: true));
      } else {
        emit(state.copyWith(isLogin: false));
      }
    } catch (err) {
      emit(state.copyWith(isLogin: false));
    }
  }
}
