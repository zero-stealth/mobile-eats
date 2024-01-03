import 'package:desktop/custom_widgets/cards/vendor_dish_card.dart';
import 'package:desktop/custom_widgets/customers/empty_vendor_dish.dart';
import 'package:desktop/customer/home/main_home_page.dart';
import 'package:desktop/customer/home/vendor_page.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/textfield_widget.dart';
import '../../util/colors.dart';
import '../../util/data.dart';
import 'categories_page.dart';
class VendorDishesPage extends StatefulWidget {
  const VendorDishesPage({super.key});

  @override
  State<VendorDishesPage> createState() => _VendorDishesPageState();
}

class _VendorDishesPageState extends State<VendorDishesPage> {
  TextEditingController searchController = TextEditingController();
  FilterItems? selectedItem;
  int currentTab =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: TextFieldWidget(
                      controller: searchController,
                      obscureText: false,
                      labelText: "Search Restaurants, Dishes, or Cuisines",
                      submitted: false,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text),
                ),
                Center(
                  child: PopupMenuButton<FilterItems>(
                      color: const Color(ProjectColors.whiteColor),
                      offset: const Offset(-10, 60),
                      icon: const Center(
                          child: Icon(
                            Icons.filter_list,
                            size: 40,
                            color: Color(ProjectColors.blackColorText),
                          )),
                      initialValue: selectedItem,
                      onSelected: (FilterItems item) {
                        switch(item){
                          case FilterItems.categories:
                          //go to categories page
                            Navigator.of(context)
                                .push(
                                MaterialPageRoute(builder: (context)=>const CategoriesPage()));
                            break;
                          case FilterItems.vendors:
                          //go to vendors page
                            Navigator.of(context)
                                .push(
                                MaterialPageRoute(builder: (context)=>const VendorsPage()));
                            break;
                          case FilterItems.delicacy:
                          //go to categories page
                            break;
                        }
                        setState(() {
                          selectedItem = item;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<FilterItems>>[
                        const PopupMenuItem<FilterItems>(
                          value: FilterItems.vendors,
                          child: Text('Vendors'),
                        ),
                        const PopupMenuItem<FilterItems>(
                          value: FilterItems.categories,
                          child: Text('Categories'),
                        ),
                        const PopupMenuItem<FilterItems>(
                          value: FilterItems.delicacy,
                          child: Text('Delicacy'),
                        ),
                      ]),
                )
              ],
            ),
            const SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/vendors6.png", width: MediaQuery.of(context).size.width*0.1,),
                    const SizedBox(width: 5,),
                    const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Mama's Kitchen",
                        style: TextStyle(
                            color: Color(ProjectColors.textColorGreen),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.undo, color: Color(ProjectColors.blackColorText), size: 16,),
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => const HomePageScreen()));
                      },
                      child: const Flexible(
                        child: Text(
                          "Back to home",
                          style: TextStyle(
                            color: Color(ProjectColors.blackColorText),
                            fontSize: 14
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 7,),
            const Text(
              "A cozy restaurant serving homemade, comforting meals made with love.",
              style: TextStyle(
                fontSize: 16
              ),

            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: Data.dishType.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index){

                    return InkWell(
                      onTap: (){
                        setState(() {
                          currentTab = index;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration:currentTab== index? const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Color(ProjectColors.darkBrown)
                                    )
                                )
                            ): const BoxDecoration(),
                            child: Text(
                                Data.dishType[index],
                              style: TextStyle(
                                color: currentTab==index? const Color(ProjectColors.darkBrown): const Color(ProjectColors.brown)
                              )
                            ),
                          ),
                          const SizedBox(width: 15,)
                        ],
                      ),
                    );
                  }
              ),
            ),
            Data.mamasKitchenDesserts.isEmpty && currentTab ==2?
            const Expanded(child: EmptyVendorDish(dishType: "Dessert", vendorName: "Mama's Kitchen")):
            Data.mamasKithenAppetizers.isEmpty && currentTab ==1?
            const Expanded(child: EmptyVendorDish(dishType: "Appetizers", vendorName: "Mama's Kitchen")):
            Data.mamasKitchenMain.isEmpty && currentTab ==0?
            const Expanded(child: EmptyVendorDish(dishType: "Main Course", vendorName: "Mama's Kitchen")):
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: currentTab == 0? Data.mamasKitchenMain.length: currentTab ==1? Data.mamasKithenAppetizers.length:Data.mamasKitchenDesserts.length,
                    itemBuilder: (ctx, index){
                      return  VendorDishCard(
                          image: currentTab==0?Data.mamasKitchenMain[index].image: currentTab == 1? Data.mamasKithenAppetizers[index].image:Data.mamasKitchenDesserts[index].image,
                          dishName: currentTab==0?Data.mamasKitchenMain[index].dishName: currentTab == 1? Data.mamasKithenAppetizers[index].dishName:Data.mamasKitchenDesserts[index].dishName,
                          price: currentTab==0?Data.mamasKitchenMain[index].price: currentTab == 1? Data.mamasKithenAppetizers[index].price:Data.mamasKitchenDesserts[index].price,
                          desc: currentTab==0?Data.mamasKitchenMain[index].desc: currentTab == 1? Data.mamasKithenAppetizers[index].desc:Data.mamasKitchenDesserts[index].desc,);
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
