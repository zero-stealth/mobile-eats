import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/customer/home/main_home_page.dart';
import 'package:desktop/customer/navbar.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(ProjectColors.whiteColor),
        appBar: AppBar(
            backgroundColor: const Color(ProjectColors.whiteColor),
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            title:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logos/logo2.png',
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ],
                )
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height*.7,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Text(
                          "Please verify your email",
                          style: TextStyle(
                              color: Color(ProjectColors.textColorGreen),
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "You are almost there!.We’ve sent an email to samsmith.example@gmail.comconfirmation link to verify your email address. This step is essential to activate your Mobile Eats account. ",
                          style: TextStyle(
                            fontSize: 16,

                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          " If you don't see the email in your inbox, please check your spam or junk folder",
                          style: TextStyle(
                            fontSize: 16,

                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                   Column(
                     children: [
                       const Text(
                         "Can’t still find the email?",
                         style: TextStyle(
                           fontSize: 16,

                         ),
                         textAlign: TextAlign.center,
                       ),
                       const SizedBox(height: 15,),
                       Button(text: "Resend", hasIcon: false, onTap: (){
                         Navigator.pushReplacement(
                             context, MaterialPageRoute(builder: (context) => const Navbar()));
                       },)
                     ],
                   )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
