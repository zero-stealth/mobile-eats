import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:desktop/onboarding/boarding.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() async {
//  await dotenv.load(fileName: ".env");
//   runApp(const MyApp());
// }

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'mobile eats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(ProjectColors.background)),
        useMaterial3: true,
        fontFamily: 'Gilroy',
      ),
      home: const BoardingScreen(),
    );
  }
}
