import 'package:flutter/widgets.dart';

class PaintContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFF424242);
    paint.style = PaintingStyle.fill;
    size = Size(size.width, 430);
    var path = Path();
    path.moveTo(0, size.height * 0.80);
    path.quadraticBezierTo(
        size.width / 2, size.height / 0.94, size.width, size.height * 0.80);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePainter extends CustomPainter {
  final double animationValue;

  CirclePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFF424242);
    paint.style = PaintingStyle.fill;

    var path = Path();
    double radius = size.width * (animationValue - 0.80) * 1;
    if (animationValue > 0.4) {
      path.addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 150));
    } else {}
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: animationValue == 0.5 ? 150 : radius));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
