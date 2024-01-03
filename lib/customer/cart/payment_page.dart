import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/custom_widgets/textfield_widget.dart';
import 'package:desktop/util/data.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_stepper.dart';
import '../../util/colors.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedType = "Mobile";
  TextEditingController phoneController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController holderNameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  String? mobilePaymentMethod;
  final TextEditingController textEditingController = TextEditingController();
  bool submitted =  false;
  bool submittedCard = false;
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Checkout",
            style: TextStyle(
                color:  Color(ProjectColors.textColorGreen),
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child:  const Row(
                  children: [
                    CustomStepper(filled: true,),
                    CustomStepper(filled: true,),
                    CustomStepper(filled: false,),
                  ],
                ),
              ),
              const SizedBox(height: 7,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10,),
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
                              selectedType = "Mobile";
                            });
                          }, value: selectedType == "Mobile"? true:false,),
                        const SizedBox(width: 1,),
                        const Text("Mobile Money",
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
                            selectedType = "Card";
                          });
                        }, value: selectedType == "Card"? true:false,),
                      const SizedBox(width: 1,),
                      const Text("Credit/Debit Card",
                        style: TextStyle(
                            fontSize: 13
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 14,),
              selectedType == "Mobile"?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mobile Money Provider",
                        style: TextStyle(
                          color: Color(ProjectColors.textColorGreen),
                          fontSize: 18,

                        ),
                      ),
                      const SizedBox(height: 5,),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Select Provider',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: Data.paymentMethods
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
                          value: mobilePaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              mobilePaymentMethod = value;
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
                            searchController: textEditingController,
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
                                controller: textEditingController,
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
                              textEditingController.clear();
                            }
                          },
                        ),
                      ),
                      TextFieldWidget(
                          controller: phoneController,
                          obscureText: false,
                          labelText: "Phone Number",
                          submitted: submitted,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.phone),
                      const SizedBox(height: 15,),
                      Divider(color: const Color(ProjectColors.blackColorText).withOpacity(.6),),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                              fontSize: 18,

                            ),
                          ),
                          Text(
                            "Ksh. 1670",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(ProjectColors.textColorGreen)
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Button(text: "Pay Now", hasIcon: false, onTap: (){},)
                    ],
                  ):
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const Text(
                          "Card Type",
                          style:TextStyle(
                            color: Color(ProjectColors.textColorGreen),
                            fontSize: 18,

                          ),
                        ),
                      Row(
                        children: [
                          Image.asset("assets/images/card1.png", width: 60,),
                          const SizedBox(width: 2,),
                          Image.asset("assets/images/card2.png", width: 60,),
                        ],
                      ),
                      TextFieldWidget(
                          controller: cardNumberController,
                          obscureText: false,
                          labelText: "Card Number",
                          submitted: submittedCard,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number
                      ),
                      TextFieldWidget(
                          controller: holderNameController,
                          obscureText: false,
                          labelText: "Card holder name",
                          submitted: submittedCard,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextFieldWidget(
                                  controller: cvvController,
                                  obscureText: false,
                                  labelText: "CVV",
                                  submitted: submittedCard,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.number
                              ),
                          ),
                          const SizedBox(height: 5,),
                          Expanded(
                            child: TextFieldWidget(
                                controller: cvvController,
                                obscureText: false,
                                labelText: "Expiration Date",
                                submitted: submittedCard,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Divider(color: const Color(ProjectColors.blackColorText).withOpacity(.6),),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                              fontSize: 18,

                            ),
                          ),
                          Text(
                            "Ksh. 1670",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(ProjectColors.textColorGreen)
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Button(text: "Pay Now", hasIcon: false, onTap: (){},)
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
