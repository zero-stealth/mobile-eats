

import 'dart:io';

import 'package:desktop/vendors/home/vendor_home_main.dart';
import 'package:desktop/vendors/navbar_vendor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../util/colors.dart';
class VendorDocumentUpload extends StatefulWidget {
  const VendorDocumentUpload({super.key});

  @override
  State<VendorDocumentUpload> createState() => _VendorDocumentUploadState();
}

class _VendorDocumentUploadState extends State<VendorDocumentUpload> {
  XFile? bizRegImage;
  XFile? healthImage;
  final ImagePicker pickerBizReg = ImagePicker();
  final ImagePicker pickerHealth= ImagePicker();
  Future getImage(ImageSource media) async {
    var imageBizReg = await pickerBizReg.pickImage(source: media);
    var imageHealth = await pickerHealth.pickImage(source: media);
    setState(() {
      bizRegImage = imageBizReg;
      healthImage =imageHealth;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ProjectColors.whiteColor),
      appBar: AppBar(
          backgroundColor: const Color(ProjectColors.whiteColor),
          title:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/logos/logo2.png', fit: BoxFit.contain, height: 50,)
            ],
          )
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height *.9,
        child: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Welcome to Mobile Eat! 🌟",
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(" Just a few details, and you're good to go!",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(ProjectColors.blackColorText)
                    ),),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Upload business registration document",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    getImage(ImageSource.gallery);
                  },
                  child: DottedBorder(
                    color: const Color(ProjectColors.textColorGreen),
                    strokeWidth: 1,
                    child: bizRegImage != null?ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(bizRegImage!.path),
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
                const SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Upload Health Certicate` document",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    getImage(ImageSource.gallery);
                  },
                  child: DottedBorder(
                    color: const Color(ProjectColors.textColorGreen),
                    strokeWidth: 1,
                    child: healthImage != null? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(healthImage!.path),
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
                const SizedBox(height: 20,),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const NavbarVendor()));
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: const Color(ProjectColors.whiteColor), shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                        backgroundColor: const Color(ProjectColors.background),
                        minimumSize: const Size.fromHeight(50.0)
                    ),
                    child:  const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go to Dashboard",
                            style: TextStyle(
                                fontSize: 16
                            ),),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_right_alt, size: 16, color: Color(ProjectColors.whiteColor),)
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
