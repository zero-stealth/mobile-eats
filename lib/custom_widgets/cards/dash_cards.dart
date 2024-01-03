import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
class DashCards extends StatelessWidget {
  const DashCards({super.key, required this.title, required this.cardValue});
  final String title;
  final String cardValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.45,
      height: 115,
      decoration: BoxDecoration(
        color: Color(ProjectColors.lightPink),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width:MediaQuery.of(context).size.width*.4 ,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(ProjectColors.textColorGreen),
                  fontSize: 14,
                ),
                softWrap: true,
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width:MediaQuery.of(context).size.width*.4,
              child: Text(
                cardValue,
                style: const TextStyle(
                  color: Color(ProjectColors.textColorGreen),
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
