import 'dart:convert';
import '../models/dish_orders.dart';
import '../models/riders_model.dart';
import '../models/dishes_model.dart';
import '../models/vendors_model.dart';
import 'package:http/http.dart' as http;
import '../models/cart_item_model.dart';
import '../models/categories_model.dart';
import '../models/favourites_model.dart';
import '../models/order_item_model.dart';
import '../models/dish_addon_model.dart';
import '../models/notification_model.dart';
import '../models/transactions_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum FilterItems { vendors, categories, delicacy }

class Data {
  static String baseUrl = dotenv.env['FLUTTER_SERVER_URL'] ?? '';
  static String token = dotenv.env['FLUTTER_SERVER_VENDOR_TOKEN'] ?? '';
  late String? id;

  Data() {
    _initializeId();
  }

  Future<void> _initializeId() async {
    id = await getIdFromSharedPreferences();
  }

  static Future<String?> getIdFromSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('id');
    } catch (e) {
      throw Exception('Error getting ID from SharedPreferences: $e');
    }
  }

   Future<List<Vendors>> fetchFeaturedVendors() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/vendor-auth$id'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => Vendors.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load featured vendors. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching featured vendors: $e');
      throw Exception('Failed to load featured vendors');
    }
  }

Future<List<Vendors>> fetchAllVendors() async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/vendor-auth$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Vendors.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load all vendors. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load all vendors');
  }
}

Future<List<Vendors>> fetchAllDishes() async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/vendor-auth$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Vendors.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load all vendors. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load all vendors');
  }
}


  Future<List<Dishes>> fetchAllDishes() async {
    final response = await http.get(Uri.parse('$baseUrl/allVendors'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Dishes.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load all vendors');
    }
  }


  static List<Favourites> favourites = [
    Favourites(
        id: 1,
        vendorName: "Choma Paradise",
        dishName: "Nyama Choma Platter",
        price: 450,
        image: "assets/images/fav1.png"),
    Favourites(
        id: 2,
        vendorName: "Mama's Kitchen",
        dishName: "Jollof Rice",
        price: 850,
        image: "assets/images/fav2.png"),
    Favourites(
        id: 3,
        vendorName: "Mama's Kitchen",
        dishName: "Uji Porridge",
        price: 450,
        image: "assets/images/fav3.png"),
    Favourites(
        id: 4,
        vendorName: "Coastal Bites",
        dishName: "Mandazi Medly",
        price: 150,
        image: "assets/images/fav4.png"),
  ];
  static List<Categories> categories = [
    Categories(
        id: 1,
        vendors: ["Mama's Kitchen", "Nyama Choma Express", "Taste Of Kenya"],
        category: "Kenyan Delights",
        desc:
            "Experience the authentic flavors of Kenya with a variety of local dishes.",
        image: "assets/images/cat1.png"),
    Categories(
        id: 2,
        vendors: ["Pizza Pizzaz", "Sushi Samba", "Tandoori"],
        category: "International Cuisine",
        desc:
            "Explore a world of flavors with a diverse selection of global cuisines.",
        image: "assets/images/cat2.png"),
    Categories(
        id: 2,
        vendors: ["Green Leaf Salad Bar", "Fresh Smoothies Spot", "Vegan vibe"],
        category: "Healthy Eats",
        desc: "Nourish your body with nutritious and delicious options.",
        image: "assets/images/cat3.png"),
    Categories(
        id: 2,
        vendors: ["Chapati Junction", "Tacos on wheels", "Falafel Flesta"],
        category: "Street food",
        desc:
            "Indulge in mouthwatering street food classics from around the world.",
        image: "assets/images/cat4.png"),
  ];

  static List<Dishes> popularDishes = [
    Dishes(
        id: 1,
        dishName: "Nyama Choma",
        vendorName: "Mama's Kitchen",
        price: 500,
        desc: "Grilled Meat",
        image: "assets/images/pop1.png"),
    Dishes(
        id: 2,
        dishName: "Chicken Biryani",
        vendorName: "Spicy Delights",
        price: 400,
        desc: "Spicy",
        image: "assets/images/pop2.png"),
    Dishes(
        id: 3,
        dishName: "Nyama Choma",
        vendorName: "Mama's Kitchen",
        price: 500,
        desc: "Grilled Meat",
        image: "assets/images/pop1.png"),
    Dishes(
        id: 4,
        dishName: "Nyama Choma",
        vendorName: "Mama's Kitchen",
        price: 500,
        desc: "Grilled Meat",
        image: "assets/images/pop1.png"),
    Dishes(
        id: 5,
        dishName: "Nyama Choma",
        vendorName: "Mama's Kitchen",
        price: 500,
        desc: "Grilled Meat",
        image: "assets/images/pop1.png"),
    Dishes(
        id: 6,
        dishName: "Nyama Choma",
        vendorName: "Mama's Kitchen",
        price: 500,
        desc: "Grilled Meat",
        image: "assets/images/pop1.png"),
    Dishes(
        id: 7,
        dishName: "Nyama Choma",
        vendorName: "Mama's Kitchen",
        price: 500,
        desc: "Grilled Meat",
        image: "assets/images/pop1.png"),
    Dishes(
        id: 8,
        dishName: "Nyama Choma",
        vendorName: "Mama's Kitchen",
        price: 500,
        desc: "Grilled Meat",
        image: "assets/images/pop1.png"),
  ];
  static List<String> dishType = ["Main Courses", "Appetizers", "Desserts"];

  static List<CartItem> cartItems = [
    CartItem(
        image: "assets/images/cart1.png",
        dishName: "Pilau Rice with Kachumbari",
        desc:
            "Fragrant spiced rice cooked with meat and served with a side of kachumbari.",
        quantity: 2,
        addons: [
          DishAddon(item: "chicken", price: 400, quantity: 2, isActive: true),
          DishAddon(item: "Beef", price: 100, quantity: 1, isActive: false),
          DishAddon(
              item: "Table Water", price: 20, quantity: 2, isActive: true),
          DishAddon(item: "Coke", price: 50, quantity: 1, isActive: true),
          DishAddon(item: "Plantain", price: 25, quantity: 1, isActive: false),
        ]),
    CartItem(
        image: "assets/images/cart1.png",
        dishName: "Pilau Rice with Kachumbari",
        desc:
            "Fragrant spiced rice cooked with meat and served with a side of kachumbari.",
        quantity: 2,
        addons: [
          DishAddon(item: "chicken", price: 400, quantity: 2, isActive: true),
          DishAddon(item: "Beef", price: 100, quantity: 1, isActive: false),
          DishAddon(
              item: "Table Water", price: 20, quantity: 2, isActive: true),
          DishAddon(item: "Coke", price: 50, quantity: 1, isActive: true),
          DishAddon(item: "Plantain", price: 25, quantity: 1, isActive: false),
        ])
  ];
  static List<String> paymentMethods = [
    "M-pesa (Safaricom)",
    "Airtel Money",
    "T-Kash (Telkom)",
    "Equitel Money (Equity Bank)",
    "Co-op Kwa Jirani (Co-operative Bank)",
    "PesaLink (Standard Chartered Bank)",
    "EazzyPay (Family Bank)",
    "PesaLink (KCB Bank)",
    "MobiKash"
  ];
  static List<OrderItem> orders = [
    OrderItem(
        orderId: "#12345",
        date: "2023-05-15",
        orderStatus: "Pending",
        customer: "John Doe",
        time: "9:20 am",
        vendorName: "Mama's Kitchen",
        totalAmount: 850,
        itemsOrdered: ["Sparghetti Bolognese", "Garlic Bread", "Ingoho"],
        address: "123 Main St, City, Country",
        rider: "Bessie Cooper",
        image: "assets/images/order1.png"),
    OrderItem(
        orderId: "#23456",
        date: "2023-05-14",
        time: "12:30 pm",
        orderStatus: "Confirmed",
        customer: "Jane Smith",
        vendorName: "Yummy Bite",
        totalAmount: 420,
        itemsOrdered: [
          "Margherita Pizza",
          "Caesar Salad",
        ],
        address: "123 Main St, City, Country",
        rider: "Bessie Cooper",
        image: "assets/images/order1.png"),
    OrderItem(
        orderId: "#34567",
        date: "2023-05-10",
        time: "11:00 am",
        orderStatus: "Incomplete",
        vendorName: "Mama's Kitchen",
        totalAmount: 720,
        customer: "Susan Lee",
        itemsOrdered: ["Chocolate Cake", "Milkshake"],
        address: "123 Main St, City, Country",
        rider: "Bessie Cooper",
        image: "assets/images/order1.png"),
    OrderItem(
        orderId: "#34567",
        date: "2023-05-10",
        time: "7:03 am",
        orderStatus: "Delivered",
        vendorName: "Mama's Kitchen",
        totalAmount: 720,
        customer: "Michael",
        itemsOrdered: ["Chocolate Cake", "Milkshake"],
        address: "123 Main St, City, Country",
        rider: "Bessie Cooper",
        image: "assets/images/order1.png"),
    OrderItem(
        orderId: "#34567",
        date: "2023-05-10",
        time: "08:46 pm",
        orderStatus: "Failed",
        vendorName: "Mama's Kitchen",
        totalAmount: 720,
        customer: "Sherif Ibrahim",
        itemsOrdered: ["Chocolate Cake", "Milkshake"],
        address: "123 Main St, City, Country",
        rider: "Bessie Cooper",
        image: "assets/images/order1.png")
  ];
  static List<String> countries = ["Kenya", "Uganda", "Tanzania"];
  static List<String> cities = [
    "Nairobi",
    "Mombasa",
    "Kisumu",
    "Kampala",
    "Arusha",
    "Dodoma"
  ];

  static List<String> analyticsPeriod = ["monthly", "annually", "weekly"];

  static List<DishOrders> popularDishSales = [
    DishOrders(
        dishName: "Pilau Rice",
        totalOrders: 45,
        rating: 4.5,
        image: "assets/images/popd1.png"),
    DishOrders(
        dishName: "Grilled Chicken",
        totalOrders: 60,
        rating: 4.0,
        image: "assets/images/popd2.png"),
    DishOrders(
        dishName: "Beef Stew",
        totalOrders: 35,
        rating: 4.5,
        image: "assets/images/popd3.png"),
    DishOrders(
        dishName: "Sukuma Wiki na Ugali",
        totalOrders: 45,
        rating: 4.5,
        image: "assets/images/popd4.png"),
  ];
  static List<Riders> availableRiders = [
    Riders(
        riderName: "Flyod Miles",
        phoneNumber: "+254 987 654 321",
        email: "flo.miles@example.gmail.com",
        image: "assets/images/rider2.png",
        address: "2464 Royal Ln",
        availability: "Available"),
    Riders(
        riderName: "Robert Fox",
        phoneNumber: "+254 123 987 222",
        email: "robertfox@example.gmail.com",
        image: "assets/images/rider3.png",
        address: "2464 Royal Ln",
        availability: "Available"),
    Riders(
        riderName: "Guy Hawkins",
        phoneNumber: "+254 213 907 123",
        email: "ghawkins@example.gmail.com",
        image: "assets/images/rider4.png",
        address: "2464 Royal Ln",
        availability: "Available"),
  ];

  static List<Riders> allRiders = [
    Riders(
        riderName: "Bessie Cooper",
        phoneNumber: "+254 123 456 789",
        email: "bescoop@example.gmail.com",
        image: "assets/images/rider1.png",
        address: "2464 Royal Ln",
        availability: "Unavailable"),
    Riders(
        riderName: "Flyod Miles",
        phoneNumber: "+254 987 654 321",
        email: "flo.miles@example.gmail.com",
        image: "assets/images/rider2.png",
        address: "2464 Royal Ln",
        availability: "Available"),
    Riders(
        riderName: "Robert Fox",
        phoneNumber: "+254 123 987 222",
        email: "robertfox@example.gmail.com",
        image: "assets/images/rider3.png",
        address: "2464 Royal Ln",
        availability: "Available"),
    Riders(
        riderName: "Jacob Jones ",
        phoneNumber: "+254 679 123 923",
        email: "jacob.jones@example.gmail.com",
        image: "assets/images/rider4.png",
        address: "2464 Royal Ln",
        availability: "Delivering"),
    Riders(
        riderName: "Marvin McKinney",
        phoneNumber: "+254 679 123 321",
        email: "Markinner@example.gmail.com",
        image: "assets/images/rider1.png",
        address: "2464 Royal Ln",
        availability: "Unavailable"),
    Riders(
        riderName: "Devon Lane",
        phoneNumber: "+254 789 123 456",
        email: "dlane@example.gmail.com",
        image: "assets/images/rider1.png",
        address: "2464 Royal Ln",
        availability: "Delivering"),
    Riders(
        riderName: "Ronald Richards",
        phoneNumber: "+254 213 907 123",
        email: "ghawkins@example.gmail.com",
        image: "assets/images/rider1.png",
        address: "2464 Royal Ln",
        availability: "Delivering"),
    Riders(
        riderName: "Guy Hawkins",
        phoneNumber: "+254 213 907 123",
        email: "ghawkins@example.gmail.com",
        image: "assets/images/rider1.png",
        address: "2464 Royal Ln",
        availability: "Available"),
  ];

  static List<Dishes> mamasKitchenDishes = [
    Dishes(
        id: 1,
        dishName: "Pilau Rice with Kachumbari",
        price: 600,
        desc:
            "Flavorful spiced rice served with a fresh tomato and onion salad.",
        vendorName: "Mama's Kitchen",
        image: "assets/images/vdish1.png"),
    Dishes(
        id: 2,
        dishName: "Chapati Wrap",
        price: 350,
        desc:
            "Soft and delicious chapati wrapped around a filling of your choice.",
        vendorName: "Mama's Kitchen",
        image: "assets/images/vdish2.png"),
    Dishes(
        id: 1,
        dishName: "Chicken Biriyani",
        price: 750,
        desc:
            "Fragrant rice cooked with succulent chicken and aromatic spices.",
        vendorName: "Mama's Kitchen",
        image: "assets/images/vdish3.png"),
    Dishes(
        id: 4,
        dishName: "Mandazi and Chai",
        price: 200,
        desc: "Traditional Kenyan snack of fried dough served with spiced tea.",
        vendorName: "Mama's Kitchen",
        image: "assets/images/vdish4.png"),
    Dishes(
        id: 5,
        dishName: "Vegetarian Delight",
        price: 400,
        desc: "Assorted seasonal vegetables cooked to perfection.",
        vendorName: "Mama's Kitchen",
        image: "assets/images/vdish5.png"),
    Dishes(
        id: 6,
        dishName: "Nyama Choma Platter",
        price: 600,
        desc:
            "Succulent grilled meat served with a side of tangy sauce and ugali.",
        vendorName: "Mama's Kitchen",
        image: "assets/images/vdish6.png"),
    Dishes(
        id: 7,
        dishName: "Fish Curry with Rice",
        price: 700,
        desc:
            "Tender fish cooked in a rich curry sauce, served with fluffy rice.",
        vendorName: "Mama's Kitchen",
        image: "assets/images/vdish7.png"),
  ];

  static List<NotificationModel> allNotifications = [
    NotificationModel(
      id: 1,
      title: "New order received",
      content:
          'You have received a new order from a customer. Check the order details and prepare the delicious dishes for delivery.',
      date: DateTime.parse('2023-11-20 20:18:04Z'),
      read: false,
    ),
    NotificationModel(
      id: 2,
      title: "Order Delivered",
      content:
          'Congratulations! The order has been successfully delivered to the customer. Keep up the good work!',
      date: DateTime.parse('2023-11-29 20:18:04Z'),
      read: false,
    ),
    NotificationModel(
      id: 3,
      title: "Customer Feedback",
      content:
          'A customer has left feedback for their recent order. Take a moment to read the feedback and respond if necessary.',
      date: DateTime.parse('2023-11-30 14:18:04Z'),
      read: false,
    ),
    NotificationModel(
      id: 4,
      title: "New order received",
      content:
          'You have received a new order from a customer. Check the order details and prepare the delicious dishes for delivery.',
      date: DateTime.parse('2023-11-20 20:18:04Z'),
      read: false,
    ),
  ];

  static List<Transactions> allTransactions = [
    Transactions(
        id: 1,
        transactionType: "Order Earning",
        transactionAvenue: "Order #12345",
        time: "09:30AM",
        date: "2023-09-15",
        amount: 850),
    Transactions(
        id: 2,
        transactionType: "Bank Transfer",
        transactionAvenue: "Order #12345",
        time: "09:30AM",
        date: "2023-09-15",
        amount: 850),
    Transactions(
        id: 3,
        transactionType: "Order Earning",
        transactionAvenue: "Order #12345",
        time: "09:30AM",
        date: "2023-09-15",
        amount: 850),
    Transactions(
        id: 4,
        transactionType: "Order Earning",
        transactionAvenue: "Order #12345",
        time: "09:30AM",
        date: "2023-09-15",
        amount: 850),
    Transactions(
        id: 5,
        transactionType: "Withdrawal Request",
        transactionAvenue: "M-pesa",
        time: "09:30AM",
        date: "2023-09-15",
        amount: 850),
  ];
}
