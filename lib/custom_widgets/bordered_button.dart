import 'package:flutter/material.dart';

import '../util/colors.dart';
class BorderedButton extends StatelessWidget {
  const BorderedButton({super.key, required this.btnText, this.onTap});
  final String btnText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color(ProjectColors.blackColorText).withOpacity(.7)
            ),
            borderRadius: BorderRadius.circular(7)
        ),
        child:  Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    btnText,
                    style: const TextStyle(
                        color: Color(ProjectColors.blackColorText),
                        fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
