import 'package:flutter/material.dart';
import 'package:market/views/auth/ui/login_view.dart';
import 'package:market/views/nav_bar/ui/main_home_view.dart';

void main() {
  runApp(Market());
}

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mo Market',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainHomeView(),
    );
  }
}
