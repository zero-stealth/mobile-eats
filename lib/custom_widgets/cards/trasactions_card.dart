import 'package:desktop/models/transactions_model.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
class TransactionsCards extends StatelessWidget {
  const TransactionsCards({super.key, required this.transactions});
  final Transactions transactions;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(ProjectColors.whiteColor),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transactions.transactionType,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(ProjectColors.textColorGreen),
                    fontSize: 20
                  ),
                ),
                Text(
                  transactions.transactionAvenue,
                  style: const TextStyle(
                      color: Color(ProjectColors.blackColorText),
                      fontSize: 18
                  ),
                )
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transactions.time,
                  style: const TextStyle(
                      color: Color(ProjectColors.blackColorText),
                      fontSize: 18
                  ),
                ),
                Text(
                  transactions.date,
                  style: const TextStyle(
                      color: Color(ProjectColors.blackColorText),
                      fontSize: 18
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
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 18
                  ),
                ),
                Text(
                 "KSH ${transactions.amount}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.blackColorText),
                      fontSize: 18
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
