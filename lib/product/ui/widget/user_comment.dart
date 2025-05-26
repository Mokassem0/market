import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "User Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(children: [Text("User Name", style: TextStyle(fontSize: 14))]),
        Row(
          children: [
            Text(
              "Reply:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(children: [Text("Replay....", style: TextStyle(fontSize: 14))]),
      ],
    );
  }
}
