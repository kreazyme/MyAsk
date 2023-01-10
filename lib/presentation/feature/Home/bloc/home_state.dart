import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';

class HomeState {
  PostResponseEntity data;
  LoadingState isLoading;
  int curentPage;

  HomeState({
    required this.data,
    required this.isLoading,
    required this.curentPage,
  });

  factory HomeState.initial() => HomeState(
        data: PostResponseEntity(
          posts: [],
          totalPage: 2,
        ),
        isLoading: LoadingState.initial,
        curentPage: 1,
      );

  HomeState copyWith({
    PostResponseEntity? data,
    LoadingState? isLoading,
    int? curentPage,
  }) {
    return HomeState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      curentPage: curentPage ?? this.curentPage,
    );
  }

  HomeState addPost({
    required PostResponseEntity data,
  }) {
    return HomeState(
      data: data.copyWith(
        posts: this.data.posts + data.posts,
      ),
      isLoading: isLoading,
      curentPage: curentPage,
    );
  }
}
