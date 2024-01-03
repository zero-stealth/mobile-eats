import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/custom_widgets/cards/cart_summary_card.dart';
import 'package:desktop/custom_widgets/custom_stepper.dart';
import 'package:desktop/custom_widgets/textfield_widget.dart';
import 'package:desktop/customer/cart/payment_page.dart';
import 'package:desktop/util/colors.dart';
import 'package:desktop/util/data.dart';
import 'package:flutter/material.dart';
class CheckoutDelivery extends StatefulWidget {
  const CheckoutDelivery({super.key});

  @override
  State<CheckoutDelivery> createState() => _CheckoutDeliveryState();
}

class _CheckoutDeliveryState extends State<CheckoutDelivery> {
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  bool submitted = false;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
            children: [

              const SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Row(
                  children: [
                    CustomStepper(filled: true,),
                    CustomStepper(filled: false,),
                    CustomStepper(filled: false,),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Summary",
                    style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Item: 1",
                    style: TextStyle(
                        color: Color(ProjectColors.blackColorText),
                        fontSize: 18
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height*.2,
                    maxHeight: MediaQuery.of(context).size.height * .3,
                    maxWidth: MediaQuery.of(context).size.width
                  ),
                child: ListView.builder(
                  itemCount: Data.cartItems.length,
                    itemBuilder: (ctx, index){
                      return CartSummaryCard(image: Data.cartItems[index].image, dishName: Data.cartItems[index].dishName, quantity: Data.cartItems[index].quantity, price: 100);
                    }
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *.5,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
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
                      Divider(color: const Color(ProjectColors.blackColorText).withOpacity(.6),),
                      const SizedBox(height: 10,),
                      const Text(
                        "Delivery Details",
                        style: TextStyle(
                            color: Color(ProjectColors.textColorGreen),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      TextFieldWidget(
                          controller: addressController,
                          obscureText: false,
                          labelText: "Delivery Address",
                          hintText: "123 Main Street, Nairobi",
                          submitted: submitted,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text),
                      TextFieldWidget(
                          controller: dateController,
                          obscureText: false,
                          labelText: "Delivery Date",
                          hintText: "July 15, 2023",
                          submitted: submitted,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.datetime),
                      TextFieldWidget(
                          controller: dateController,
                          obscureText: false,
                          labelText: "Delivery Time",
                          hintText: "12:30 PM",
                          submitted: submitted,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.datetime),
                      const SizedBox(height: 20,),
                      Button(text: "Continue", hasIcon: true, iconData: Icons.add_shopping_cart, onTap: (){
                        Navigator.of(context)
                            .push(
                            MaterialPageRoute(builder: (context)=>const PaymentPage()));
                      },)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}
