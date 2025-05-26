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

final class LogoutLoading extends AuthenticationState {}

final class LogoutSuccess extends AuthenticationState {}

final class LogoutError extends AuthenticationState {
  final String message;
  LogoutError(this.message);
}

final class PasswordResetLoading extends AuthenticationState {}

final class PasswordResetSuccess extends AuthenticationState {}

final class PasswordResetError extends AuthenticationState {}

final class UserDataAddedLoading extends AuthenticationState {}

final class UserDataAddedSuccess extends AuthenticationState {}

final class UserDataAddedError extends AuthenticationState {}

final class GetUserDataLoading extends AuthenticationState {}

final class GetUserDataSuccess extends AuthenticationState {}

final class GetUserDataError extends AuthenticationState {}
