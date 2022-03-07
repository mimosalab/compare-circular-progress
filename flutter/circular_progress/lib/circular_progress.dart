import 'package:flutter/material.dart';
import 'dart:math' show cos, sin, pi;
import 'package:vector_math/vector_math.dart' show radians;

class CircularProgress extends StatefulWidget {
  const CircularProgress({Key? key}) : super(key: key);
  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      value: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: 200,
          height: 200,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: CustomPaint(
            painter: MeasurePainter(
              value: _animationController.value,
            ),
          ),
        );
      },
    );
  }
}

class MeasurePainter extends CustomPainter {
  const MeasurePainter({
    this.value = 0.0,
    this.circleWith = 2.0,
    this.divisions = 24,
    this.minAngle = -135.0,
    this.maxAngle = 135.0,
  }) : assert(minAngle < maxAngle, 'minAngle < maxAngle');

  final double value;
  final double circleWith;
  final int divisions;
  final double minAngle;
  final double maxAngle;

  @override
  void paint(Canvas canvas, Size size) {
    _drawCircle(canvas, size);
  }

  void _drawCircle(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(
        size.width / 2,
        size.height / 2,
      ),
      100.0 - circleWith / 2,
      Paint()
        ..color = Colors.black38
        ..style = PaintingStyle.stroke
        ..strokeWidth = circleWith,
    );
  }

  Offset _angleToPoint(double radius, double angle) {
    return Offset(
      radius * cos(pi * angle / 180),
      radius * sin(pi * angle / 180),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
