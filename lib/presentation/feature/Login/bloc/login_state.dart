import 'package:flutter_application_1/presentation/resource/AppEnum.dart';

class LoginState {
  String email;
  String password;
  LoadingState isLoading;

  LoginState({
    required this.email,
    required this.password,
    required this.isLoading,
  });

  factory LoginState.initial() => LoginState(
        email: '',
        password: '',
        isLoading: LoadingState.initial,
      );

  LoginState copyWith({
    String? email,
    String? password,
    LoadingState? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
