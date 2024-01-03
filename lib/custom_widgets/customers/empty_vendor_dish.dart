import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
class EmptyVendorDish extends StatelessWidget {
  const EmptyVendorDish({super.key, required this.dishType, required this.vendorName});
  final String dishType;
  final String vendorName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/icons/sad.png", height: 100,),
         Text(
          "Oops! It seems there are no $dishType available at the moment. Please check back later for updates. We apologize for the inconvenience",
          style: const TextStyle(
            fontSize: 16,
            color: Color(ProjectColors.blackColorText)
          ),
        ),
        const  SizedBox(height: 15,),
         Text(
          "In the meantime, feel free to explore other categories and discover delicious dishes from $vendorName.",
          style: const TextStyle(
              fontSize: 16,
              color: Color(ProjectColors.blackColorText)
          ),
        )
      ],
    );
  }
}
