import 'package:desktop/customer/auth/customer_signup_screen.dart';
import 'package:desktop/custom_widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:desktop/util/validation.dart';
import 'package:desktop/util/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({Key? key}) : super(key: key);

  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool submitted = false;

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerUsername.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    String username = controllerUsername.text;
    String password = controllerPassword.text;

    String baseUrl = dotenv.env['FLUTTER_SERVER_URL'] ?? '';
    bool loginSuccess = false;
    String serverMessage = '';

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/customer-auth/login'),
        body: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        loginSuccess = true;
        serverMessage = "Login successful!";
        saveCredentials(username, response.headers['authorization']);
      } else {
        loginSuccess = false;
        serverMessage = "Login failed. Please check your credentials.";
      }
    } catch (error) {
      loginSuccess = false;
      serverMessage = "An error occurred. Please try again later.";
    }

    _showLoginMessage(loginSuccess, serverMessage);
  }

  void _showLoginMessage(bool success, String message) {
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
      body: Padding(
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
                  controller: controllerUsername,
                  textInputType: TextInputType.text,
                  hintText: "Enter username",
                  obscureText: false,
                  error: submitted
                      ? Validation.errorText(controllerUsername)
                      : null,
                  labelText: "Username",
                  submitted: submitted,
                  textInputAction: TextInputAction.next,
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
            Column(
              children: [
                Button(
                  text: "Log in",
                  hasIcon: false,
                  onTap: () {
                    setState(() {
                      submitted = true;
                    });

                    if (Validation.errorText(controllerUsername) == null &&
                        Validation.errorText(controllerPassword) == null) {
                      _login();
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
                      "Don’t have an account yet?",
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
                                  const CustomerSignupScreen()),
                        );
                      },
                      child: const Text(
                        "Sign up",
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
    );
  }
}
