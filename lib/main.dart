import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/my_observer.dart';
import 'package:market/core/sensitive_data.dart';
import 'package:market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:market/views/auth/ui/login_view.dart';
import 'package:market/views/nav_bar/ui/main_home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: url,
    anonKey:
        anonKey,
  );
  Bloc.observer = MyObserver();
  runApp(Market());
}

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    print("user id: ${Supabase.instance.client.auth.currentUser?.id}");
    print("session: ${Supabase.instance.client.auth.currentSession}");
    SupabaseClient client = Supabase.instance.client;
    return BlocProvider(
      create: (context) => AuthenticationCubit()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mo Market',
        theme: ThemeData(
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: client.auth.currentSession != null ? MainHomeView() : LoginView(),
      ),
    );
  }
}
