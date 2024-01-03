import 'dart:ui';

import 'package:flutter/material.dart';

import '../../util/colors.dart';
import 'manage_riders.dart';

class AddRiderSuccess extends StatefulWidget {
  const AddRiderSuccess({super.key, required this.message});
  final String message;
  @override
  State<AddRiderSuccess> createState() => _AddRiderSuccessState();
}

class _AddRiderSuccessState extends State<AddRiderSuccess> {
  @override

  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height*.7,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(

            children: [
              const Text(
                "Success!",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(ProjectColors.textColorGreen)
                ),
              ),
              Image.asset("assets/images/success.png",height: 300,),
              SizedBox(
                width: MediaQuery.of(context).size.width*.7,
                child: Text(
                  widget.message,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(ProjectColors.blackColorText)
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 50,),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const ManageRiders()));
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(ProjectColors.textColorGreen),

                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: const Center(child: Text('Back to Dashboard', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(ProjectColors.whiteColor)),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
