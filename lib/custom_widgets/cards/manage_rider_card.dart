import 'dart:ui';

import 'package:desktop/models/riders_model.dart';
import 'package:desktop/util/colors.dart';
import 'package:desktop/vendors/home/rider_profile.dart';
import 'package:flutter/material.dart';
class ManageRiderCard extends StatelessWidget {
  const ManageRiderCard({super.key, required this.rider});

  final Riders rider;
  @override
  Widget build(BuildContext context) {
    void showEditDialogue(Riders rider){
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: RiderProfile(rider: rider,)
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color:  const Color(ProjectColors.whiteColor).withOpacity(0.9),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                rider.riderName,
                style: const TextStyle(
                  color: Color(ProjectColors.textColorGreen),
                  fontSize: 18
                )
              ),
            const SizedBox(height: 4,),
            Text(
                rider.phoneNumber,
                style: const TextStyle(
                    color: Color(ProjectColors.blackColorText),
                    fontSize: 18
                )
            ),
            const SizedBox(height: 4,),
            Text(
                rider.email,
                style: const TextStyle(
                    color: Color(ProjectColors.blackColorText),
                    fontSize: 18
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  decoration:  BoxDecoration(
                    color: const Color(0xFFE6E6E6),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      rider.availability,
                        style: const TextStyle(
                            color: Color(ProjectColors.blackColorText),
                            fontSize: 16
                        )
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 16,
                        color: Color(ProjectColors.blackColorText),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: (){},
                      child: const Icon(
                        Icons.delete,
                        size: 16,
                        color: Color(0xFFB00020),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                      showEditDialogue(rider);
                      },
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(ProjectColors.textColorGreen),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

