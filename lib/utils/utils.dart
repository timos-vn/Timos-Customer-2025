import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:timos_customer_2025/screen/widget/custom_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static bool isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }
  static void showCallDialog(BuildContext context, String phoneNumber) {
    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chưa có số của tài xế'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 300),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.phone, color: Colors.green, size: 36),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Gọi điện",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                phoneNumber,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Huỷ",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        final uri = Uri.parse('tel:$phoneNumber');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Không thể thực hiện cuộc gọi'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Gọi ngay",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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

  static void showMyToast(BuildContext context, String message) {
    Flushbar(
      message: message,
      titleColor: Colors.black,
      messageColor: Colors.white,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black54,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 300),
    ).show(context);
  }


}
