import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:timos_customer_2025/screen/widget/custom_toast.dart';

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

  static String formatTotalMoney(dynamic amount) {
    String totalMoney = NumberFormat.simpleCurrency(locale: "vi_VN")
        .format(amount)
        .replaceAll(' ', '')
        .replaceAll('.', ',')
        .replaceAll('₫', '')
        .toString();
    if (totalMoney.split(' ').length == 1 ||
        totalMoney.split(' ').length == 2) {
      return totalMoney;
    } else {
      return totalMoney.split(' ')[0] + ' ' + totalMoney.split(' ')[1];
    }
  }


  static void showCustomToast(
      BuildContext context, IconData icon, String title) {
    showToastWidget(
      customToast(context, icon, title),
      duration: const Duration(seconds: 3),
      onDismiss: () {},
    );
  }


}
