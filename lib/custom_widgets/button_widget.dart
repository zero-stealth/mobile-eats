import 'package:flutter/material.dart';

import '../util/colors.dart';
class Button extends StatelessWidget {
  const Button({super.key, required this.text, this.onTap, this.iconData, required this.hasIcon,});
  final String text;
  final bool hasIcon;
  final VoidCallback? onTap;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
      style: TextButton.styleFrom(
          foregroundColor: const Color(ProjectColors.whiteColor), shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),

      ),
          backgroundColor:  const Color(ProjectColors.textColorGreen),
          minimumSize: const Size.fromHeight(40.0)
      ),
      child:    Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon?Icon(iconData, color: Colors.white, size: 18,):const SizedBox(),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),),
            ),
          ],
        ),
      )
    );
  }
}
