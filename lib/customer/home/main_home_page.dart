import 'package:carousel_slider/carousel_slider.dart';
import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/custom_widgets/cards/dish_card.dart';
import 'package:desktop/custom_widgets/textfield_widget.dart';
import 'package:desktop/customer/home/vendor_page.dart';
import 'package:desktop/util/data.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/cards/vendor_card.dart';
import '../../util/colors.dart';
import '../../util/menu.dart';
import '../../util/menu_item.dart';
import 'categories_page.dart';



class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool menuOpen = false;
  TextEditingController searchController = TextEditingController();
  final controllerCarousel = CarouselController();
  int currentIndex = 0;
  FilterItems? selectedItem;
  List<String> carouselImages = [
    "assets/boarding/onboarding1.png",
    "assets/boarding/onboarding2.png",
    "assets/boarding/onboarding3.png"
  ];

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
      body: SingleChildScrollView(
        child : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column (
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
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
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                carouselController: controllerCarousel,
                options: CarouselOptions(
                    height: 210.0,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
                items: carouselImages.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 300,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.asset(
                                fit: BoxFit.cover,
                                image,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      carouselImages.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () => controllerCarousel
                                          .animateToPage(entry.key),
                                      child: Container(
                                        width: 12.0,
                                        height: 12.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: const Color(
                                                    ProjectColors.brown)),
                                            color: (Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.transparent
                                                    : const Color(
                                                        ProjectColors.brown))
                                                .withOpacity(
                                                    currentIndex == entry.key
                                                        ? 0.9
                                                        : 0.4)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Featured Vendors",
                style: TextStyle(
                    color: Color(ProjectColors.textColorGreen),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: Data.featuredVendors.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: VendorCard(image: Data.featuredVendors[index].image, vendorName: Data.featuredVendors[index].vendorName, cuisine: Data.featuredVendors[index].cuisine, rating: Data.featuredVendors[index].rating, location: Data.featuredVendors[index].location),
                        );
                      }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Button(
                  text: "View All",
                  hasIcon: false,
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Popular Dishes",
                style: TextStyle(
                    color: Color(ProjectColors.textColorGreen),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                fit: FlexFit.loose,
                 child: DynamicHeightGridView(
                    crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
                    shrinkWrap: true,
                    itemCount: Data.popularDishes.length,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    physics: const NeverScrollableScrollPhysics(),
                    builder: (ctx,index) {
                      return DishCard(
                          image: Data.popularDishes[index].image,
                          dishName: Data.popularDishes[index].dishName,
                          description: Data.popularDishes[index].desc,
                          vendorName: Data.popularDishes[index].vendorName,
                          price: Data.popularDishes[index].price);
                    })),

            ]
          ),
        ),
      ),
    );
  }
}


