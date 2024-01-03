class Vendors {
  int id;
  String cuisine;
  double rating;
  String location;
  List<String> specialties;
  String image;
  String email;
  String phoneNumber;
  String bizRegNo;
  String healthCertNo;
  String address;
  String postalCode;
  String vendorName;

  Vendors({
    required this.id,
    required this.cuisine,
    required this.rating,
    required this.specialties,
    required this.location,
    required this.vendorName,
    required this.image,
    required this.postalCode,
    required this.address,
    required this.healthCertNo,
    required this.bizRegNo,
    required this.phoneNumber,
    required this.email,
  });

  // Generate Vendors list from JSON array
  static List<Vendors> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }

  // Create a Vendors instance from JSON
  static Vendors fromJson(Map<String, dynamic> json) {
    return Vendors(
      id: json['id'],
      cuisine: json['cuisine'],
      rating: json['rating'],
      specialties: List<String>.from(json['specialties']),
      location: json['location'],
      vendorName: json['vendorName'],
      image: json['image'],
      postalCode: json['postalCode'],
      address: json['address'],
      healthCertNo: json['healthCertNo'],
      bizRegNo: json['bizRegNo'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  // Convert Vendors instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cuisine': cuisine,
      'rating': rating,
      'specialties': specialties,
      'location': location,
      'vendorName': vendorName,
      'image': image,
      'postalCode': postalCode,
      'address': address,
      'healthCertNo': healthCertNo,
      'bizRegNo': bizRegNo,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  // Convert List of Vendors to JSON array
  static List<Map<String, dynamic>> toJsonList(List<Vendors> vendorsList) {
    return vendorsList.map((vendors) => vendors.toJson()).toList();
  }
}
