import 'package:flutter/material.dart';

class WavePainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        color: Colors.red,
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = new Path();

    path.lineTo(0, size.height / 10);

    var firstControlPoint = new Offset(size.width / 6, size.height / 3);
    var firstEndPoint = new Offset(size.width / 1.70, size.height / 3 - 80);

    var secondControlPoint =
        new Offset(size.width - (size.width / 6), size.height / 4 - 65);
    var secondEndPoint = new Offset(size.width, size.height / 3 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
