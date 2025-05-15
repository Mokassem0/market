import 'package:flutter/material.dart';
import 'package:market/views/auth/ui/login_view.dart';
import 'package:market/views/nav_bar/ui/main_home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SupabaseClient client = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    // انتظر استعادة الجلسة
    await Future.delayed(Duration(seconds: 1));

    final session = client.auth.currentSession;
    if (session != null && session.user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainHomeView()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
);
}
}