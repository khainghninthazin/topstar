import 'package:flutter/material.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';


import '../constants/dimesions.dart';

class MyTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isPasswords;
  final double height;
  final IconData prefixIcon;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FormFieldValidator? fieldValidator;
  final void Function(String)? onChanged;
  final int? maxLine;
  final void Function(String)? onSubmitted;
  final bool? readOnly;
  final void Function()? onTap;
  final bool? hideIcon;
  final Widget? surfix;
  const MyTextFieldWidget(
      {super.key,
      required this.controller,
      this.hintText,
      required this.isPasswords,
      required this.prefixIcon,
      required this.inputType,
      required this.inputAction,
      this.fieldValidator,
      this.onSubmitted,
      this.maxLine,
      this.readOnly,
      this.onTap,
      this.onChanged,
      this.surfix,
      this.hideIcon, required this.height});

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        
          height: widget.height,
          padding: EdgeInsets.only(left: Dimesion.width5,right: Dimesion.width5),
          margin: EdgeInsets.symmetric(
              horizontal: 0, vertical: Dimesion.width5),
          decoration: BoxDecoration(
             boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 5,
                            color: Colors.black12)
                      ],
              color: AppColor.bgColor,
              borderRadius: BorderRadius.circular(Dimesion.radius15 / 2)),
          child: Row(
            children: [
              widget.hideIcon ?? false
                  ? const SizedBox.shrink()
                  : Icon(
                      widget.prefixIcon,
                      size: Dimesion.iconSize16,
                    ),
              widget.hideIcon ?? false
                  ? const SizedBox.shrink()
                  : SizedBox(
                      width: Dimesion.width10,
                    ),
              Expanded(
                child: TextFormField(
                  showCursor: widget.readOnly != null ? false : true,
                  cursorColor: Colors.black,
                  textAlign: TextAlign.start,
                  controller: widget.controller,
                  obscureText: widget.isPasswords ? showPass : false,
                  autocorrect: false,
                  onTap: widget.onTap,
                  readOnly: widget.readOnly ?? false,
                  style: context.labelLarge,
                  onChanged: widget.onChanged,
                  validator: widget.fieldValidator,
                  minLines: widget.maxLine ?? 1,
                  maxLines: widget.maxLine ?? 1,
                  onFieldSubmitted: widget.onSubmitted,
                  keyboardType: widget.inputType,
                  textInputAction: widget.inputAction,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: Dimesion.font16),
                    border: InputBorder.none,
                    helperStyle: TextStyle(fontSize: Dimesion.font16),
                    errorStyle:
                        const TextStyle(height: 0, color: Colors.transparent),
                    hintText: widget.hintText ?? "",
                    suffixIcon: widget.isPasswords
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            child: Icon(showPass
                                ? Icons.visibility
                                : Icons.visibility_off))
                        : null,
                  ),
                ),
              ),
              widget.surfix ?? const SizedBox.shrink()
            ],
          )),
    );
  }
}
