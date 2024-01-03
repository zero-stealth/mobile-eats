import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';


class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key, required this.filled});
  final bool filled;
  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: const Color(ProjectColors.textColorGreen))
            ),
            child:  widget.filled? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: const Color(ProjectColors.textColorGreen),

                ),),
            ):const Center()
          ),
          Expanded(
              child: Container(
                height: 2,
                color: const Color(ProjectColors.textColorGreen),
              )
          )
        ],
      ),
    );
  }
}
