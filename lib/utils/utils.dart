import 'package:flutter/material.dart';

class Utils {
  static bool isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  static Widget buildText(
      String text, {
        FontWeight? fontWeight,
        TextAlign? textAlign,
        Color? textColor,
        int? maxLines,
        double? fontSize,
        TextStyle? style,
      }) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: style ??
          TextStyle(
            color: textColor ?? const Color(0xFF111111),
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            fontSize: fontSize ?? 14,
          ),
      maxLines: maxLines ?? 1,
    );
  }


}
