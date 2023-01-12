import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/usecases/auth/delete_token_usecase.dart';
import 'package:flutter_application_1/domain/usecases/auth/get_token_usecase.dart';
import 'package:flutter_application_1/domain/usecases/post/get_post_usecase.dart';
import 'package:flutter_application_1/presentation/feature/Home/bloc/home_state.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePresenter extends Cubit<HomeState> {
  HomePresenter({
    @visibleForTesting HomeState? state,
  }) : super(HomeState.initial());

  final GetPostUsecase _getPostUsecase = GetPostUsecase();
  final GetTokenUsecase _getTokenUsecase = GetTokenUsecase();
  final DeleteTokenUsecase _deleteTokenUsecase = DeleteTokenUsecase();

  void init() async {
    emit(state.copyWith(isLoading: LoadingState.loading));
    getToken();
    var data = await _getPostUsecase.run(1);
    emit(state.copyWith(
      data: data,
      isLoading: LoadingState.success,
      curentPage: 1,
    ));
  }

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

  Future<void> loadMore(int page) async {
    emit(state.copyWith(isLoading: LoadingState.loadMore));
    var response = await _getPostUsecase.run(page);
    emit(state.addPost(data: response));
    emit(state.copyWith(
      isLoading: LoadingState.success,
      curentPage: page,
    ));
  }

  Future<void> logout() async {
    try {
      await _deleteTokenUsecase.run();
      emit(state.copyWith(isLogin: false));
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
