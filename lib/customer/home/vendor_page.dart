import 'package:desktop/custom_widgets/cards/vendor_details_card.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/textfield_widget.dart';
import '../../util/colors.dart';
import '../../util/data.dart';
import 'categories_page.dart';
import 'main_home_page.dart';
class VendorsPage extends StatefulWidget {
  const VendorsPage({super.key});

  @override
  State<VendorsPage> createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  TextEditingController searchController = TextEditingController();
  FilterItems? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Vendors",
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
                child: ListView.builder(
                  itemCount: Data.allVendors.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index){
                      return VendorDetailsCard(image: Data.allVendors[index].image, cuisine: Data.allVendors[index].cuisine, specialties: Data.allVendors[index].specialties, vendorName: Data.allVendors[index].vendorName, rating: Data.allVendors[index].rating, location: Data.allVendors[index].location);
                    }
                ))
          ],
        ),
      ),
    );
  }
}
