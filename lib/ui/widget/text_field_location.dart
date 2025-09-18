import 'package:flutter/material.dart';
import 'package:timos_customer_2025/themes/colors.dart';

class TextFieldWidgetLocation extends StatefulWidget {
  const TextFieldWidgetLocation({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.hint,
    required this.enable,
    required this.prefixIcon,
    this.suffixIcon,
    required this.locationCallback,
    required this.onSubmitted,
    required this.textInputAction,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String hint;
  final bool enable;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final Function(String) locationCallback;
  final FormFieldSetter<String> onSubmitted;
  final TextInputAction textInputAction;

  @override
  _TextFieldWidgetLocationState createState() =>
      _TextFieldWidgetLocationState();
}

class _TextFieldWidgetLocationState extends State<TextFieldWidgetLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        style: TextStyle(fontSize: 12.0, color: Colors.black),
        onChanged: (value) {
          widget.locationCallback(value);
        },
        controller: widget.controller,
        focusNode: widget.focusNode,
        enabled: widget.enable,
        onSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction,
        decoration: new InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          // labelText: widget.label,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          //Change this value to custom as you like
          // isDense: true,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: grey, width: 1),
            borderRadius: BorderRadius.circular(30.0),
          ),

          fillColor: dark_text.withOpacity(0.2),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
