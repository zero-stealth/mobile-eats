import 'package:flutter/material.dart';

import '../../custom_widgets/vendor_drawer.dart';
import '../../util/colors.dart';
class NoNotificationsPage extends StatelessWidget {
  const NoNotificationsPage({super.key});

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height*.9,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                const Icon(Icons.notifications_off_outlined, color: Color(ProjectColors.textColorGreen), size: 120,),
                const SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.7,
                  child: const Text(
                    "No New Notifications",
                    style: TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontSize: 24
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Keep an eye on this section for updates and important messages. If you have any questions or need assistance, don't hesitate to reach out to our support team. We're here to help!",
                    style: TextStyle(
                        color: Color(ProjectColors.blackColorText),
                        fontSize: 18
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20,),
                TextButton(
                  onPressed: () {
                    //action
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(ProjectColors.textColorGreen),

                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: const Center(child: Text('Contact Support', style:  TextStyle(fontWeight:FontWeight.bold,fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: const VendorDrawer(),
    );
  }
}
