import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../custom_widgets/textfield_widget.dart';
import '../../util/colors.dart';
import 'add_rider_success_page.dart';
import 'add_success_page.dart';
class AddRider extends StatefulWidget {
  const AddRider({super.key});

  @override
  State<AddRider> createState() => _AddRiderState();
}

class _AddRiderState extends State<AddRider> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool submitted = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  XFile? riderImage;
  final ImagePicker pickerRider = ImagePicker();
  Future getImage(ImageSource media) async {
    var imageBizReg = await pickerRider.pickImage(source: media);
    setState(() {
      riderImage = imageBizReg;
    });
  }
  void showSuccess(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: const AddRiderSuccess(message: "Congratulations,your new rider has been added!")
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(ProjectColors.whiteColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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

                TextFieldWidget(
                    controller: emailController,
                    obscureText: false,
                    hintText: "Rider name",
                    labelText: "Enter rider's name",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: emailController,
                    obscureText: false,
                    hintText: "Email",
                    labelText: "Enter rider's email",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: addressController,
                    obscureText: false,
                    hintText: "Address",
                    labelText: "Enter rider's address",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: addressController,
                    obscureText: false,
                    hintText: "Phone number",
                    labelText: "Enter rider's phone number",
                    submitted: submitted,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.phone),
                const SizedBox(height: 7,),
                const Text(
                  "Availability",
                  style: TextStyle(
                    color: Color(ProjectColors.blackColorText ),
                    fontSize: 16,),
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     height: 25,
                     width: 70,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: const Color(0xFFEDF7EE)
                     ),
                     child: const Center(
                       child: Text(
                         "Delivering",
                         style:  TextStyle(
                           color:Color(0xFF367C39)),
                       ),
                     ),
                   ),
                   Container(
                     height: 25,
                     width: 70,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: const Color(0xFFFFF9E6)
                     ),
                     child: const Center(
                       child: Text(
                         "Available",
                         style:  TextStyle(
                        color: Color(0xFFE8B006),
                           fontSize: 14,),
                       ),
                     ),
                   ),
                   Container(
                     height: 25,
                     width: 85,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: const Color(0xFFE6E6E6)
                     ),
                     child: const Center(
                       child: Text(
                         "Unavailable",
                         style:  TextStyle(
                           color: Color(ProjectColors.blackColorText),
                           fontSize: 14,),
                       ),
                     ),
                   ),
                 ],
               ),
                const SizedBox(height: 7,),
                const Text(
                  "Upload Profile Image",
                  style: TextStyle(
                    color: Color(ProjectColors.blackColorText ),
                    fontSize: 16,),
                ),
                const SizedBox(height: 7,),
                GestureDetector(
                  onTap: (){
                    getImage(ImageSource.gallery);
                  },
                  child: DottedBorder(
                    borderType: BorderType.Circle,
                    color: const Color(ProjectColors.textColorGreen),
                    strokeWidth: 1,
                    child: riderImage != null?ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(riderImage!.path),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    ):SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Center(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/cloud.png", width: 100,),
                              const SizedBox(height: 13,),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    "Upload image from gallery 0r drag-and-drop",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(ProjectColors.textColorGreen)
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        //showSuccess();
                      showSuccess();
                      },
                      child: Container(
                        height: 40,

                        width: MediaQuery.of(context).size.width *.3,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.textColorGreen),

                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: const Center(child: Text('Save', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //logic
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*.3,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.whiteColor),
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
}
