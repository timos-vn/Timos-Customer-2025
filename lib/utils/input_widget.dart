import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:timos_customer_2025/const/app_dimens.dart';
import 'package:timos_customer_2025/themes/colors.dart';


class InputWidget extends StatefulWidget {
  final String? placeholder;
  final Function(String value)? onChange;
  final String? value;
  final TextInputType? inputType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String? value)? validator;

  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;

  final TextEditingController? controller;
  final bool disableTapOutside;
  final bool? enabled;
  final int? maxLines;
  final int? minLines;
  final bool? currencyInput;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String value)? onCompleted; // 🔹 Callback khi bấm Done

  const InputWidget({
    super.key,
    this.placeholder,
    this.onChange,
    this.value,
    this.inputType,
    this.obscureText,
    this.prefixIcon,
    this.validator,
    this.disabledBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.controller,
    this.disableTapOutside = false,
    this.enabled,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.currencyInput,
    this.focusNode,
    this.textInputAction,
    this.contentPadding,
    this.onCompleted,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enabled ?? true,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      // key: UniqueKey(),
      style: const TextStyle(fontSize: CustomTextStyle.normalFontSize),
      initialValue: widget.value,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: const TextStyle(color: disableColor, fontSize: 13, ),
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints.expand(width: 50, height: 50),
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints: const BoxConstraints.expand(width: 50, height: 50),
        contentPadding: widget.contentPadding,
        focusedBorder:
        widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppDimens.normalInputBorderRadius,
              ),
              borderSide: const BorderSide(color: borderColor, width: 1),
            ),
        focusedErrorBorder:
        widget.focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppDimens.normalInputBorderRadius,
              ),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1),
            ),
        errorBorder:
        widget.errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppDimens.normalInputBorderRadius,
              ),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1),
            ),
        enabledBorder:
        widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppDimens.normalInputBorderRadius,
              ),
              borderSide: const BorderSide(color: borderColor, width: 1),
            ),
        disabledBorder:
        widget.disabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppDimens.normalInputBorderRadius,
              ),
              borderSide: const BorderSide(color: borderColor, width: 1),
            ),
      ),
      keyboardType: widget.inputType,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      inputFormatters:
      (widget.currencyInput ?? false) ? [CurrencyInputFormatter()] : null,
      obscureText: widget.obscureText ?? false,
      onChanged: (value) {
        widget.onChange != null ? widget.onChange!(value) : {};
      },
      onTapOutside:
      widget.disableTapOutside
          ? null
          : (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: widget.validator,
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus(); // bỏ focus
        widget.onCompleted?.call(value);  // gọi callback nếu có
      },
    );
  }
}

class CustomTextStyle{
  static const normalFontSize = 14.0;
  static const bigFontSize = 16.0;
  static const smallFontSize = 12.0;
  static const tinyFontSize = 10.0;

  static const normalFontWeight = FontWeight.w500;
  static const boldFontWeight = FontWeight.w700;

}

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat formatter = NumberFormat("#,###", "vi_VN");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Nếu nhập rỗng thì trả về luôn
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Xoá hết ký tự không phải số
    String numericString = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Parse ra số
    int number = int.parse(numericString);

    // Format theo tiền tệ
    String newText = formatter.format(number);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}


