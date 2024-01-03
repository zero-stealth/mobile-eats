import 'dart:io';

import 'package:desktop/custom_widgets/vendor_drawer.dart';
import 'package:desktop/vendors/home/edit_success_page.dart';
import 'package:desktop/vendors/home/publish_dish.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../custom_widgets/textfield_widget.dart';
import '../../models/dishes_model.dart';
import '../../util/colors.dart';
import '../../util/data.dart';
import 'manage_dishes.dart';
import 'manage_riders.dart';
import 'notifications_page.dart';
class EditDishPage extends StatefulWidget {
  const EditDishPage({super.key, required this.dish});
  final Dishes dish;
  @override
  State<EditDishPage> createState() => _EditDishPageState();
}

class _EditDishPageState extends State<EditDishPage> {
  TextEditingController searchController = TextEditingController();

  TextEditingController dishNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool submitted =false;
  String? dishType ="Main Courses";
  XFile? dishImage;
  final ImagePicker pickerDishImage = ImagePicker();
  Future getImage(ImageSource media) async {
    var imageDish = await pickerDishImage.pickImage(source: media);

    setState(() {
      dishImage = imageDish;

    });
  }
  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ProjectColors.whiteColor),

        title: Image.asset(
          'assets/logos/logo2.png',
          fit: BoxFit.contain,
          height: 50,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height*.9,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(ProjectColors.lightPink)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(ProjectColors.textColorGreen)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: const Color(ProjectColors.whiteColor),
                              filled: true,
                              contentPadding: const EdgeInsets.all(5),
                              labelText: "Search",
                              labelStyle: TextStyle(
                                  color: const Color(ProjectColors.blackColorText)
                                      .withOpacity(.7)),
                              suffixIcon: const Icon(
                                Icons.search,
                                color: Color(ProjectColors.blackColorText),
                                size: 16,
                              )),
                        )),
                    const Icon(
                      Icons.notifications_none_rounded,
                      size: 20,
                      color: Color(ProjectColors.textColorGreen),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Manage Dishes",
                      style: TextStyle(
                          color: Color(ProjectColors.textColorGreen),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/vendors6.png",
                          width: 20,
                        ),
                        const Text(
                          "Mama's Kitchen",
                          style: TextStyle(
                            color: Color(ProjectColors.blackColorText),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Here you can add, edit, and delete your dishes to showcase your delicious offerings to customers.",
                  style: TextStyle(
                    color: Color(ProjectColors.blackColorText),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const PublishDish()));
                      },
                      child: Container(
                        height: 35,
                        width: 180,
                        decoration: BoxDecoration(
                          color: const Color(ProjectColors.textColorGreen),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Color(ProjectColors.whiteColor),
                                size: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Publish New Dish",
                                style: TextStyle(
                                    color: Color(ProjectColors.whiteColor),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color(ProjectColors.darkBrown),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.filter_list_rounded,
                              color: Color(ProjectColors.whiteColor),
                              size: 14,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Sort",
                              style: TextStyle(
                                  color: Color(ProjectColors.whiteColor),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                    const Text(
                      "Edit Dish",
                      style: TextStyle(
                          fontSize: 18, color: Color(ProjectColors.blackColorText)),
                    ),

                const SizedBox(
                  height: 15,
                ),
                TextFieldWidget(
                    controller: dishNameController..text =widget.dish.dishName,
                    obscureText: false,
                    hintText: "Dish name",
                    labelText: "Enter Dish Name",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 5,
                ),
                TextFieldWidget(
                    controller: descriptionController..text =widget.dish.desc,
                    obscureText: false,
                    hintText: "Description",
                    labelText: "Type Dish Description here",
                    submitted: submitted,
                    textInputAction: TextInputAction.newline,
                    textInputType: TextInputType.text),

                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Select Dish Type",
                  style: TextStyle(
                      color: Color(ProjectColors.blackColorText),
                      fontSize: 14
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Dish Type',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: Data.dishType
                        .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: dishType,
                    onChanged: (value) {
                      setState(() {
                        dishType = value;
                      });
                    },
                    buttonStyleData:  ButtonStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(ProjectColors.blackColorText)
                            ),
                            borderRadius: BorderRadius.circular(7)
                        )
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),



                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFieldWidget(
                    controller: priceController..text ="${widget.dish.price}",
                    obscureText: false,
                    hintText: "Price",
                    labelText: "Enter Price",
                    submitted: submitted,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Upload",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(ProjectColors.blackColorText)
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
                    child: dishImage != null?ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(dishImage!.path),
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
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const EditSuccessPage()));
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(ProjectColors.textColorGreen),

                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: const Center(child: Text('Publish', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const ManageDishes()));
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
                    child: const Center(child: Text('Cancel', style: TextStyle(fontSize: 16, color: Color(ProjectColors.textColorGreen)),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: const VendorDrawer()
    );
  }
}
