import 'dart:ui';

import 'package:digicala_test1/screens/card_screen.dart';
import 'package:digicala_test1/screens/home_screen.dart';
import 'package:digicala_test1/screens/product_list_Screen.dart';
import 'package:digicala_test1/screens/profile_screen.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBotonNavigation = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: selectedBotonNavigation,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              currentIndex: selectedBotonNavigation,
              onTap: (int index) {
                setState(() {
                  selectedBotonNavigation = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'SB',
                fontSize: 10,
                color: AppColors.blueApp,
              ),
              selectedLabelStyle: const TextStyle(
                fontFamily: 'SB',
                fontSize: 10,
                color: Colors.black,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icon_profile.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.blueApp,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(0.0, 13),
                        )
                      ]),
                      child:
                          Image.asset('assets/images/icon_profile_active.png'),
                    ),
                  ),
                  label: 'حساب کاربری',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icon_basket.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.blueApp,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(0.0, 13),
                        )
                      ]),
                      child:
                          Image.asset('assets/images/icon_basket_active.png'),
                    ),
                  ),
                  label: 'سبد خرید',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icon_category.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.blueApp,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(0.0, 13),
                        )
                      ]),
                      child:
                          Image.asset('assets/images/icon_category_active.png'),
                    ),
                  ),
                  label: 'دسته بندی',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icon_home.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.blueApp,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(0.0, 13),
                        )
                      ]),
                      child: Image.asset('assets/images/icon_home_active.png'),
                    ),
                  ),
                  label: 'خانه',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return <Widget>[
      const ProfileScreen(),
      const CardScreen(),
      const ProductListScreen(),
      const HomeScreen(),
    ];
  }
}
