import 'package:flutter_application_1/presentation/resource/AppEnum.dart';

class RegisterState {
  String username;
  String password;
  String name;
  LoadingState isLoading;

  RegisterState({
    required this.username,
    required this.password,
    required this.name,
    required this.isLoading,
  });

  factory RegisterState.initial() => RegisterState(
        username: '',
        password: '',
        name: '',
        isLoading: LoadingState.initial,
      );

  RegisterState copyWith({
    String? username,
    String? password,
    String? name,
    LoadingState? isLoading,
  }) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
