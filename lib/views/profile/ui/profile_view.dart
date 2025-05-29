import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/app_color.dart';
import 'package:market/product/logic/models/usermodel.dart';
import 'package:market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:market/views/auth/ui/login_view.dart';
import 'package:market/views/profile/ui/edit_name.dart';
import 'package:market/views/profile/ui/my_order.dart';
import 'package:market/views/profile/ui/widget/custom_card_btn.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit()..getUserData(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          }
          if (state is LogoutError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          UserDataModel? user =
              context.read<AuthenticationCubit>().userDataModel;
          return state is LogoutLoading || state is GetUserDataLoading
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
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
                            user?.name ?? "user.name",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            user?.email ?? "User Eamil",
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 10),
                          CustomRowCardBtn(
                            title: "Edit Name",
                            icon: Icons.person,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditName(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          CustomRowCardBtn(
                            title: "My Orders",
                            icon: Icons.shopping_cart,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MyOrder(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          CustomRowCardBtn(
                            title: "Logout",
                            icon: Icons.logout,
                            onTap: () async {
                              await context
                                  .read<AuthenticationCubit>()
                                  .signOut();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
        },
      ),
    );
  }
}
