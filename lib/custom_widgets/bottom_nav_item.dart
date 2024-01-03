import 'package:flutter/material.dart';

import '../util/colors.dart';
class BottomNavItem extends StatelessWidget {
  const BottomNavItem({super.key, required this.iconData, required this.onClick,  required this.label, required this.isActive});
  final IconData iconData;
  final VoidCallback onClick;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive?Colors.white: Colors.transparent
      ),
      child: Center(
        child: Column(
          children: [
            IconButton(
              
                onPressed: onClick,
                icon:  Icon(
                  iconData,
                  color: isActive? const Color(ProjectColors.blackColorText): const Color(ProjectColors.textColorGreen),
                  size: 25,
                )
            ),
            Text(
              label,
              style: TextStyle(
                color: isActive? const Color(ProjectColors.blackColorText): const Color(ProjectColors.textColorGreen),
                fontSize: 11
              ),
            )
          ],
        ),
      ),
    );
  }
}
