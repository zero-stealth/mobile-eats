import 'package:desktop/vendors/wallet/transactions_page.dart';
import 'package:desktop/vendors/wallet/withdraw_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widgets/cards/trasactions_card.dart';
import '../../custom_widgets/vendor_drawer.dart';
import '../../util/colors.dart';
import '../../util/data.dart';
class AllTransactions extends StatefulWidget {
  const AllTransactions({super.key});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
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
      body: Padding(
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
                        context,
                        MaterialPageRoute(
                            builder: (context) => WithdrawPage()));
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
                    //logic

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
                    child:  Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .30,
                          child: const Text(
                            'Back to Overview',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(ProjectColors.textColorGreen)),
                            softWrap: true,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
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
            Expanded(
                child: ListView.builder(
                  itemCount: Data.allTransactions.length,
                    itemBuilder: (ctx , index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TransactionsCards(transactions: Data.allTransactions[index]),
                  );
                })
            )
          ],
        ),
      ),
      endDrawer: const VendorDrawer(),
    );
  }
}
