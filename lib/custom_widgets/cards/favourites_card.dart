import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key, required this.image, required this.vendorName, required this.price, required this.dishName});
  final String image;
  final String vendorName;
  final int price;
  final String dishName;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Image.asset(image, fit: BoxFit.scaleDown,),
              ),
              const SizedBox(width: 12,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        dishName,
                        style:  const TextStyle(
                          color:  Color(ProjectColors.textColorGreen),
                          fontSize: 20
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Vendor: $vendorName",
                        style:  const TextStyle(
                            color:  Color(ProjectColors.blackColorText),
                            fontSize: 16
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Ksh. $price",
                            style:  const TextStyle(
                                color:  Color(ProjectColors.textColorGreen),
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        SizedBox(width: 80,  child: Button(text: "Order",hasIcon: false, onTap: (){},))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
