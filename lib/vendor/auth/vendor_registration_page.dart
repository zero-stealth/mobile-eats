import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import '../../util/colors.dart';
import '../../util/data.dart';
import 'vendor_document_upload_page.dart';
import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/custom_widgets/textfield_widget.dart';

class VendorRegistration extends StatefulWidget {
  const VendorRegistration({Key? key}) : super(key: key);

  @override
  State<VendorRegistration> createState() => _VendorRegistrationState();
}

class _VendorRegistrationState extends State<VendorRegistration> {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController businessRegController = TextEditingController();
  TextEditingController healthCertController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  String serverMessage = '';
  bool submitted = false;
  String? location;
  String? city;

  Future<void> _determinePositionAndRegisterVendor({
    required String businessName,
    required String email,
    required String phone,
    required String businessRegNumber,
    required String healthCertNumber,
    required String location,
    required String city,
    required String address,
    required String postalCode,
  }) async {
    try {
      Position position = await _determinePosition();
      String baseUrl = dotenv.env['FLUTTER_SERVER_URL'] ?? '';

      final response = await http.post(
        Uri.parse('$baseUrl/vendor-auth/register'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'businessName': businessName,
          'email': email,
          'phoneNumber': phone,
          'businessRegNumber': businessRegNumber,
          'healthCertNumber': healthCertNumber,
          'locationName': location,
          'city': city,
          'address': address,
          'postalCode': postalCode,
          'latitude': position.latitude.toString(),
          'longitude': position.longitude.toString(),
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        String id = responseData['id'];
        String token = responseData['token'];

        await saveCredentials(id, token, email);
        serverMessage = "Registration successful!";
        submitted = true;
      } else {
        submitted = false;
        serverMessage = "Login failed. Please check your credentials.";
      }
    } catch (e) {
      submitted = false;
      serverMessage = "An error occurred. Please try again later.";
    }

    _showRegistrationMessage(submitted, serverMessage);
  }

  void _showRegistrationMessage(bool success, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> saveCredentials(String id, String token, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
    prefs.setString('token', token);
    prefs.setString('email', email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ProjectColors.whiteColor),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logos/logo2.png',
              fit: BoxFit.contain,
              height: 50,
            )
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: SingleChildScrollView(
          child: Padding(
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
                        color: Color(ProjectColors.textColorGreen)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    " Get ready to delight customers with your delicious dishes. Set up your business quickly! Just a few details, and you're good to go!",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(ProjectColors.blackColorText)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Basic Information",
                  style: TextStyle(
                      fontSize: 24, color: Color(ProjectColors.textColorGreen)),
                ),
                TextFieldWidget(
                    controller: businessNameController,
                    obscureText: false,
                    labelText: "Enter Your business name",
                    submitted: submitted,
                    hintText: "Business name",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 7,
                ),
                TextFieldWidget(
                    controller: emailController,
                    obscureText: false,
                    labelText: "Enter Your email address",
                    submitted: submitted,
                    hintText: "Email Address",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 7,
                ),
                TextFieldWidget(
                    controller: phoneController,
                    obscureText: false,
                    hintText: "Phone number",
                    labelText: "Enter Your Phone number",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.phone),
                const SizedBox(
                  height: 7,
                ),
                TextFieldWidget(
                    controller: businessRegController,
                    obscureText: false,
                    labelText: "Enter your business registration number",
                    submitted: submitted,
                    hintText: "Business registration number",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number),
                const SizedBox(
                  height: 7,
                ),
                TextFieldWidget(
                    controller: healthCertController,
                    obscureText: false,
                    labelText: "Enter your health certificate number",
                    submitted: submitted,
                    hintText: "Health certificate number",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number),
                const SizedBox(
                  height: 7,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Business Location",
                  style: TextStyle(
                      fontSize: 24, color: Color(ProjectColors.textColorGreen)),
                ),
                const Text(
                  "Business Location",
                  style: TextStyle(
                      fontSize: 18, color: Color(ProjectColors.blackColorText)),
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
                    buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color(ProjectColors.blackColorText)),
                            borderRadius: BorderRadius.circular(7))),
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
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "City",
                  style: TextStyle(
                      fontSize: 18, color: Color(ProjectColors.blackColorText)),
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
                    buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color(ProjectColors.blackColorText)),
                            borderRadius: BorderRadius.circular(7))),
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
                const SizedBox(
                  height: 7,
                ),
                TextFieldWidget(
                    controller: addressController,
                    obscureText: false,
                    labelText: "Enter your address",
                    submitted: submitted,
                    hintText: "Address",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 7,
                ),
                TextFieldWidget(
                    controller: postalCodeController,
                    obscureText: false,
                    labelText: "Enter postal code",
                    submitted: submitted,
                    hintText: "Postal Code",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number),
                const SizedBox(
                  height: 12,
                ),
                TextButton(
                  onPressed: () async {
                    BuildContext currentContext = context;
                    await _determinePositionAndRegisterVendor(
                      businessName: businessNameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      businessRegNumber: businessRegController.text,
                      healthCertNumber: healthCertController.text,
                      location: location ?? '',
                      city: city ?? '',
                      address: addressController.text,
                      postalCode: postalCodeController.text,
                    );

                    Navigator.pushReplacement(
                      currentContext,
                      MaterialPageRoute(
                        builder: (context) => const VendorDocumentUpload(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(ProjectColors.whiteColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: const Color(ProjectColors.background),
                    minimumSize: const Size.fromHeight(50.0),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          size: 16,
                          color: Color(ProjectColors.whiteColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
