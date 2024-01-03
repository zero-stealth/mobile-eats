import 'package:desktop/customer/cart/cart_main_page.dart';
import 'package:desktop/customer/history/history_main_page.dart';
import 'package:desktop/customer/home/main_home_page.dart';
import 'package:desktop/customer/navbar.dart';
import 'package:desktop/customer/settings/settings_main_page.dart';
import 'package:desktop/vendors/home/vendor_home_main.dart';
import 'package:desktop/vendors/order/vendor_orders.dart';
import 'package:desktop/vendors/wallet/transactions_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class CustomerRoutes{
  static List<GetPage>  routes =[
    GetPage(name:navbar , page: ()=> const Navbar()),
    GetPage(name:homepage , page: ()=> const HomePageScreen()),
    GetPage(name:cart , page: ()=> const CartMainPage()),
    GetPage(name:history , page: ()=> const HistoryMainPage()),
    GetPage(name:settings , page: ()=> const SettingsMainPage()),
    GetPage(name:vendorHome , page: ()=> const VendorHomeMain()),
    GetPage(name:vendorOrders , page: ()=> const VendorOrders()),
    GetPage(name:vendorWallet , page: ()=> const TransactionsPage()),
  ];

  static getNavbar() => navbar;
  static getHomePage() => homepage;
  static getCart() => cart;
  static getHistory() => history;
  static getSettings() => settings;
  static getVendorHome() => vendorHome;
  static getVendorOrders() => vendorOrders;
  static getVendorWaller() => vendorWallet;

  static String navbar = '/';
  static String homepage = '/home';
  static String cart = '/cart';
  static String history = '/history';
  static String settings = '/settings';
  static String vendorHome = '/vendorHome';
  static String vendorOrders = '/vendorOrders';
  static String vendorWallet = '/vendorWallet';
}