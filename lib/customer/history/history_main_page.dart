import 'package:desktop/custom_widgets/cards/order_card.dart';
import 'package:desktop/util/data.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';
class HistoryMainPage extends StatefulWidget {
  const HistoryMainPage({super.key});

  @override
  State<HistoryMainPage> createState() => _HistoryMainPageState();
}

class _HistoryMainPageState extends State<HistoryMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:   Image.asset(
            'assets/logos/logo2.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Order History",
              style: TextStyle(
                color: Color(ProjectColors.textColorGreen),
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            const SizedBox(height: 15,),
            Flexible(
              fit: FlexFit.loose,
                child: ListView.builder(
                    itemCount: Data.orders.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index){
                      return OrderCard(orderId: Data.orders[index].orderId, orderDate: Data.orders[index].date, totalAmount: Data.orders[index].totalAmount, orderStatus: Data.orders[index].orderStatus, vendorName: Data.orders[index].vendorName, items: Data.orders[index].itemsOrdered);
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
