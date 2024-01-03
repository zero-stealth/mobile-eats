import 'package:desktop/custom_widgets/cards/notification_card.dart';
import 'package:desktop/custom_widgets/vendor_drawer.dart';
import 'package:desktop/util/data.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ProjectColors.whiteColor),
        title: Image.asset(
          'assets/logos/logo2.png',
          fit: BoxFit.contain,
          height: 50,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen), fontSize: 24),
                ),
                TextButton(
                    onPressed: () {
                      //add some action}
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*.4,
                      child: const Text(
                        "Mark all as read",
                        style: TextStyle(
                            color: Color(ProjectColors.darkBrown), fontSize: 16, fontWeight: FontWeight.w500),
                        softWrap: true,
                      ),

                    ),
                    )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: Data.allNotifications.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: NotificationCard(
                            notification: Data.allNotifications[index]),
                      );
                    }))
          ],
        ),
      ),
      endDrawer: const VendorDrawer(),
    );
  }
}
