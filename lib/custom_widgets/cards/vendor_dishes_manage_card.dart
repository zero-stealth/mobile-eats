import 'dart:ui';

import 'package:desktop/models/dishes_model.dart';
import 'package:desktop/util/colors.dart';
import 'package:desktop/vendors/home/edit_dish.dart';
import 'package:flutter/material.dart';

class VendorDishesManageCard extends StatefulWidget {
  const VendorDishesManageCard({super.key, required this.image, required this.desc, required this.dishName, required this.price, required this.vendorName, required this.id});
  final String image;
  final String desc;
  final String vendorName;
  final int id;
  final String dishName;
  final int price;
  @override
  State<VendorDishesManageCard> createState() => _VendorDishesManageCardState();
}

class _VendorDishesManageCardState extends State<VendorDishesManageCard> {
  void confirmDelete(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: const Color(ProjectColors.whiteColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text(
                  "Are you sure you want to delete \"${widget.dishName}\" from Mama's Kitchen?",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(ProjectColors.blackColorText)
                  ),
                   textAlign: TextAlign.center,
                ),
                const SizedBox(height: 7,),
                const Text(
                  "This action cannot be undone.",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(ProjectColors.blackColorText)
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.errorColor),

                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: const Center(child: Text('Delete', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(ProjectColors.textColorGreen)
                            ),

                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: const Center(child: Text('Cancel', style: TextStyle(fontSize: 16, color: Color(ProjectColors.textColorGreen)),)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.image,
              width: 80,
            ),
            const SizedBox(width: 5,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dishName,
                    style: const TextStyle(
                        fontSize: 16, color: Color(ProjectColors.textColorGreen)),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Flexible(
                    child: Text(
                      widget.desc,
                      style: const TextStyle(
                          fontSize: 12, color: Color(ProjectColors.blackColorText)),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Ksh. ${widget.price}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(ProjectColors.textColorGreen),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  child: const Icon(
                    Icons.delete,
                    color: Color(ProjectColors.blackColorText),
                    size: 15,
                  ),
                  onTap: () {
                    confirmDelete();
                  },
                ),
                const SizedBox(width: 5,),
                InkWell(

                  child: const Icon(
                    Icons.edit,
                    color: Color(ProjectColors.blackColorText),
                    size: 15,
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>  EditDishPage(dish: Dishes(id: widget.id, dishName: widget.dishName, price: widget.price, desc: widget.desc, vendorName: widget.vendorName, image: widget.image))));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

