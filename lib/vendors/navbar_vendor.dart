import 'dart:ui';

import 'package:desktop/controllers/NavbarController.dart';
import 'package:desktop/custom_widgets/bottom_nav_item.dart';
import 'package:desktop/vendors/home/vendor_home_main.dart';
import 'package:desktop/vendors/order/vendor_orders.dart';
import 'package:desktop/vendors/wallet/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarVendor extends StatefulWidget {
  const NavbarVendor({super.key});

  @override
  State<NavbarVendor> createState() => _NavbarVendorState();
}

class _NavbarVendorState extends State<NavbarVendor> {
  final controller = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (context) {
      return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: const [
              VendorHomeMain(),
              VendorOrders(),
              TransactionsPage(),
            ],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.2),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottomNavItem(
                          iconData: Icons.home_filled,
                          label: "Home",
                          onClick: () {
                            controller.changeTabIndex(0);
                          },
                          isActive: controller.tabIndex == 0 ? true : false,
                        ),
                        BottomNavItem(
                          iconData: Icons.shopping_cart_outlined,
                          label: "Order",
                          onClick: () {
                            controller.changeTabIndex(1);
                          },
                          isActive: controller.tabIndex == 1 ? true : false,
                        ),
                        BottomNavItem(
                            iconData: Icons.history,
                            label: "Wallet",
                            onClick: () {
                              controller.changeTabIndex(2);
                            },
                            isActive: controller.tabIndex == 2 ? true : false),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
    });
  }
}

_bottomBarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
