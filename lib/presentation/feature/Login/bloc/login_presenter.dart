import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/usecases/user/login_usecase.dart';
import 'package:flutter_application_1/presentation/feature/Login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../data/model/User/request/LoginrequestModel.dart';
import '../../../resource/AppEnum.dart';

class LoginPresenter extends Cubit<LoginState> {
  LoginPresenter({
    @visibleForTesting LoginState? state,
  }) : super(LoginState.initial());

  final LoginUsecase _loginUsecase = LoginUsecase();

  Future<void> login(LoginRequestModel request) async {
    emit(state.copyWith(isLoading: LoadingState.loading));
    try {
      var token = await _loginUsecase.run(request);
      if (token != "") {
        await Hive.openBox("user");
        await Hive.box("user").put("token", token);
        emit(state.copyWith(isLoading: LoadingState.success));
      } else {
        emit(state.copyWith(isLoading: LoadingState.error));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: LoadingState.error));
    }
  }
}
