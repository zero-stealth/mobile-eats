import 'package:desktop/custom_widgets/textfield_widget.dart';
import 'package:desktop/models/riders_model.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';

class RiderProfile extends StatefulWidget {
  const RiderProfile({super.key, required this.rider});

  final Riders rider;

  @override
  State<RiderProfile> createState() => _RiderProfileState();
}

class _RiderProfileState extends State<RiderProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(ProjectColors.whiteColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *.67,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rider Profile",
                      style: TextStyle(
                          color: Color(ProjectColors.textColorGreen),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close_outlined,
                        color: Color(0xFFB1B2B2),
                        size: 30,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Image.asset(
                      widget.rider.image,
                      width: 60,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.rider.riderName,
                          style: const TextStyle(
                              color: Color(ProjectColors.textColorGreen),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.rider.phoneNumber,
                          style: const TextStyle(
                              color: Color(ProjectColors.textColorGreen),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldWidget(
                    controller: emailController..text = widget.rider.email,
                    obscureText: false,
                    hintText: "Email",
                    labelText: "Enter rider's email",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: addressController..text = widget.rider.address,
                    obscureText: false,
                    hintText: "Address",
                    labelText: "Enter rider's address",
                    submitted: submitted,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text),
                const SizedBox(height: 7,),
                const Text(
                  "Availability",
                  style: TextStyle(
                      color: Color(ProjectColors.blackColorText ),
                      fontSize: 16,),
                ),
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: widget.rider.availability =="Delivering"?const Color(0xFFEDF7EE):widget.rider.availability
                          =="Available"?const Color(0xFFFFF9E6):const Color(0xFFE6E6E6)
                  ),
                  child: Center(
                    child: Text(
                      widget.rider.availability,
                      style:  TextStyle(
                        color: widget.rider.availability =="Delivering"?const Color(0xFF367C39):widget.rider.availability
                            =="Available"?const Color(0xFFE8B006):const Color(ProjectColors.blackColorText),
                        fontSize: 14,),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        //showSuccess();
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.textColorGreen),

                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: const Center(child: Text('Edit', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.whiteColor),
                            border: Border.all(
                                color: const Color(ProjectColors.textColorGreen)
                            ),
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: const Center(child: Text('Delete', style: TextStyle(fontSize: 16, color: Color(ProjectColors.textColorGreen)),)),
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
}
