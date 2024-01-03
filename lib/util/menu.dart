import 'package:desktop/customer/home/categories_page.dart';
import 'package:desktop/customer/home/favourites_page.dart';

import 'colors.dart';
import 'menu_item.dart';
import 'package:flutter/material.dart';
abstract class MenuItems {
  static const List<MenuItem> firstItems = [catalogue, favourites, support];
  static const List<MenuItem> secondItems = [logout];

  static const catalogue = MenuItem(text: 'Catalogue');
  static const favourites = MenuItem(text: 'Favourites');
  static const support = MenuItem(text: 'Support');
  static const logout = MenuItem(text: 'Log Out');

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
                color: Color(ProjectColors.blackColorText), fontSize: 18),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.catalogue:
      //Do something
        Navigator.of(context)
            .push(
            MaterialPageRoute(builder: (context)=>const CategoriesPage()));
        break;
      case MenuItems.favourites:
        Navigator.of(context)
            .push(
            MaterialPageRoute(builder: (context)=>const FavouritesPage()));
        break;
      case MenuItems.support:
      //Do something
        break;
      case MenuItems.logout:
      //Do something
        break;
    }
  }
}
