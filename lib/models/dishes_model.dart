class Dishes {
  int id;
  String dishName;
  int price;
  String desc;
  String image;
  String vendorName;

  Dishes({
    required this.id,
    required this.dishName,
    required this.price,
    required this.desc,
    required this.vendorName,
    required this.image,
  });

  // Generate Dishes list from JSON array
  static List<Dishes> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }

  // Create a Dishes instance from JSON
  static Dishes fromJson(Map<String, dynamic> json) {
    return Dishes(
      id: json['id'],
      dishName: json['dishName'],
      price: json['price'],
      desc: json['desc'],
      vendorName: json['vendorName'],
      image: json['image'],
    );
  }

  // Convert Dishes instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dishName': dishName,
      'price': price,
      'desc': desc,
      'vendorName': vendorName,
      'image': image,
    };
  }

  // Convert List of Dishes to JSON array
  static List<Map<String, dynamic>> toJsonList(List<Dishes> dishesList) {
    return dishesList.map((dish) => dish.toJson()).toList();
  }
}
