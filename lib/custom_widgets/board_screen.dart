import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key, required this.title, required this.desc, required this.image});
  final String title;
  final String desc;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ProjectColors.background),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(image, width: double.infinity,),
            const SizedBox(height: 20,),
            Text(
              title,
              style: const TextStyle(
                color: Color(ProjectColors.brown),
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                desc,
                style: const TextStyle(
                  color: Color(ProjectColors.whiteColor),
                  fontSize: 14
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
