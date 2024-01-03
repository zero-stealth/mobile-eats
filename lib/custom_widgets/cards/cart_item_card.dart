import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';

import '../../models/dish_addon_model.dart';
class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key, required this.image, required this.dishName, required this.description, required this.quantity, required this.addons});
  final String image;
  final String dishName;
  final String description;
  final int quantity;
  final List<DishAddon> addons;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  bool checkbox = false;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Image.asset(widget.image, width: MediaQuery.of(context).size.width,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.dishName,
                  style:  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(ProjectColors.textColorGreen)
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.remove, size: 24, color: Color(ProjectColors.textColorGreen),),
                  const SizedBox(width: 5,),
                  Text(
                    "${widget.quantity}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(ProjectColors.blackColorText)
                    ),
                  ),
                  const SizedBox(width: 5,),
                  const Icon(Icons.add_circle_outline, size: 24, color: Color(ProjectColors.textColorGreen),),
                ],
              )
            ],
          ),
          const SizedBox(height: 7,),
          const Text(
            "Description",
            style:  TextStyle(
                fontSize: 18,
                color: Color(ProjectColors.blackColorText)
            ),
          ),
           Text(
            widget.description,
            style:   TextStyle(
                fontSize: 18,
                color: const Color(ProjectColors.blackColorText).withOpacity(0.6)
            ),
          ),
          const SizedBox(height: 7,),
          const Text(
            "Customize your order",
            style:  TextStyle(
                fontSize: 20,
                color: Color(ProjectColors.textColorGreen)
            ),
          ),
          const Text(
            "Would you like to add more Add-on?",
            style:  TextStyle(
                fontSize: 16,
                color: Color(ProjectColors.blackColorText)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "select more",
                style:  TextStyle(
                    fontSize: 11,
                    color: const Color(ProjectColors.blackColorText).withOpacity(0.6)
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {

                    spinner = !spinner;
                  });
                },
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(ProjectColors.blackColorText),
                  size: 20,
                ),
              )
            ],
          ),
          spinner?
          Column(
            children: [
              Container(
                decoration:  const BoxDecoration(
                  color: Color(ProjectColors.lightPink),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Item",
                      style: TextStyle(
                          color:  Color(ProjectColors.blackColorText),
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(
                          color:  Color(ProjectColors.blackColorText),
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(
                          color:  Color(ProjectColors.blackColorText),
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration:   BoxDecoration(
                  color: const Color(ProjectColors.lightPink).withOpacity(.7),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(int i =0; i<widget.addons.length; i++) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    checkColor: widget.addons[i].isActive?const Color(ProjectColors.blackColorText):const Color(ProjectColors.blackColorText).withOpacity(.7),
                                    value: widget.addons[i].isActive,
                                    onChanged: (bool? value){
                                      setState(() {
                                        checkbox =value!;
                                      });
                                    }
                                ),
                                Text(
                                  widget.addons[i].item,
                                  style:  TextStyle(
                                    fontSize: 13,
                                    color: widget.addons[i].isActive?const Color(ProjectColors.blackColorText):const Color(ProjectColors.blackColorText).withOpacity(.7),

                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Ksh. ${widget.addons[i].price}",
                              style:  TextStyle(
                                fontSize: 13,
                                color: widget.addons[i].isActive?const Color(ProjectColors.blackColorText):const Color(ProjectColors.blackColorText).withOpacity(.7),

                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.remove_circle, size: 20, color: Color(ProjectColors.blackColorText),),
                                const SizedBox(width: 5,),
                                Text(
                                  "${widget.quantity}",
                                  style:  TextStyle(
                                    fontSize: 20,
                                    color: widget.addons[i].isActive?const Color(ProjectColors.blackColorText):const Color(ProjectColors.blackColorText).withOpacity(.7),
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                const Icon(Icons.add_circle, size: 20, color: Color(ProjectColors.blackColorText),),
                              ],
                            )
                          ],
                        ),

                      ]
                    ],
                  ),
                ),
              ),
            ],
          ):const SizedBox(),
          const SizedBox(height: 7,)
        ],
      ),
    );
  }
}
