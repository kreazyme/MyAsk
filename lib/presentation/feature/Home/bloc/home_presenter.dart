import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/usecases/post/get_post_usecase.dart';
import 'package:flutter_application_1/presentation/feature/Home/bloc/home_state.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePresenter extends Cubit<HomeState> {
  HomePresenter({
    @visibleForTesting HomeState? state,
  }) : super(HomeState.initial());

  final GetPostUsecase _getPostUsecase = GetPostUsecase();

  void init() async {
    emit(state.copyWith(isLoading: LoadingState.loading));
    var data = await _getPostUsecase.run(1);
    emit(state.copyWith(
      data: data,
      isLoading: LoadingState.success,
      curentPage: 1,
    ));
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
}
