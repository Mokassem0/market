part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginLoding extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {}

final class LoginError extends AuthenticationState {
  final String message;
  LoginError(this.message);
}

final class SignupLoding extends AuthenticationState {}

final class SignupSuccess extends AuthenticationState {}

final class SignupError extends AuthenticationState {
  final String message;
  SignupError(this.message);
}

final class GoogleSignInLoading extends AuthenticationState {}

final class GoogleSignInSuccess extends AuthenticationState {}

final class GoogleSignInError extends AuthenticationState {
  final String message;
  GoogleSignInError(this.message);
}