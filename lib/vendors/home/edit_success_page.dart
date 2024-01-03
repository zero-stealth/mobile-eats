import 'package:desktop/custom_widgets/vendor_drawer.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';
import 'manage_dishes.dart';
import 'manage_riders.dart';
import 'notifications_page.dart';

class EditSuccessPage extends StatelessWidget {
  const EditSuccessPage({super.key});

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
          child: Column(
            children: [
              const Text(
                "Success!",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(ProjectColors.textColorGreen)
                ),
              ),
              Image.asset("assets/images/success.png",height: 300,),
              const Text(
                "Congratulations, your changes have been successfully saved!",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(ProjectColors.blackColorText)
                ),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(ProjectColors.textColorGreen),

                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: const Center(child: Text('Back to Dashboard', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: const VendorDrawer(),
    );
  }
}
