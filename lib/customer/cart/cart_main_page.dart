import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/custom_widgets/cards/cart_item_card.dart';
import 'package:desktop/customer/cart/checkout_delivery.dart';
import 'package:desktop/util/colors.dart';
import 'package:desktop/util/data.dart';
import 'package:flutter/material.dart';
class CartMainPage extends StatefulWidget {
  const CartMainPage({super.key});

  @override
  State<CartMainPage> createState() => _CartMainPageState();
}

class _CartMainPageState extends State<CartMainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .6,
                    width:MediaQuery.of(context).size.width ,
                    child: ListView.builder(
                        itemCount: Data.cartItems.length,
                        itemBuilder: (ctx, index){
                            return CartItemCard(image: Data.cartItems[index].image, dishName: Data.cartItems[index].dishName, description: Data.cartItems[index].desc, quantity: Data.cartItems[index].quantity, addons: Data.cartItems[index].addons);
                        }
                    ),
                  ),
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
                   const SizedBox(height: 20,),
                  Button(text: "Proceed to checkout", hasIcon: true, iconData: Icons.shopping_cart_outlined, onTap: (){
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context)=>const CheckoutDelivery()));
                  },),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(ProjectColors.textColorGreen),
                          width: 1.5
                        ),
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, color: Color(ProjectColors.textColorGreen), size: 18,),
                            Text("Contact Mama's Kitchen",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(ProjectColors.textColorGreen)
                              ),)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
