import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../../util/data.dart';
class TransactionsStatsCard extends StatefulWidget {
  const TransactionsStatsCard({super.key, required this.title, required this.subtitle, required this.price});
  final String title;
  final String subtitle;
  final String price;
  @override
  State<TransactionsStatsCard> createState() => _TransactionsStatsCardState();
}

class _TransactionsStatsCardState extends State<TransactionsStatsCard> {
  String? period = "monthly";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color(ProjectColors.blackColorText).withOpacity(.3)
        ),

      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(ProjectColors.textColorGreen),
                  fontSize: 14
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              widget.subtitle,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(ProjectColors.textColorGreen),
                  fontSize: 8
              ),
              textAlign: TextAlign.start,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(ProjectColors.textColorGreen),
                      fontSize: 28
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/down.png",width: 100,)
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Period',
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
                            color: Color(ProjectColors.textColorGreen)
                        ),
                      ),
                    ))
                        .toList(),
                    value: period,
                    onChanged: (value) {
                      setState(() {
                        period = value;
                      });
                    },
                    buttonStyleData:  ButtonStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        height: 27,
                        width: MediaQuery.of(context).size.width *.25,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(ProjectColors.blackColorText)
                            ),
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  }

