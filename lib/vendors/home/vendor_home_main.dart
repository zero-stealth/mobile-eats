import 'package:desktop/custom_widgets/cards/dash_cards.dart';
import 'package:desktop/custom_widgets/cards/recent_orders_card.dart';
import 'package:desktop/custom_widgets/cards/vendor_popular_ordered.dart';
import 'package:desktop/custom_widgets/vendor_drawer.dart';
import 'package:desktop/util/data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../models/chart_data_model.dart';
import '../../util/colors.dart';

class VendorHomeMain extends StatefulWidget {
  const VendorHomeMain({super.key});

  @override
  State<VendorHomeMain> createState() => _VendorHomeMainState();
}

class _VendorHomeMainState extends State<VendorHomeMain> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(ProjectColors.whiteColor),
          title:
              Image.asset(
                'assets/logos/logo2.png',
                fit: BoxFit.contain,
                height: 50,
              ),
             ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(ProjectColors.lightPink)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(ProjectColors.textColorGreen)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: const Color(ProjectColors.whiteColor),
                          filled: true,
                          contentPadding: const EdgeInsets.all(5),
                          labelText: "Search",
                          labelStyle: TextStyle(
                              color: const Color(ProjectColors.blackColorText)
                                  .withOpacity(.7)),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Color(ProjectColors.blackColorText),
                            size: 16,
                          )),
                    )),
                    const Icon(
                      Icons.notifications_none_rounded,
                      size: 20,
                      color: Color(ProjectColors.textColorGreen),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Overview",
                      style: TextStyle(
                          color: Color(ProjectColors.textColorGreen),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(ProjectColors.background)),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(ProjectColors.whiteColor),
                              size: 16,
                            ),
                            Text(
                              "Add new Rider",
                              style: TextStyle(
                                  color: Color(ProjectColors.whiteColor),
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashCards(title: "Total Dishes", cardValue: "42"),
                    DashCards(title: "Total Orders Received", cardValue: "320"),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashCards(
                        title: "Total Earnings", cardValue: "Ksh. 45,600"),
                    DashCards(title: "Total Customers", cardValue: "100"),
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sales Performance",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(ProjectColors.textColorGreen)
                      ),
                    ),
                    Text(
                      "Monthly",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(ProjectColors.textColorGreen)
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(ProjectColors.whiteColor).withOpacity(.6),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color:  Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: LineChart(
                          LineChartData(
                              minX: 0,
                              maxX: 11,
                              minY: 1,
                              maxY: 22,
                              borderData: FlBorderData(
                                  show: false
                              ),
                              gridData: const FlGridData(
                                  show: false
                              ),
                              titlesData: const FlTitlesData(
                                  show: true,
                                  bottomTitles: AxisTitles(
                                      sideTitles:SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: bottomTitleWidgets
                                      )
                                  ),
                                  leftTitles: AxisTitles(
                                      sideTitles:SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: leftTitleWidgets
                                      )
                                  ),
                                  rightTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                          showTitles: false
                                      )
                                  ),
                                  topTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                          showTitles: false
                                      )
                                  )
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                    spots: [
                                      FlSpot(0, 5),
                                      FlSpot(1, 10),
                                      FlSpot(2, 9),
                                      FlSpot(3, 2),
                                      FlSpot(4, 2),
                                      FlSpot(5, 6),
                                      FlSpot(6, 12),
                                      FlSpot(7, 10),
                                      FlSpot(8, 8),
                                      FlSpot(9, 9),
                                      FlSpot(10, 15),
                                      FlSpot(11, 12),

                                    ],
                                    isCurved: true,
                                    color: const Color(ProjectColors.brown),
                                    barWidth: 3,
                                    dotData: const FlDotData(show: false),
                                    belowBarData: BarAreaData(
                                        show: true,
                                        color: const Color(ProjectColors.lightPink).withOpacity(.6)
                                    )
                                )
                              ]
                          )

                      )

                ),
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color(ProjectColors.whiteColor).withOpacity(.7),
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color:  Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      const Text(
                        "Popular Dishes",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(ProjectColors.textColorGreen)
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Expanded(
                        child: ListView.builder(
                          itemCount: Data.popularDishSales.length,
                            itemBuilder: (ctx, index){
                              return VendorPopularOrdered(image: Data.popularDishSales[index].image, dishName: Data.popularDishSales[index].dishName, totalOrders: Data.popularDishSales[index].totalOrders, rating: Data.popularDishSales[index].rating);
                            }
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7,),
                RecentOrderCards(orders: Data.orders),
              ],
            ),
          ),
        ),
      ),
      endDrawer: const VendorDrawer()
    );
  }
}
Widget bottomTitleWidgets(double value, TitleMeta meta) {
  String text = value.toString();
  switch (value){
    case 0:
      text = "Jan";
    case 1:
      text = "Feb";
    case 2:
      text = "Mar";
    case 3:
      text = "Apr";
    case 4:
      text = "May";
    case 5:
      text = "Jun";
    case 6:
      text = "Jul";
    case 7:
      text = "Aug";
    case 8:
      text = "Sep";
    case 9:
      text = "Oct";
    case 10:
      text = "Nov";
    case 11:
      text = "Dec";


  }

  return FittedBox(fit: BoxFit.scaleDown,child: Text(text, style: const TextStyle(fontSize: 8), textAlign: TextAlign.center), );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  String text = value.toString();
  switch (value){
    case 1:
      text = "10k";
    case 2:
      text = "20k";
    case 3:
      text = "30k";
    case 4:
      text = "40k";
    case 5:
      text = "50k";
    case 6:
      text = "60k";
    case 7:
      text = "70k";
    case 9:
      text = "90k";
    case 10:
      text = "100k";
    case 11:
      text = "110k";
    case 12:
      text = "120k";
    case 13:
      text = "130k";
    case 14:
      text = "140k";
    case 15:
      text = "150k";
    case 16:
      text = "160k";
    case 17:
      text = "170k";
    case 18:
      text = "180k";
    case 19:
      text = "190k";
    case 20:
      text = "200k";
    case 21:
      text = "210k";
    case 22:
      text = "220k";


  }

  return FittedBox(fit: BoxFit.scaleDown,child: Text(text, style: const TextStyle(fontSize: 8), textAlign: TextAlign.center), );
}
