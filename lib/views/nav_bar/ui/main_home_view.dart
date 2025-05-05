import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:market/core/app_color.dart';
import 'package:market/views/favorite/ui/favorite_view.dart';
import 'package:market/views/home/ui/home_view.dart';
import 'package:market/views/nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:market/views/profile/ui/profile_view.dart';
import 'package:market/views/store/ui/store_view.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({Key? key}) : super(key: key);
  final List<Widget> views = [
    HomeView(),
    StoreView(),
    FavoriteView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = context.read<NavBarCubit>();
          return Scaffold(
            backgroundColor: AppColor.kScaffoldColor,
            body: SafeArea(child: views[cubit.currentIndex]),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: AppColor.kWhiteColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: GNav(
                  onTabChange: (index) {
                    cubit.changeCurrentIndex(index);
                  },
                  rippleColor:
                      AppColor
                          .kPrimaryColor, // tab button ripple color when pressed
                  hoverColor: AppColor.kPrimaryColor, // tab button hover color
                  tabBorderRadius: 25,
                  duration: Duration(
                    milliseconds: 400,
                  ), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: AppColor.kGreyColor, // unselected icon color
                  activeColor:
                      AppColor.kWhiteColor, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor:
                      AppColor.kPrimaryColor, // selected tab background color
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // navigation bar padding
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.store, text: 'Store'),
                    GButton(icon: Icons.favorite, text: 'Favorites'),
                    GButton(icon: Icons.person, text: 'Profile'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
