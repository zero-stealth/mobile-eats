import 'package:desktop/util/data.dart';
import 'package:desktop/vendors/home/vendor_settings.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../vendors/home/manage_dishes.dart';
import '../vendors/home/manage_riders.dart';
import '../vendors/home/notifications_page.dart';

class VendorDrawer extends StatelessWidget {
  const VendorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(ProjectColors.background),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        children: [
          DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logos/logo3.png',
                    fit: BoxFit.contain,
                    height: 50,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 25,
                        color: Color(ProjectColors.lightPink),
                      ))
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(
                          Icons.dinner_dining,
                          color: Color(ProjectColors.whiteColor),
                          size: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Manage Dishes",
                          style: TextStyle(
                              color: Color(ProjectColors.whiteColor), fontSize: 18),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const ManageDishes()));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(
                          Icons.pedal_bike_outlined,
                          color: Color(ProjectColors.whiteColor),
                          size: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Manage Riders",
                          style: TextStyle(
                              color: Color(ProjectColors.whiteColor), fontSize: 18),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const ManageRiders()));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: Color(ProjectColors.whiteColor),
                          size: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                              color: Color(ProjectColors.whiteColor), fontSize: 18),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const NotificationsPage()));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color(ProjectColors.whiteColor),
                          size: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              color: Color(ProjectColors.whiteColor), fontSize: 18),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) =>  VendorSettings(vendors: Data.allVendors[1])));
                    },
                  ),
                ],
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      color: Color(ProjectColors.whiteColor),
                      size: 14,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          color: Color(ProjectColors.whiteColor), fontSize: 18),
                    )
                  ],
                ),
                onTap: () {
                  // logout the user
                  // ...
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
