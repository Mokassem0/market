import 'package:bloc/bloc.dart';
import 'dart:developer';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoding());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(LoginError(e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginError(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoding());
    try {
      await client.auth.signUp(email: email, password: password);
      emit(SignupSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(SignupError(e.message));
    } catch (e) {
      log(e.toString());
      emit(SignupError(e.toString()));
    }
  }
}
