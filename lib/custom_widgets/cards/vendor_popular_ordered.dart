import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorPopularOrdered extends StatelessWidget {
  const VendorPopularOrdered({super.key, required this.image, required this.dishName, required this.totalOrders, required this.rating});
  final String image;
  final String dishName;
  final int totalOrders;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          children: [
            Image.asset(image, width: 50,),
            const SizedBox(width: 5,),
            Expanded(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                 const SizedBox(height: 1,),
                 Expanded(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "$totalOrders Orders",
                         style: const TextStyle(
                             fontSize: 12,
                             color: Color(ProjectColors.textColorGreen)
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             children: [
                               const Text(
                                 "Rating:",
                                 style: TextStyle(
                                     fontSize: 12,
                                     color: Color(ProjectColors.textColorGreen)
                                 ),
                               ),
                              const  SizedBox(width: 3,),
                               Text(
                                 "$rating",
                                 style: const TextStyle(
                                     fontSize: 12,
                                     color: Color(ProjectColors.blackColorText)
                                 ),
                               )
                             ],
                           ),
                           const SizedBox(width: 4,),
                           RatingBar.builder(
                             initialRating: rating,
                             minRating: 1,
                             direction: Axis.horizontal,
                             allowHalfRating: true,
                             unratedColor: Colors.amber.withAlpha(50),
                             itemCount: 5,
                             itemSize: 10.0,
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
                 )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
