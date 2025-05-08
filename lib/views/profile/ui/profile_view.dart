import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';
import 'package:market/views/profile/ui/widget/custom_card_btn.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldColor,
      body: ListView(
        children: [
          SizedBox(height: 75),
          Container(
            padding: const EdgeInsets.all(15),
            color: AppColor.kWhiteColor,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor.kPrimaryColor,
                  foregroundColor: AppColor.kWhiteColor,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: AppColor.kWhiteColor,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "User Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("User Eamil", style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                CustomRowCardBtn(
                  title: "Edit Profile",
                  icon: Icons.person,
                  onTap: () {},
                ),
                SizedBox(height: 10),
                CustomRowCardBtn(
                  title: "My Orders",
                  icon: Icons.shopping_cart,
                  onTap: () {},
                ),
                SizedBox(height: 10),
                CustomRowCardBtn(
                  title: "Logout",
                  icon: Icons.logout,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
