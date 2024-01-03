import 'package:desktop/customer/auth/custom_email_confirmation.dart';
import 'package:desktop/customer/auth/customer_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../custom_widgets/button_widget.dart';
import '../../custom_widgets/textfield_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../util/validation.dart';
import '../../util/colors.dart';

class CustomerSignupScreen extends StatefulWidget {
  const CustomerSignupScreen({Key? key}) : super(key: key);

  @override
  State<CustomerSignupScreen> createState() => _CustomerSignupScreenState();
}

class _CustomerSignupScreenState extends State<CustomerSignupScreen> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  bool submitted = false;

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    String username = controllerUsername.text;
    String password = controllerPassword.text;
    String email = controllerEmail.text;
    String phone = controllerPhone.text;

    String baseUrl = dotenv.env['FLUTTER_SERVER_URL'] ?? '';
    bool signupSuccess = false;
    String serverMessage = '';

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/customer-auth/register'),
        body: {
          "email": email,
          "username": username,
          "password": password,
          "phoneNumber": phone,
        },
      );

      if (response.statusCode == 200) {
        signupSuccess = true;
        serverMessage = "Signup successful!";
        saveCredentials(username, response.headers['authorization']);
      } else {
        signupSuccess = false;
        serverMessage = response.body; // Use the response body for more details
      }
    } catch (error) {
      signupSuccess = false;
      serverMessage = "An error occurred. Please try again later.";
    } finally {
      setState(() {
        submitted = true;
      });
    }

    _showSignupMessage(signupSuccess, serverMessage);
  }

  void _showSignupMessage(bool success, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  Future<void> saveCredentials(String username, String? token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('token', token ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ProjectColors.whiteColor),
      appBar: AppBar(
        backgroundColor: const Color(ProjectColors.whiteColor),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logos/logo2.png',
              fit: BoxFit.contain,
              height: 50,
            )
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Color(ProjectColors.textColorGreen),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      "Sign-in to get started.",
                      style: TextStyle(
                        color: Color(ProjectColors.blackColorText),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      controller: controllerEmail,
                      hintText: "Enter Email",
                      textInputType: TextInputType.emailAddress,
                      obscureText: false,
                      error: submitted
                          ? Validation.errorEmail(controllerEmail)
                          : null,
                      labelText: "Email",
                      submitted: submitted,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      controller: controllerUsername,
                      hintText: "Enter username",
                      textInputType: TextInputType.text,
                      obscureText: false,
                      error: submitted
                          ? Validation.errorText(controllerUsername)
                          : null,
                      labelText: "Username",
                      submitted: submitted,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      controller: controllerPhone,
                      hintText: "Enter phone number",
                      textInputType: TextInputType.phone,
                      error: submitted
                          ? Validation.errorPhoneNumber(controllerPhone)
                          : null,
                      obscureText: false,
                      labelText: "Phone Number",
                      submitted: submitted,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      controller: controllerPassword,
                      hintText: "Enter password",
                      textInputType: TextInputType.visiblePassword,
                      error: submitted
                          ? Validation.errorPassword(controllerPassword)
                          : null,
                      obscureText: true,
                      labelText: "Password",
                      submitted: submitted,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Button(
                      text: "Sign up",
                      hasIcon: false,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const VerificationScreen()));
                        setState(() {
                          submitted = true;
                        });
                        if (Validation.errorText(controllerUsername) ==
                                null &&
                            Validation.errorText(controllerPassword) ==
                                null) {
                          _signup();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: Color(ProjectColors.blackColorText),
                              fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerLoginScreen()));
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(ProjectColors.textColorGreen)),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
