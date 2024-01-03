import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';

class CartSummaryCard extends StatelessWidget {
  const CartSummaryCard({super.key, required this.image, required this.dishName, required this.quantity, required this.price});
  final String image;
  final String dishName;
  final int quantity;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: SizedBox(
          width:  MediaQuery.of(context).size.width,
          height: 90,
          child: Row(
            children: [
              Image.asset(image, width: 100,),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      dishName,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(ProjectColors.blackColorText)
                      ),
                    ),
                  ),
                 const SizedBox(height: 10,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Qty: $quantity",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(ProjectColors.blackColorText)
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "Price: Ksh. $price",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(ProjectColors.blackColorText)
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
