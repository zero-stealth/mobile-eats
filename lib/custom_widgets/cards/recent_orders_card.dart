import 'dart:ui';

import 'package:desktop/models/order_item_model.dart';
import 'package:desktop/models/riders_model.dart';
import 'package:desktop/util/colors.dart';
import 'package:desktop/util/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class RecentOrderCards extends StatefulWidget {
  const RecentOrderCards({super.key, required this.orders});

  final List<OrderItem> orders;

  @override
  State<RecentOrderCards> createState() => _RecentOrderCardsState();
}

class _RecentOrderCardsState extends State<RecentOrderCards> {


  void showDialogue(OrderItem orderItem){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: OrdersDialogue(orderItem: orderItem,)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(ProjectColors.whiteColor).withOpacity(.3),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color:  Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              children: [
                TableRow(
                    decoration: BoxDecoration(
                        color: const Color(ProjectColors.lightPink),
                        border: Border.all(
                            color: const Color(ProjectColors.brown))),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                            child: Text(
                              "Order number",
                              style: TextStyle(
                                  color: Color(ProjectColors.darkBrown),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                            child: Text(
                              "Customer Name",
                              style: TextStyle(
                                  color: Color(ProjectColors.darkBrown),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  color: Color(ProjectColors.darkBrown),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                      ),
                    ]),
        for (int i = 0; i < widget.orders.length; i++) ...[

                TableRow(
                  decoration: BoxDecoration(
                    color: i %2==1?const Color(ProjectColors.lightPink):const Color(ProjectColors.whiteColor)
                  ),
                    children: [

                    GestureDetector(
                      onTap: (){
                        showDialogue(widget.orders[i]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(child: Text(widget.orders[i].orderId, style: const TextStyle(fontSize: 12),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(child: Text(widget.orders[i].customer, style: const TextStyle(fontSize: 12))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: widget.orders[i].orderStatus == "Pending"?
                              const Color(0xFFFFF9E6): widget.orders[i].orderStatus == "Incomplete"?const Color(0xFFFFFBE5):
                          widget.orders[i].orderStatus == "Confirmed"?const Color(0xFFEDF7EE):widget.orders[i].orderStatus == "Failed"?
                              const Color(0xFFF0F8FB):widget.orders[i].orderStatus == "Delivered"?const Color(0xFFF0F8FB):const Color(0xFFFFF9E6)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.orders[i].orderStatus, style:  TextStyle(fontSize: 12, color: widget.orders[i].orderStatus == "Pending"?
                          const Color(0xFFB58905): widget.orders[i].orderStatus == "Incomplete"?const Color(0xFFE9C402):
                          widget.orders[i].orderStatus == "Confirmed"?const Color(0xFF367C39):widget.orders[i].orderStatus == "Failed"?
                          const Color(0xFF7D0017):widget.orders[i].orderStatus == "Delivered"?const Color(0xFF343474):const Color(0xFFB58905))),
                        ),
                      )),
                    ),

                ])
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
class OrdersDialogue extends StatefulWidget {
  const OrdersDialogue({super.key, required this.orderItem});
  final OrderItem orderItem;
  @override
  State<OrdersDialogue> createState() => _OrdersDialogueState();
}

class _OrdersDialogueState extends State<OrdersDialogue> {
  Riders? rider;
  TextEditingController riderController = TextEditingController();
  void showSuccess(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: const Color(ProjectColors.whiteColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Success!",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.textColorGreen)
                  ),
                ),
                Image.asset("assets/images/success.png",height: 300,),
                const Text(
                  "Congratulations, Order has been confirmed",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(ProjectColors.blackColorText)
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(ProjectColors.textColorGreen),

                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: const Center(child: Text('Back to Dashboard', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      backgroundColor: const Color(ProjectColors.whiteColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Order",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(ProjectColors.textColorGreen),
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Customer",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                ),
                Text(
                  widget.orderItem.customer,
                  style: const TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                )
              ],
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Order Number",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                ),
                Text(
                  widget.orderItem.orderId,
                  style: const TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                )
              ],
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Customer Address",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    widget.orderItem.address,
                    style: const TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontSize: 14
                    ),
                    softWrap: true,
                  ),
                )
              ],
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Order Time",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                ),
                Text(
                  widget.orderItem.time,
                  style: const TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                )
              ],
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Order Date",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                ),
                Text(
                  widget.orderItem.date,
                  style: const TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14
                  ),
                )
              ],
            ),
            const SizedBox(height: 7),
            DottedBorder(
                color: const Color(ProjectColors.textColorGreen),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Items Ordered",
                        style: TextStyle(
                            color: Color(ProjectColors.textColorGreen),
                            fontSize: 14
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          for(int i=0; i<widget.orderItem.itemsOrdered.length; i++) ...[
                            Row(
                              children: [
                                Container(
                                  height: 5,
                                  width: 5,
                                  decoration: const BoxDecoration(
                                      color: Color(ProjectColors.textColorGreen),
                                      shape: BoxShape.circle
                                  ),

                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    widget.orderItem.itemsOrdered[i],
                                    style: const TextStyle(
                                        color: Color(ProjectColors.textColorGreen),
                                        fontSize: 14
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            )
                          ]
                        ],
                      )
                    ],
                  ),
                )
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    "${widget.orderItem.totalAmount}",
                    style: const TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                    softWrap: true,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Dash(
              length: MediaQuery.of(context).size.width *.67,
              dashColor: const Color(ProjectColors.blackColorText).withOpacity(.5),),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Order Status",
                  style: TextStyle(
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    widget.orderItem.orderStatus,
                    style: const TextStyle(
                        color: Color(ProjectColors.darkBrown),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                    softWrap: true,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Dash(
              length: MediaQuery.of(context).size.width *.67,
              dashColor: const Color(ProjectColors.blackColorText).withOpacity(.5),),
            const SizedBox(height: 10),
            const Text(
              "Assign Rider",
              style: TextStyle(
                  color: Color(ProjectColors.textColorGreen),
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 5),
            DropdownButtonHideUnderline(
              child: DropdownButton2<Riders>(
                isExpanded: true,
                hint: Text(
                  'Select Available Riders',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: Data.availableRiders
                    .map((item) => DropdownMenuItem(
                    value: item,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *.7,
                      height: 30,
                      child: Row(
                        children: [
                          Image.asset(item.image, width: 40,),
                          const SizedBox(width: 5,),
                          Text(
                            item.riderName,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    )
                ))
                    .toList(),
                value: rider,
                onChanged: (value) {
                  setState(() {
                    rider = value;
                  });
                },
                buttonStyleData:  ButtonStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(ProjectColors.blackColorText)
                        ),
                        borderRadius: BorderRadius.circular(7)
                    )
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: riderController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: riderController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an item...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value!.riderName.toString().contains(searchValue);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    riderController.clear();
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                showSuccess();
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(ProjectColors.textColorGreen),

                    borderRadius: BorderRadius.circular(7)
                ),
                child: const Center(child: Text('Confirm Order', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(ProjectColors.whiteColor),
                    border: Border.all(
                        color: const Color(ProjectColors.textColorGreen)
                    ),
                    borderRadius: BorderRadius.circular(7)
                ),
                child: const Center(child: Text('Cancel', style: TextStyle(fontSize: 16, color: Color(ProjectColors.textColorGreen)),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

