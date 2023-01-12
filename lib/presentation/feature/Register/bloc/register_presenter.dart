import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/User/request/RegisterRequestModel.dart';
import 'package:flutter_application_1/domain/usecases/auth/set_token_usecase.dart';
import 'package:flutter_application_1/domain/usecases/user/register_usecase.dart';
import 'package:flutter_application_1/presentation/feature/Register/bloc/register_state.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPresenter extends Cubit<RegisterState> {
  RegisterPresenter({
    @visibleForTesting RegisterState? state,
  }) : super(RegisterState.initial());

  final RegisterUsecase _registerUsecase = RegisterUsecase();
  final SetTokenUsecase _setTokenUsecase = SetTokenUsecase();

  void register(RegisterRequestModel request) async {
    emit(state.copyWith(isLoading: LoadingState.loading));
    try {
      var response = await _registerUsecase.run(request);
      if (response != "") {
        _setTokenUsecase.run(response);
        emit(state.copyWith(isLoading: LoadingState.success));
      }
    } catch (err) {
      debugPrint(err.toString());
      emit(state.copyWith(isLoading: LoadingState.error));
    }
  }
}
