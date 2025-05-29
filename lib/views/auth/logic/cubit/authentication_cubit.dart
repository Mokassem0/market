import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market/product/logic/models/usermodel.dart';
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
      await getUserData();
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
      await addUserData(name: name, email: email);
      await getUserData();
      emit(SignupSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(SignupError(e.message));
    } catch (e) {
      log(e.toString());
      emit(SignupError(e.toString()));
    }
  }

  GoogleSignInAccount? googleUser;

  Future<AuthResponse> googleSignIn() async {
    emit(GoogleSignInLoading());

    const webClientId =
        '503058702267-ld29v4quneer5u98g8otbgh2egoq7mrv.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: webClientId);
    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null && idToken == null) {
      emit(
        GoogleSignInError(
          'Google sign-in failed: missing access token and id token',
        ),
      );
      return AuthResponse();
    }

    AuthResponse response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken ?? '',
      accessToken: accessToken,
    );
    await addUserData(name: googleUser!.displayName!, email: googleUser!.email);
    await getUserData();
    emit(GoogleSignInSuccess());
    return response;
  }

  Future<void> signOut() async {
    emit(LogoutLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(LogoutError(e.message));
    } catch (e) {
      log(e.toString());
      emit(LogoutError(e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(PasswordResetLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(PasswordResetSuccess());
    } catch (e) {
      emit(PasswordResetError());
    }
  }

  Future<void> addUserData({
    required String name,
    required String email,
  }) async {
    emit(UserDataAddedLoading());
    try {
      await client.from('users').upsert({
        "name": name,
        "email": email,
        "id": client.auth.currentUser!.id,
      });
      emit(UserDataAddedSuccess());
    } catch (e) {
      // Handle the error or log it
      log(e.toString());
      emit(UserDataAddedError());
    }
  }

  UserDataModel? userDataModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final data =
          await client
              .from('users')
              .select()
              .eq("id", client.auth.currentUser!.id)
              .single();
      userDataModel = UserDataModel(
        UserId: data['id'],
        name: data['name'],
        email: data['email'],
      );
      emit(GetUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetUserDataError());
    }
  }
}
