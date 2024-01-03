import 'dart:async';
import 'dart:io';

import 'package:desktop/custom_widgets/textfield_widget.dart';
import 'package:desktop/custom_widgets/vendor_drawer.dart';
import 'package:desktop/models/vendors_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../util/colors.dart';
import '../../util/data.dart';

class VendorSettings extends StatefulWidget {
  const VendorSettings({super.key, required this.vendors});

  final Vendors vendors;

  @override
  State<VendorSettings> createState() => _VendorSettingsState();
}

class _VendorSettingsState extends State<VendorSettings> {
  XFile? kitchenImage;

  String? location;
  String? city;
  String selectedType = "Available";
  TextEditingController bizNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bizRegController = TextEditingController();
  TextEditingController healthCertController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String? mobilePaymentMethod;
  bool submitted = false;

  final ImagePicker pickerKitchenImage = ImagePicker();

  Future getImage(ImageSource media) async {
    var imageBizReg = await pickerKitchenImage.pickImage(source: media);
    setState(() {
      kitchenImage = imageBizReg;
    });
  }

  @override
  void initState() {
    setState(() {
      location = "Kenya";
      city = "Nairobi";
    });
    super.initState();
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Account Settings",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen), fontSize: 20),
                ),
                const Text(
                  "Logo",
                  style: TextStyle(
                      color: Color(ProjectColors.blackColorText), fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    getImage(ImageSource.gallery);
                  },
                  child: kitchenImage != null
                        ? ClipRRect(
                            child: Image.file(
                              //to show image, you type like this.
                              File(kitchenImage!.path),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 170,
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 170,
                            child: Center(
                                child: Image.asset(
                                  widget.vendors.image,
                                  fit: BoxFit.cover,
                                ),),
                          ),
                  ),

                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    controller: bizNameController..text = widget.vendors.vendorName,
                    obscureText: false,
                    labelText: "Enter business name",
                    hintText: "Business name",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: emailController..text = widget.vendors.email,
                    obscureText: false,
                    labelText: "Enter your email",
                    hintText: "Email address",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: phoneController..text = widget.vendors.phoneNumber,
                    obscureText: false,
                    labelText: "Enter phone number",
                    hintText: "Phone number",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: bizRegController..text = widget.vendors.bizRegNo,
                    obscureText: false,
                    labelText: "Enter business registration number",
                    hintText: "Business registration number",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: healthCertController..text = widget.vendors.healthCertNo,
                    obscureText: false,
                    labelText: "Enter health certificate number",
                    hintText: "Health certificate number",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(height: 5,),
                const Text(
                  "Business Location",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(ProjectColors.blackColorText)
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Country',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: Data.countries
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
                    value: location,
                    onChanged: (value) {
                      setState(() {
                        location = value;
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
                    dropdownSearchData: DropdownSearchData(
                      searchController: locationController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: locationController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        locationController.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 7,),
                const Text(
                  "City",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(ProjectColors.blackColorText)
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select City',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: Data.cities
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
                    value: city,
                    onChanged: (value) {
                      setState(() {
                        city = value;
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
                    dropdownSearchData: DropdownSearchData(
                      searchController: cityController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: cityController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        cityController.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 7,),
                TextFieldWidget(
                    controller: addressController..text = widget.vendors.address,
                    obscureText: false,
                    labelText: "Enter business address",
                    hintText: "Address",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(height: 5,),
                TextFieldWidget(
                    controller: codeController..text = widget.vendors.postalCode,
                    obscureText: false,
                    labelText: "Enter postal code",
                    hintText: "Postal Code",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(height: 7,),
                const Text(
                  "Availability Status",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(ProjectColors.textColorGreen),
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          checkColor: const Color(ProjectColors.textColorGreen),
                          onChanged: (bool? selected) {

                            setState(() {
                              selectedType = "Available";
                            });
                          }, value: selectedType == "Available"? true:false,),
                        const SizedBox(width: 1,),
                        const Text("Available",
                          style: TextStyle(
                              fontSize: 13
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          checkColor: const Color(ProjectColors.textColorGreen),
                          onChanged: (bool? selected) {

                            setState(() {
                              selectedType = "Unavailable";
                            });
                          }, value: selectedType == "Unavailable"? true:false,),
                        const SizedBox(width: 1,),
                        const Text("Unavailable",
                          style: TextStyle(
                              fontSize: 13
                          ),
                        )
                      ],
                    )
                  ],
                ),
                selectedType=="Unavailable"? Column(
                  children: [
                    const Text(
                      "Reason (Optional)",
                      style: TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontSize: 16
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(ProjectColors.blackColorText)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(ProjectColors.textColorGreen)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.all(5),
                        labelText: "Reason",


                        alignLabelWithHint: false,
                        hintStyle: TextStyle(color: Colors.grey[500],


                        ),

                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    )
                  ],
                ):const SizedBox(height: 5,),
                const SizedBox(height: 5,),
                TextButton(
                  onPressed: () {
                    //logic
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color(ProjectColors.textColorGreen),

                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: const Center(child: Text('Update', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                  ),
                ),
              ],

            ),
          ),
        ),
      ),
      endDrawer: const VendorDrawer(),
    );
  }
}
