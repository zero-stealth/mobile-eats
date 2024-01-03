import 'package:desktop/custom_widgets/textfield_widget.dart';
import 'package:desktop/vendors/wallet/all_transactions.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/vendor_drawer.dart';
import '../../util/colors.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  String selectedType = "Bank";
  TextEditingController amountController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController securityPinController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  bool submitted = false;

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
        height: MediaQuery.of(context).size.height ,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllTransactions()));
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
                  "WithDrawls",
                  style: TextStyle(
                      fontSize: 20, color: Color(ProjectColors.textColorGreen)),
                ),
                TextFieldWidget(
                    controller: amountController,
                    obscureText: false,
                    hintText: "Amount",
                    labelText: "Enter withdrawal amount",
                    submitted: submitted,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number),

                const Text(
                  "WithDrawal method",
                  style: TextStyle(
                      fontSize: 18, color: Color(ProjectColors.textColorGreen)),
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          checkColor: const Color(ProjectColors.textColorGreen),
                          onChanged: (bool? selected) {

                            setState(() {
                              selectedType = "Bank";
                            });
                          }, value: selectedType == "Bank"? true:false,),
                        const SizedBox(width: 1,),
                        const Text("Bank Transfer",
                          style: TextStyle(
                              fontSize: 13
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          checkColor: const Color(ProjectColors.textColorGreen),
                          onChanged: (bool? selected) {

                            setState(() {
                              selectedType = "M-Pesa";
                            });
                          }, value: selectedType == "M-Pesa"? true:false,),
                        const SizedBox(width: 1,),
                        const Text("M-Pesa",
                          style: TextStyle(
                              fontSize: 13
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                selectedType == "Bank"?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Bank Details",
                      style: TextStyle(
                          fontSize: 20, color: Color(ProjectColors.textColorGreen), fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    TextFieldWidget(
                        controller: bankNameController,
                        obscureText: false,
                        hintText: "Bank Name",
                        labelText: "Enter bank name",
                        submitted: submitted,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    TextFieldWidget(
                        controller: accountNameController,
                        obscureText: false,
                        hintText: "Account Name",
                        labelText: "Enter account name",
                        submitted: submitted,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    TextFieldWidget(
                        controller: accountNumberController,
                        obscureText: false,
                        hintText: "Account number",
                        labelText: "Enter account number",
                        submitted: submitted,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number),

                    TextFieldWidget(
                        controller: accountNumberController,
                        obscureText: false,
                        hintText: "Security Pin",
                        labelText: "Enter security pin",
                        submitted: submitted,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number),
                    const SizedBox(height: 20,),
                    TextButton(
                      onPressed: () {
                        //logic

                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.textColorGreen),

                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: const Center(child: Text('Withdraw', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                      ),
                    ),
                    const SizedBox(height: 7,),
                    TextButton(
                      onPressed: () {
                        //logic

                      },
                      child: Container(
                        height: 40,
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
                ):Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "M-Pesa Details",
                      style: TextStyle(
                          fontSize: 20, color: Color(ProjectColors.textColorGreen), fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    TextFieldWidget(
                        controller: phoneNumberController,
                        obscureText: false,
                        hintText: "M-Pesa Phone number",
                        labelText: "Enter M-Pesa Phone number",
                        submitted: submitted,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number),

                  TextFieldWidget(
                      controller: codeController,
                      obscureText: false,
                      hintText: "M-Pesa Transaction Code",
                      labelText: "Enter M-Pesa Transaction Code",
                      submitted: submitted,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                    const SizedBox(height: 20,),
                    TextButton(
                      onPressed: () {
                        //logic

                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(ProjectColors.textColorGreen),

                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: const Center(child: Text('Withdraw', style: TextStyle(fontSize: 16, color: Color(ProjectColors.whiteColor)),)),
                      ),
                    ),
                    const SizedBox(height: 7,),
                    TextButton(
                      onPressed: () {
                        //logic

                      },
                      child: Container(
                        height: 40,
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
