import 'package:flutter/material.dart';

class CRTOverlay extends StatelessWidget {
  final double sl, vi;
  const CRTOverlay({super.key, this.sl = 0.04, this.vi = 0.4});
  @override Widget build(BuildContext context) => IgnorePointer(child: CustomPaint(painter: _CRTPainter(sl: sl, vi: vi), size: Size.infinite));
}

class _CRTPainter extends CustomPainter {
  final double sl, vi;
  _CRTPainter({required this.sl, required this.vi});
  @override void paint(Canvas canvas, Size size) {
    final sp = Paint()..color = Colors.black.withOpacity(sl);
    for (double y = 0; y < size.height; y += 3) canvas.drawLine(Offset(0, y), Offset(size.width, y), sp..strokeWidth = 1.5);
    canvas.drawRect(Offset.zero & size, Paint()..shader = RadialGradient(center: Alignment.center, radius: 0.9, colors: [Colors.transparent, Colors.black.withOpacity(vi)]).createShader(Offset.zero & size));
  }
  @override bool shouldRepaint(covariant _CRTPainter o) => false;
}
