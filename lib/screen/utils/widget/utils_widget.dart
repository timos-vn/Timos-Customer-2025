import 'package:flutter/material.dart';
import 'package:timos_customer_2025/const/app_dimens.dart';

import 'package:timos_customer_2025/themes/colors.dart';

class UtilsWidget {
  static Widget buildText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? textColor,
    TextOverflow? overflow,
    int? maxLines,
    FontStyle? fontStyle = FontStyle.normal,
    TextAlign? textAlign,
    String? fontFamily = 'Roboto',
  }) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? textColorDefault,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
    );
  }

  static Widget dialogUpdateShorebird({
    required String contentNotification,
    required Function() fuc,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radius8),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: AppDimens.padding12,
          ),
          buildText(
            text: "Thông báo",
            fontSize: AppDimens.sizeTextMedium,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(
            height: AppDimens.padding12,
          ),
          buildText(
            text: contentNotification,
            fontSize: AppDimens.sizeTextSmall,
            maxLines: 4,
            // fontWeight: FontWeight.w700,
          ),
          const SizedBox(
            height: AppDimens.paddingDefault,
          ),
          Row(
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textColorSecondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppDimens.radius8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: UtilsWidget.buildText(
                            text: "Huỷ",
                            textColor: white,
                            fontWeight: FontWeight.w700),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radius8),
                      ),
                    ),
                    onPressed: () => fuc(),
                    child: UtilsWidget.buildText(
                        text: "Đồng ý",
                        textColor: white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
