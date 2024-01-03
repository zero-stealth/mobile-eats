import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/customer/home/vendor_dishes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../util/colors.dart';
class VendorDetailsCard extends StatelessWidget {
  const VendorDetailsCard({super.key, required this.image, required this.cuisine, required this.specialties, required this.vendorName, required this.rating, required this.location});
  final String image;
  final String cuisine;
  final String vendorName;
  final String location;
  final double rating;
  final List<String> specialties;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
            ),
            child: Image.asset(image, fit: BoxFit.cover,),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(vendorName,
                style: const TextStyle(
                    color: Color(ProjectColors.textColorGreen),
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
              Row(
                children: [
                  Text(
                    "$rating",
                    style: const TextStyle(
                        color: Color(ProjectColors.blackColorText),
                        fontSize: 14
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    unratedColor: Colors.amber.withAlpha(50),
                    itemCount: 5,
                    itemSize: 12.0,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {

                    },
                    updateOnDrag: true,
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cuisine :",
                style: TextStyle(
                    color: Color(ProjectColors.textColorGreen),
                    fontSize: 14
                ),
              ),
              const SizedBox(width: 7,),
              Text(
                cuisine,
                style: const TextStyle(
                    color: Color(ProjectColors.blackColorText),
                    fontSize: 14
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Specialties :",
                style: TextStyle(
                    color: Color(ProjectColors.textColorGreen),
                    fontSize: 14
                ),
              ),
              const SizedBox(width: 7,),
              Flexible(
                child: Text(
                  specialties.toString(),
                  style: const TextStyle(
                      color: Color(ProjectColors.blackColorText),
                      fontSize: 14
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Location :",
                style: TextStyle(
                    color: Color(ProjectColors.textColorGreen),
                    fontSize: 14
                ),
              ),
              const SizedBox(width: 7,),
              Text(
                location,
                style: const TextStyle(
                    color: Color(ProjectColors.blackColorText),
                    fontSize: 14
                ),
              )
            ],
          ),
          Button(text: "Browse Catalogue",hasIcon: false, onTap: (){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const VendorDishesPage()));
          },)
        ],
      ),
    );
  }
}
