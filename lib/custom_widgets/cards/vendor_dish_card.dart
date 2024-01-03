import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';

class VendorDishCard extends StatelessWidget {
  const VendorDishCard({super.key, required this.image, required this.dishName, required this.price, required this.desc});

  final String image;
  final String dishName;
  final int price;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dishName,
                style:  const TextStyle(
                    color: Color(ProjectColors.textColorGreen),
                    fontSize: 16
                ),
              ),
              Text(
                "Ksh. $price",
                style:  const TextStyle(
                    color: Color(ProjectColors.textColorGreen),
                    fontSize: 16
                ),
              ),

            ],
          ),
          const SizedBox(height: 10,),
          Flexible(child: Text(desc, style: const TextStyle(
            color: Color(ProjectColors.blackColorText),
            fontSize: 18
          ),)),
          const SizedBox(height: 20,),
          Button(text: "Add to Cart", hasIcon: false, iconData: Icons.shopping_cart_outlined,onTap: (){},)
        ]),
      ),
    );
  }
}
