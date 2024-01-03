import 'package:desktop/custom_widgets/bordered_button.dart';
import 'package:desktop/custom_widgets/textfield_widget.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';

class SettingsMainPage extends StatefulWidget {
  const SettingsMainPage({super.key});

  @override
  State<SettingsMainPage> createState() => _SettingsMainPageState();
}

class _SettingsMainPageState extends State<SettingsMainPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool submitted = false;
  bool on = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/logos/logo2.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(ProjectColors.textColorGreen)),
              ),
              const SizedBox(
                height: 7,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 50,
                    color: Color(ProjectColors.blackColorText),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sam Smith",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(ProjectColors.textColorGreen)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "sam.smith@example.com",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(ProjectColors.blackColorText)),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile Information",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(ProjectColors.textColorGreen)),
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(ProjectColors.textColorGreen)),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldWidget(
                          controller: emailController,
                          obscureText: false,
                          labelText: "Email",
                          submitted: submitted,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.emailAddress),
                      TextFieldWidget(
                          controller: usernameController,
                          obscureText: false,
                          labelText: "Username",
                          submitted: submitted,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text),
                      TextFieldWidget(
                          controller: phoneController,
                          obscureText: false,
                          labelText: "Phone Number",
                          submitted: submitted,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.phone),

                      const SizedBox(height: 10,),

                      const Text(
                        "Profile Information",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(ProjectColors.textColorGreen)),
                      ),
                      const SizedBox(height: 15,),
                      BorderedButton(btnText: "Change Password", onTap: (){},),
                      const SizedBox(height: 15,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(ProjectColors.blackColorText).withOpacity(.7)
                            ),
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Notifications",
                                style: TextStyle(
                                    color: Color(ProjectColors.blackColorText),
                                    fontSize: 16
                                ),
                              ),
                              Switch(value: on, activeColor: const Color(ProjectColors.textColorGreen), onChanged: (bool value){
                                setState(() {
                                  on =value;
                                });
                              })
                            ],
                          ),
                        )
                      ),
                      const SizedBox(height: 15,),
                      BorderedButton(btnText: "Delete Account", onTap: (){},),
                      const SizedBox(height: 15,),
                      BorderedButton(btnText: "FAQ", onTap: (){},),
                      const SizedBox(height: 15,),
                       BorderedButton(btnText: "Contact Support", onTap:(){}),
                      const SizedBox(height: 15,),
                    BorderedButton(btnText: "Terms of Service", onTap:(){}),
                      const SizedBox(height: 25,),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Log Out",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(ProjectColors.textColorGreen)),),
                          Icon(Icons.logout, size: 25, color: Color(ProjectColors.textColorGreen),)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
