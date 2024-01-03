class OrderItem{
  String date;
  String time;
  String orderId;
  String orderStatus;
  String vendorName;
  int totalAmount;
  List<String> itemsOrdered;
  String address;
  String rider;
  String customer;
  String image;

  OrderItem({
    required this.date,
    required this.orderId,
  required this.orderStatus,
  required this.vendorName,
    required this.time,
  required this.totalAmount,
    required this.customer,
  required this.itemsOrdered,
  required this.address,
  required this.rider,
  required this.image
});
}