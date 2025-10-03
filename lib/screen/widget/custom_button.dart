import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timos_customer_2025/themes/colors.dart';

Widget backButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
        child: Icon(Icons.arrow_back, color: Colors.black),
      ),
    ),
  );
}

Widget buttonAnimationFindLocation(
  Icon icon,
  Text text,
  VoidCallback onTap, {
  BorderSide? border,
  Color? color,
}) {
  final child = Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      icon,
      const SizedBox(width: 8),
      text,
    ],
  );

  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  return border == null
      ? ElevatedButton(
          onPressed: onTap,
          child: child,
          style: ElevatedButton.styleFrom(
              shape: shape, backgroundColor: mainColor),
        )
      : OutlinedButton(
          onPressed: onTap,
          child: child,
          style: OutlinedButton.styleFrom(shape: shape),
        );
}

class ButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final VoidCallback onPressed;
  final double radius;
  final bool modeFlatButton;
  final EdgeInsets margin;
  final EdgeInsets padding;

  ButtonWidget({
    required this.backgroundColor,
    required this.title,
    required this.onPressed,
    this.radius = 0,
    this.modeFlatButton = false,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Theme.of(context).cardColor, Color(0xff8CC63F)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(color: white, fontSize: 16.0),
        ),
      ),
    );
  }
}
