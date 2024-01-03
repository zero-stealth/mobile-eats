import 'package:desktop/custom_widgets/button_widget.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderId, required this.orderDate, required this.totalAmount, required this.orderStatus, required this.vendorName, required this.items});
  final String orderId;
  final String orderDate;
  final int totalAmount;
  final String orderStatus;
  final String vendorName;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(ProjectColors.whiteColor).withOpacity(.6)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Order $orderId}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                  Text(
                    "20 mins ago",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(ProjectColors.textColorGreen).withOpacity(.7)
                    ),
                  )
                ],
              ),
             const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Order Date",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                  Text(
                    orderDate,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(ProjectColors.blackColorText)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Amount",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                  Text(
                    "$totalAmount",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(ProjectColors.blackColorText)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Order Status",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                  Text(
                    orderStatus,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(ProjectColors.blackColorText)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Vendor",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(ProjectColors.textColorGreen)
                    ),
                  ),
                  Text(
                    vendorName,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(ProjectColors.blackColorText)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              const Text(
                "Item Ordered",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(ProjectColors.textColorGreen)
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for(int i =0; i<items.length; i++) ...[
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black
                          ),
                        ),
                        const SizedBox(width: 3,),
                         Text(items[i])
                      ],
                    ),
                  ]


                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: const Color(ProjectColors.textColorGreen)
                        )
                      ),
                      child: const Center(
                        child: Text(
                          "View Details",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(ProjectColors.textColorGreen)
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: Button(text: "Reorder", hasIcon: false, onTap: (){},)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
