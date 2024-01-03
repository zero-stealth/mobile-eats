import 'package:desktop/custom_widgets/cards/vendor_dishes_manage_card.dart';
import 'package:desktop/custom_widgets/vendor_drawer.dart';
import 'package:desktop/util/data.dart';
import 'package:desktop/vendors/home/publish_dish.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';
import 'manage_riders.dart';
import 'notifications_page.dart';

class ManageDishes extends StatefulWidget {
  const ManageDishes({super.key});

  @override
  State<ManageDishes> createState() => _ManageDishesState();
}

class _ManageDishesState extends State<ManageDishes> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
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
      body: Padding(
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
                  onTap:(){Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const PublishDish()));} ,
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
            Row(
              children: [
                const Text(
                  "List of Dishes: ",
                  style: TextStyle(
                      fontSize: 18, color: Color(ProjectColors.blackColorText)),
                ),
                Text(
                  "50 Menus",
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(ProjectColors.blackColorText)
                          .withOpacity(.6)),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: Data.mamasKitchenDishes.length,
                    itemBuilder: (ctx, index) {
                      return VendorDishesManageCard(
                          id: Data.mamasKitchenDishes[index].id,
                          vendorName: Data.mamasKitchenDishes[index].vendorName,
                          image: Data.mamasKitchenDishes[index].image,
                          desc: Data.mamasKitchenDishes[index].desc,
                          dishName: Data.mamasKitchenDishes[index].dishName,
                          price: Data.mamasKitchenDishes[index].price);
                    }))
          ],
        ),
      ),
      endDrawer: const VendorDrawer(),
    );
  }
}
