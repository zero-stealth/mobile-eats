import 'dart:ui';

import 'package:desktop/controllers/NavbarController.dart';
import 'package:desktop/custom_widgets/bottom_nav_item.dart';
import 'package:desktop/customer/cart/cart_main_page.dart';
import 'package:desktop/customer/history/history_main_page.dart';
import 'package:desktop/customer/home/main_home_page.dart';
import 'package:desktop/customer/settings/settings_main_page.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final controller = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
        builder: (context){
          return Scaffold(
            body: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomePageScreen(),
                CartMainPage(),
                HistoryMainPage(),
                SettingsMainPage()
              ],
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50)
                    ),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.2),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(

                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30)
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                         BottomNavItem(iconData: Icons.home_filled, label: "Home", onClick: (){controller.changeTabIndex(0);}, isActive:controller.tabIndex==0?true: false,),
                          BottomNavItem(iconData: Icons.shopping_cart_outlined, label: "Cart", onClick: (){controller.changeTabIndex(1);}, isActive: controller.tabIndex==1?true: false,),
                          BottomNavItem(iconData: Icons.history, label: "History", onClick: (){controller.changeTabIndex(2);}, isActive:controller.tabIndex==2?true: false),
                          BottomNavItem(iconData: Icons.settings, label: "Settings", onClick: (){controller.changeTabIndex(3);}, isActive:controller.tabIndex==3?true: false),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          );
        });
  }
}
_bottomBarItem(IconData icon, String label){
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
