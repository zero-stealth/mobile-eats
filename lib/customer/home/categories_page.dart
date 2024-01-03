import 'package:desktop/custom_widgets/cards/categories_card.dart';
import 'package:desktop/customer/home/vendor_page.dart';
import 'package:desktop/util/data.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/textfield_widget.dart';
import '../../util/colors.dart';
import '../../util/menu.dart';
import '../../util/menu_item.dart';
import 'main_home_page.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool menuOpen = false;
  TextEditingController searchController = TextEditingController();
  FilterItems? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ProjectColors.whiteColor),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logos/logo2.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text("Menu"),
                onMenuStateChange: (state) {
                  setState(() {
                    menuOpen = state;
                  });
                },
                customButton: menuOpen
                    ? const Icon(
                  Icons.close,
                  size: 30,
                  color: Color(ProjectColors.blackColorText),
                )
                    : const Icon(
                  Icons.list,
                  size: 30,
                  color: Color(ProjectColors.blackColorText),
                ),
                items: [
                  ...MenuItems.firstItems.map((item) =>
                      DropdownMenuItem<MenuItem>(
                          value: item, child: MenuItems.buildItem(item))),
                  const DropdownMenuItem<Divider>(
                      enabled: false, child: Divider()),
                  ...MenuItems.secondItems.map((item) =>
                      DropdownMenuItem<MenuItem>(
                          value: item, child: MenuItems.buildItem(item)))
                ],
                onChanged: (value) {
                  MenuItems.onChanged(context, value! as MenuItem);
                },
                dropdownStyleData: DropdownStyleData(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: const Color(ProjectColors.whiteColor)),
                    offset: const Offset(0, -20)),
                menuItemStyleData: MenuItemStyleData(
                  customHeights: [
                    ...List<double>.filled(MenuItems.firstItems.length, 48),
                    8,
                    ...List<double>.filled(MenuItems.secondItems.length, 48),
                  ],
                  padding: const EdgeInsets.only(left: 16, right: 16),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(ProjectColors.whiteColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
           const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.undo, color: Color(ProjectColors.blackColorText), size: 16,),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => const HomePageScreen()));
                      },
                      child: const Text(
                        "Back to home",
                        style: TextStyle(
                            color: Color(ProjectColors.blackColorText),
                            fontSize: 14
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 7,),
            Flexible(
              child: ListView.separated(
                  shrinkWrap: true,
                itemCount: Data.categories.length,
                  itemBuilder: (ctx, index){
                    return CategoriesCard(image: Data.categories[index].image, category: Data.categories[index].category, descCategory: Data.categories[index].desc, vendors: Data.categories[index].vendors);
                  }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },
              ),
            ),
          ],
        ),
      )
    );
  }
}
