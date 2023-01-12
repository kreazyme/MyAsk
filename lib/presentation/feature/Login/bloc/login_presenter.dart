import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/usecases/auth/set_token_usecase.dart';
import 'package:flutter_application_1/domain/usecases/user/login_usecase.dart';
import 'package:flutter_application_1/presentation/feature/Login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/User/request/LoginrequestModel.dart';
import '../../../resource/AppEnum.dart';

class LoginPresenter extends Cubit<LoginState> {
  LoginPresenter({
    @visibleForTesting LoginState? state,
  }) : super(LoginState.initial());

  final LoginUsecase _loginUsecase = LoginUsecase();
  final SetTokenUsecase _setTokenUsecase = SetTokenUsecase();

  Future<void> login(LoginRequestModel request) async {
    emit(state.copyWith(isLoading: LoadingState.loading));
    try {
      var token = await _loginUsecase.run(request);
      if (token != "") {
        _setTokenUsecase.run(token);
        emit(state.copyWith(isLoading: LoadingState.success));
      } else {
        emit(state.copyWith(isLoading: LoadingState.error));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: LoadingState.error));
    }
  }
}
