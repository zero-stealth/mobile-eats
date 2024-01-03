import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/customer/auth/customer_login_screen.dart';
import 'package:desktop/util/colors.dart';
import 'package:desktop/vendor/auth/vendor_login_page.dart';
import 'package:flutter/material.dart';
class ChooseAccount extends StatelessWidget {
  const ChooseAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(ProjectColors.whiteColor),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.37,
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    "Welcome! Please select the account type you want to create",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.textColorGreen)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Button(text: "Customer", hasIcon: false, onTap: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const CustomerLoginScreen()));
                    },),
                  ),
                  const SizedBox(height: 10,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Button(text: "Vendor", hasIcon: false, onTap: (){
                        Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const VendorLoginPage()));

                    },),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
