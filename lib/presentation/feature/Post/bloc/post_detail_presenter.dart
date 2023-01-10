import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/feature/Post/bloc/post_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailPresenter extends Cubit<PostDetailState> {
  PostDetailPresenter({
    @visibleForTesting PostDetailState? state,
  }) : super(PostDetailState.initial());
}
