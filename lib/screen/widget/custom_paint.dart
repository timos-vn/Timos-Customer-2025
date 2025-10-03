import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FullTicketClipper extends CustomClipper<Path> {
  final double punchRadius;
  final double top;
  final double middle;
  FullTicketClipper(this.punchRadius, this.top, this.middle);

  @override
  Path getClip(Size size) {
    Path path = Path();

    // path.lineTo(0.0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0.0);
    //
    // path.addOval(
    //     Rect.fromCircle(center: Offset(0.0, top), radius: punchRadius));
    // path.addOval(
    //     Rect.fromCircle(center: Offset(size.width, top), radius: punchRadius));

    path.lineTo(0.0, top - punchRadius);
    path.conicTo(punchRadius, top - punchRadius, punchRadius, top, 1.0);
    path.conicTo(punchRadius, top + punchRadius, 0, top + punchRadius, 1.0);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, top + punchRadius);
    path.conicTo(size.width - punchRadius, top + punchRadius, size.width - punchRadius, top, 1.0);
    path.conicTo(size.width - punchRadius, top - punchRadius, size.width, top - punchRadius, 1.0);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
