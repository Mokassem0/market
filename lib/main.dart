import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/my_observer.dart';
import 'package:market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:market/views/auth/ui/login_view.dart';
import 'package:market/views/nav_bar/ui/main_home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vloghozftpjfwiypbtup.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZsb2dob3pmdHBqZndpeXBidHVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY4OTc5MDksImV4cCI6MjA2MjQ3MzkwOX0.HGBhmzokzJN7ZLQbgtRUmRDAT6k6DuyxVSrGpCZ7iAE',
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
