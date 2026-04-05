import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppIcon extends StatelessWidget {
  final double size;

  const AppIcon({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(size * 0.275),
      ),
      child: CustomPaint(
        painter: _AppIconPainter(),
      ),
    );
  }
}

class _AppIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final paint = Paint()
      ..color = AppColors.onPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.045
      ..strokeCap = StrokeCap.round;

    // Terminal window (top-left area)
    final termRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.2, s * 0.18, s * 0.48, s * 0.42),
      Radius.circular(s * 0.06),
    );
    canvas.drawRRect(termRect, paint);

    // Terminal lines inside
    final linePaint = Paint()
      ..color = AppColors.onPrimary
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    // Line 1
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.28, s * 0.30, s * 0.16, s * 0.035),
        Radius.circular(s * 0.02),
      ),
      linePaint,
    );

    // Line 2 (dimmer)
    final dimPaint = Paint()
      ..color = AppColors.onPrimary.withOpacity(0.4)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.28, s * 0.39, s * 0.28, s * 0.035),
        Radius.circular(s * 0.02),
      ),
      dimPaint,
    );

    // Arrow badge (bottom-right)
    final badgeRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.55, s * 0.52, s * 0.27, s * 0.27),
      Radius.circular(s * 0.07),
    );
    final badgeFill = Paint()
      ..color = AppColors.onPrimary
      ..style = PaintingStyle.fill;
    canvas.drawRRect(badgeRect, badgeFill);

    // Arrow inside badge (pointing right)
    final arrowPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.035
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final cx = s * 0.685;
    final cy = s * 0.655;
    final arrowSize = s * 0.07;

    final arrowPath = Path()
      ..moveTo(cx - arrowSize, cy - arrowSize)
      ..lineTo(cx, cy)
      ..lineTo(cx - arrowSize, cy + arrowSize);
    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
