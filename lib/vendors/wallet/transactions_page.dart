import 'package:desktop/custom_widgets/cards/transactions_stats_card.dart';
import 'package:desktop/custom_widgets/cards/trasactions_card.dart';
import 'package:desktop/custom_widgets/vendor_drawer.dart';
import 'package:desktop/util/data.dart';
import 'package:desktop/vendors/wallet/all_transactions.dart';
import 'package:desktop/vendors/wallet/withdraw_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  String? period = "monthly";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ProjectColors.whiteColor),
        title: Image.asset(
          'assets/logos/logo2.png',
          fit: BoxFit.contain,
          height: 50,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height*.8,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Transactions",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.textColorGreen)),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const  WithdrawPage()));
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .45,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.textColorGreen),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.payments_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .35,
                                child: const Text(
                                  'Make Withdrawals',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(ProjectColors.whiteColor)),
                                  softWrap: true,
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>  AllTransactions()));
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .35,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.whiteColor),
                            border: Border.all(
                                color:
                                    const Color(ProjectColors.textColorGreen)),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                            child: Text(
                          'View History',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(ProjectColors.textColorGreen)),
                        )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Overview",
                  style: TextStyle(
                      fontSize: 20, color: Color(ProjectColors.textColorGreen)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(ProjectColors.textColorGreen),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Amount",
                              style: TextStyle(
                                  color: Color(ProjectColors.whiteColor),
                                  fontSize: 12),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Color(ProjectColors.whiteColor)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Country',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: Data.analyticsPeriod
                                      .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color(ProjectColors
                                                      .textColorGreen)),
                                            ),
                                          ))
                                      .toList(),
                                  value: period,
                                  onChanged: (value) {
                                    setState(() {
                                      period = value;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      height: 27,
                                      width: MediaQuery.of(context).size.width *
                                          .27,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(ProjectColors
                                                  .blackColorText)),
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  dropdownStyleData: const DropdownStyleData(
                                    maxHeight: 200,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "Your current balance",
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Ksh 1,234.56 ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Image.asset(
                            "assets/icons/vector6.png",
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransactionsStatsCard(
                        title: "Amount Withdrawn",
                        subtitle: "Total withdrawn so far",
                        price: "Ksh 567.89"),
                    TransactionsStatsCard(
                        title: "Failed Transaction",
                        subtitle: "Total Failed Transaction",
                        price: "0")
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Transaction History",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.textColorGreen)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.4,
                      child: const TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                   Row(
                     children: [
                       TextButton(
                           onPressed: () {},
                           child: const Text(
                             "View All",
                             style: TextStyle(
                                 color: Color(
                                   ProjectColors.textColorGreen,
                                 ),
                                 fontSize: 16),
                           )),
                      GestureDetector(
                        onTap: (){
                          //sorting actions
                        },
                        child: Container(
                               height: 35,
                               width: 70,
                               decoration: BoxDecoration(
                                 color: const Color(ProjectColors.textColorGreen),
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: const Center(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(
                                       Icons.filter_list_rounded,
                                       color: Color(ProjectColors.whiteColor),
                                       size: 14,
                                     ),
                                     SizedBox(
                                       width: 5,
                                     ),
                                     Text(
                                       "Sort",
                                       style: TextStyle(
                                           color: Color(ProjectColors.whiteColor),
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                      )
                     ],
                   )
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: Data.allTransactions.length,
                    itemBuilder: (ctx, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TransactionsCards(transactions: Data.allTransactions[index]),
                      );
                    }
                )
              ],
            ),
          ),
        ),
      ),
      endDrawer: const VendorDrawer(),
    );
  }
}
