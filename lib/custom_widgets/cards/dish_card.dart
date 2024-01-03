import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class DishCard extends StatelessWidget {
  const DishCard({super.key, required this.image, required this.dishName, required this.description, required this.vendorName, required this.price, });
  final String image;
  final String dishName;
  final String description;
  final String vendorName;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(image, fit: BoxFit.contain,),
              Positioned(
                right: 10,
                bottom: 10,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Ksh. $price",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.brown),
                      fontSize: 16
                    ),
                  ),
                ),
              )
            ],
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    dishName,
                    style: const TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "($description)",
                    style: const TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                 Row(
                  children: [
                    const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Vendor",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(ProjectColors.blackColorText)
                        ),
                      ),
                    ),
                    Flexible(
                      child : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          vendorName,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(ProjectColors.blackColorText)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                 Button(hasIcon:true,text: "Add to Cart", iconData: Icons.shopping_cart, onTap: (){},)
              ],
            ),
          )
        ],
      ),
    );
  }
}
