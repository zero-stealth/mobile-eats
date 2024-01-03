class Favourites {
  int id;
  String dishName;
  int price;
  String image;
  String vendorName;

  Favourites({
    required this.vendorName,
    required this.id,
    required this.dishName,
    required this.price,
    required this.image,
  });

  // Constructor to create an instance from a JSON map
  factory Favourites.fromJson(Map<String, dynamic> json) {
    return Favourites(
      vendorName: json['vendorName'],
      id: json['id'],
      dishName: json['dishName'],
      price: json['price'],
      image: json['image'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'vendorName': vendorName,
      'id': id,
      'dishName': dishName,
      'price': price,
      'image': image,
    };
  }

  // Method to generate a list of Favourites from a JSON array
  static List<Favourites> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Favourites.fromJson(json)).toList();
  }

  // Method to convert a list of Favourites to a JSON array
  static List<Map<String, dynamic>> toJsonList(List<Favourites> favouritesList) {
    return favouritesList.map((favourite) => favourite.toJson()).toList();
  }
}

