import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../util/colors.dart';
class VendorCard extends StatelessWidget {
  const VendorCard({super.key, required this.image, required this.vendorName, required this.cuisine, required this.rating, required this.location});
  final String image;
  final String vendorName;
  final String cuisine;
  final double rating;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, fit: BoxFit.fill,height: 170,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vendorName,
                  style: const TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Row(
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
                  children: [
                    const Text(
                      "Rating :",
                      style: TextStyle(
                          color: Color(ProjectColors.textColorGreen),
                          fontSize: 14
                      ),
                    ),

                    const SizedBox(width: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                const SizedBox(width: 7,),
                Row(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
