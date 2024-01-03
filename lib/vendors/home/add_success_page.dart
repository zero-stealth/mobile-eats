import 'package:desktop/custom_widgets/vendor_drawer.dart';
import 'package:desktop/vendors/home/manage_dishes.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';
class AddSuccessPage extends StatelessWidget {
  const AddSuccessPage({super.key, required this.message});
  final String message;
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
               SizedBox(
                 width: MediaQuery.of(context).size.width*.7,
                 child: Text(
                   message,
                   style: const TextStyle(
                       fontSize: 20,
                       color: Color(ProjectColors.blackColorText)
                   ),
                   textAlign: TextAlign.center,
                   softWrap: true,
                 ),
               ),
              const SizedBox(height: 50,),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const ManageDishes()));
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(ProjectColors.textColorGreen),

                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: const Center(child: Text('Back to Dashboard', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(ProjectColors.whiteColor)),)),
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
