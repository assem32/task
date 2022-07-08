part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class ChangeToRegister extends GlobalState {}

class LoginSuccess extends GlobalState {
  final LoginModel loginModel;
  LoginSuccess(this.loginModel);
}

class LoginError extends GlobalState {
  final String error;
  LoginError(this.error);
}

class RegisterSuccess extends GlobalState {
  final LoginModel registerModel;
  RegisterSuccess(this.registerModel);
}

class RegisterError extends GlobalState {}
