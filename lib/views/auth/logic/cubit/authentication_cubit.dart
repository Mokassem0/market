
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  var client = Supabase.instance.client;
  Future<void> login(String email, String password) async {
    emit(LoginLoding());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(LoginError(e.message));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
