import 'dish_addon_model.dart';

class CartItem{
  String dishName;
  String image;
  String desc;
  int quantity;
  List<DishAddon> addons;
  CartItem({
    required this.dishName,
    required this.image,
    required this.desc,
    required this.quantity,
    required this.addons,
  });

}