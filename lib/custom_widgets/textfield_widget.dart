import "package:desktop/util/colors.dart";
import "package:flutter/material.dart";

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function()?validate;
  final String? hintText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool obscureText;
  final String labelText;
  final String? error;
  final bool submitted;
  const TextFieldWidget({Key? key, required this.controller, this.validate,  this.hintText, required this.obscureText, required this.labelText, this.error, required this.submitted, required this.textInputAction, required this.textInputType, }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool passwordVisible=false;
  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (context, TextEditingValue value, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.hintText??"",
                textAlign: TextAlign.left,),
              const SizedBox(height: 10.0),
              TextField(
                controller: widget.controller,
                obscureText: widget.obscureText ? passwordVisible : false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(ProjectColors.blackColorText)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(ProjectColors.textColorGreen)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.all(5),
                  hintText: widget.hintText,
                  labelText: widget.labelText,
                  errorText: widget.submitted? widget.error:null,
                  suffixIcon: widget.obscureText ? IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(
                            () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                    color: const Color(ProjectColors.textColorGreen),
                  ) : const Icon(
                    Icons.account_circle_rounded, color: Colors.white,),
                  alignLabelWithHint: false,
                  hintStyle: TextStyle(color: Colors.grey[500],


                  ),

                ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: widget.textInputAction,
              ),
            ],
          );

        }
    );
  }
}
