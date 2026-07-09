import 'package:flutter/material.dart';
import 'dart:math';

class ZZZCapsuleButton extends StatefulWidget {
  final String label, iconEmoji;
  final String? subLabel;
  final Color accentColor;
  final bool isActive, isHenshin;
  final VoidCallback onPressed;

  const ZZZCapsuleButton({super.key, required this.label, required this.iconEmoji,
    this.subLabel, required this.accentColor, this.isActive = false,
    this.isHenshin = false, required this.onPressed});

  @override State<ZZZCapsuleButton> createState() => _ZZZCapsuleButtonState();
}

class _ZZZCapsuleButtonState extends State<ZZZCapsuleButton> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  bool _pressed = false;

  @override void initState() { super.initState(); _ctrl = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this); if (widget.isActive) _ctrl.repeat(reverse: true); }
  @override void didUpdateWidget(ZZZCapsuleButton old) { super.didUpdateWidget(old); if (widget.isActive && !old.isActive) _ctrl.repeat(reverse: true); else if (!widget.isActive && old.isActive) { _ctrl.stop(); _ctrl.reset(); } }
  @override void dispose() { _ctrl.dispose(); super.dispose(); }

  @override Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) { setState(() => _pressed = false); widget.onPressed(); },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedBuilder(animation: _ctrl, builder: (ctx, _) {
        final pv = widget.isActive ? _ctrl.value : 0.0;
        return Transform.scale(scale: _pressed ? 0.94 : (1.0 + pv * 0.03),
          child: CustomPaint(painter: _CapsulePainter(accentColor: widget.accentColor, isActive: widget.isActive, isHenshin: widget.isHenshin, pulseValue: pv, isPressed: _pressed),
            child: Container(width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: widget.isHenshin ? 16 : 12, horizontal: 12),
              child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(widget.iconEmoji, style: TextStyle(fontSize: widget.isHenshin ? 32 : 24)),
                const SizedBox(height: 4),
                Text(widget.label, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'Impact', fontSize: widget.isHenshin ? 18 : 13, fontWeight: FontWeight.w900,
                    color: widget.isActive ? widget.accentColor : Colors.white, letterSpacing: widget.isHenshin ? 2.0 : 1.0, height: 1.2,
                    shadows: widget.isActive ? [Shadow(color: widget.accentColor.withOpacity(0.9), blurRadius: 16)] : [])),
                if (widget.subLabel != null) ...[const SizedBox(height: 2),
                  Text(widget.subLabel!, style: TextStyle(fontSize: 10, color: widget.accentColor.withOpacity(0.7)))],
              ]))));
      }),
    );
  }
}

class _CapsulePainter extends CustomPainter {
  final Color accentColor; final bool isActive, isHenshin, isPressed; final double pulseValue; final _rng = Random();
  _CapsulePainter({required this.accentColor, required this.isActive, required this.isHenshin, required this.pulseValue, required this.isPressed});

  @override void paint(Canvas canvas, Size size) {
    final r = size.height / 2, rect = Offset.zero & size, cr = RRect.fromRectAndRadius(rect, Radius.circular(r));
    final sr = RRect.fromRectAndRadius(rect.shift(const Offset(5, 5)), Radius.circular(r));
    canvas.drawRRect(sr, Paint()..color = const Color(0xFF000000));
    Color bg = isHenshin && isActive ? accentColor.withOpacity(0.3) : isActive ? accentColor.withOpacity(0.15) : isPressed ? const Color(0xFF353555) : const Color(0xFF252540);
    canvas.drawRRect(cr, Paint()..color = bg);
    if (isHenshin) { final g = Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [accentColor.withOpacity(isActive ? 0.4 : 0.15), accentColor.withOpacity(0.0)]).createShader(rect); canvas.drawRRect(cr, g); }
    canvas.drawRRect(cr, Paint()..color = isActive ? accentColor : Colors.white.withOpacity(0.6)..style = PaintingStyle.stroke..strokeWidth = isHenshin ? 3.5 : 2.5);
    if (isActive) { final gp = Paint()..color = accentColor.withOpacity(0.2 + pulseValue * 0.15)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12); canvas.drawRRect(cr, gp); }
    final sp = Paint()..color = Colors.black.withOpacity(0.05);
    for (double y = 0; y < size.height; y += 3) canvas.drawLine(Offset(0, y), Offset(size.width, y), sp..strokeWidth = 1);
    if (isActive && _rng.nextDouble() > 0.7) canvas.drawRect(Rect.fromLTWH(_rng.nextDouble() * size.width * 0.7, _rng.nextDouble() * size.height * 0.5, 10 + _rng.nextDouble() * 30, 3 + _rng.nextDouble() * 6), Paint()..color = accentColor.withOpacity(0.5 + _rng.nextDouble() * 0.3));
  }
  @override bool shouldRepaint(covariant _CapsulePainter o) => o.isActive != isActive || o.pulseValue != pulseValue || o.isPressed != isPressed;
}
