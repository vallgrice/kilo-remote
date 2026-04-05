// Generates the Kilo Remote app icon as a 1024x1024 PNG.
// Run: dart run tool/generate_icon.dart

import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as img;

// Colors
const _primaryR = 0xD4, _primaryG = 0xA5, _primaryB = 0x74;
const _darkR = 0xB8, _darkG = 0x95, _darkB = 0x6A;
const _fgR = 0x1F, _fgG = 0x29, _fgB = 0x37;

const _size = 1024;
const _cornerRadius = 282.0; // ~27.5% of 1024

void main() {
  final image = img.Image(width: _size, height: _size);

  // 1. Draw gradient background with rounded corners
  _drawGradientRoundedRect(image, 0, 0, _size, _size, _cornerRadius);

  // 2. Terminal window outline (top-left area)
  final termX = (_size * 0.20).round();
  final termY = (_size * 0.18).round();
  final termW = (_size * 0.48).round();
  final termH = (_size * 0.42).round();
  final termR = (_size * 0.06).round().toDouble();
  final termStroke = (_size * 0.045).round().toDouble();
  _drawRoundedRectOutline(image, termX, termY, termW, termH, termR, termStroke, _fgR, _fgG, _fgB);

  // 3. Terminal lines inside
  // Line 1 (solid)
  final l1x = (_size * 0.28).round();
  final l1y = (_size * 0.30).round();
  final l1w = (_size * 0.16).round();
  final l1h = (_size * 0.035).round();
  final lineR = (_size * 0.017).round().toDouble();
  _drawFilledRoundedRect(image, l1x, l1y, l1w, l1h, lineR, _fgR, _fgG, _fgB, 255);

  // Line 2 (dimmer)
  final l2x = (_size * 0.28).round();
  final l2y = (_size * 0.39).round();
  final l2w = (_size * 0.28).round();
  final l2h = (_size * 0.035).round();
  _drawFilledRoundedRect(image, l2x, l2y, l2w, l2h, lineR, _fgR, _fgG, _fgB, 102); // 40% opacity

  // 4. Arrow badge (bottom-right, filled)
  final bx = (_size * 0.55).round();
  final by = (_size * 0.52).round();
  final bw = (_size * 0.27).round();
  final bh = (_size * 0.27).round();
  final bR = (_size * 0.07).round().toDouble();
  _drawFilledRoundedRect(image, bx, by, bw, bh, bR, _fgR, _fgG, _fgB, 255);

  // 5. Arrow chevron inside badge (pointing right)
  final cx = _size * 0.685;
  final cy = _size * 0.655;
  final arrowSize = _size * 0.07;
  final arrowStroke = (_size * 0.04).toDouble();
  _drawChevron(image, cx, cy, arrowSize, arrowStroke);

  // Save
  final outDir = Directory('assets/icon');
  if (!outDir.existsSync()) outDir.createSync(recursive: true);

  final outPath = 'assets/icon/app_icon.png';
  File(outPath).writeAsBytesSync(img.encodePng(image));
  print('Icon saved to $outPath (${_size}x$_size)');

  // Also create foreground-only version (transparent bg)
  final fg = img.Image(width: _size, height: _size);
  _drawRoundedRectOutline(fg, termX, termY, termW, termH, termR, termStroke, _fgR, _fgG, _fgB);
  _drawFilledRoundedRect(fg, l1x, l1y, l1w, l1h, lineR, _fgR, _fgG, _fgB, 255);
  _drawFilledRoundedRect(fg, l2x, l2y, l2w, l2h, lineR, _fgR, _fgG, _fgB, 102);
  _drawFilledRoundedRect(fg, bx, by, bw, bh, bR, _fgR, _fgG, _fgB, 255);
  _drawChevron(fg, cx, cy, arrowSize, arrowStroke);

  final fgPath = 'assets/icon/app_icon_foreground.png';
  File(fgPath).writeAsBytesSync(img.encodePng(fg));
  print('Foreground saved to $fgPath');
}

/// Draws a gradient-filled rounded rectangle as the icon background.
void _drawGradientRoundedRect(img.Image image, int x, int y, int w, int h, double radius) {
  for (var py = y; py < y + h; py++) {
    for (var px = x; px < x + w; px++) {
      final dist = _roundedRectSDF(px.toDouble(), py.toDouble(),
          x.toDouble(), y.toDouble(), w.toDouble(), h.toDouble(), radius);

      if (dist < 1.0) {
        // Gradient: top-left to bottom-right
        final t = ((px - x) + (py - y)) / (w + h - 2);
        final r = _lerp(_primaryR, _darkR, t);
        final g = _lerp(_primaryG, _darkG, t);
        final b = _lerp(_primaryB, _darkB, t);

        // Anti-alias at edges
        final alpha = dist < 0 ? 255 : (255 * (1.0 - dist)).round().clamp(0, 255);

        if (alpha > 0) {
          image.setPixelRgba(px, py, r, g, b, alpha);
        }
      }
    }
  }
}

/// Draws a filled rounded rectangle.
void _drawFilledRoundedRect(img.Image image, int x, int y, int w, int h,
    double radius, int r, int g, int b, int alpha) {
  for (var py = y - 2; py < y + h + 2; py++) {
    for (var px = x - 2; px < x + w + 2; px++) {
      if (px < 0 || py < 0 || px >= _size || py >= _size) continue;

      final dist = _roundedRectSDF(px.toDouble(), py.toDouble(),
          x.toDouble(), y.toDouble(), w.toDouble(), h.toDouble(), radius);

      if (dist < 1.0) {
        final a = dist < 0 ? alpha : (alpha * (1.0 - dist)).round().clamp(0, 255);
        if (a > 0) {
          _blendPixel(image, px, py, r, g, b, a);
        }
      }
    }
  }
}

/// Draws a rounded rectangle outline (stroke).
void _drawRoundedRectOutline(img.Image image, int x, int y, int w, int h,
    double radius, double strokeWidth, int r, int g, int b) {
  final halfStroke = strokeWidth / 2;
  final expand = (strokeWidth + 2).ceil();

  for (var py = y - expand; py < y + h + expand; py++) {
    for (var px = x - expand; px < x + w + expand; px++) {
      if (px < 0 || py < 0 || px >= _size || py >= _size) continue;

      final dist = _roundedRectSDF(px.toDouble(), py.toDouble(),
          x.toDouble(), y.toDouble(), w.toDouble(), h.toDouble(), radius);

      // Distance from the border line itself
      final borderDist = (dist.abs() - halfStroke).abs();
      final isNearBorder = dist.abs() < halfStroke + 1.0;

      if (isNearBorder) {
        final alpha = borderDist < halfStroke
            ? 255
            : (255 * (1.0 - (borderDist - halfStroke))).round().clamp(0, 255);
        if (alpha > 0) {
          _blendPixel(image, px, py, r, g, b, alpha);
        }
      }
    }
  }
}

/// Draws a right-pointing chevron arrow.
void _drawChevron(img.Image image, double cx, double cy, double size, double strokeWidth) {
  // Draw the chevron as two thick lines: (cx-size, cy-size)->(cx, cy) and (cx, cy)->(cx-size, cy+size)
  // Using bronze color on dark badge
  _drawThickLine(image, cx - size, cy - size, cx, cy, strokeWidth, _primaryR, _primaryG, _primaryB);
  _drawThickLine(image, cx, cy, cx - size, cy + size, strokeWidth, _primaryR, _primaryG, _primaryB);
}

/// Draws a thick anti-aliased line.
void _drawThickLine(img.Image image, double x1, double y1, double x2, double y2,
    double thickness, int r, int g, int b) {
  final halfThick = thickness / 2;
  final minX = min(x1, x2).floor() - halfThick.ceil() - 1;
  final maxX = max(x1, x2).ceil() + halfThick.ceil() + 1;
  final minY = min(y1, y2).floor() - halfThick.ceil() - 1;
  final maxY = max(y1, y2).ceil() + halfThick.ceil() + 1;

  final dx = x2 - x1;
  final dy = y2 - y1;
  final len = sqrt(dx * dx + dy * dy);
  if (len == 0) return;

  // Normal to the line
  final nx = -dy / len;
  final ny = dx / len;

  for (var py = minY; py <= maxY; py++) {
    for (var px = minX; px <= maxX; px++) {
      if (px < 0 || py < 0 || px >= _size || py >= _size) continue;

      // Distance from point to line segment
      final dist = _distToSegment(px.toDouble(), py.toDouble(), x1, y1, x2, y2);

      if (dist < halfThick + 1.0) {
        final alpha = dist < halfThick
            ? 255
            : (255 * (1.0 - (dist - halfThick))).round().clamp(0, 255);
        if (alpha > 0) {
          _blendPixel(image, px, py, r, g, b, alpha);
        }
      }
    }
  }
}

/// Signed distance field for a rounded rectangle.
/// Returns negative inside, positive outside, ~0 at border.
double _roundedRectSDF(double px, double py, double rx, double ry, double rw, double rh, double radius) {
  final cx = rx + rw / 2;
  final cy = ry + rh / 2;
  final halfW = rw / 2;
  final halfH = rh / 2;

  final dx = (px - cx).abs() - halfW + radius;
  final dy = (py - cy).abs() - halfH + radius;

  final outside = sqrt(max(dx, 0) * max(dx, 0) + max(dy, 0) * max(dy, 0)) - radius;
  final inside = min(max(dx, dy), 0.0) - radius;

  // Negative = inside, positive = outside
  return outside + inside + radius;
}

/// Distance from point to line segment.
double _distToSegment(double px, double py, double x1, double y1, double x2, double y2) {
  final dx = x2 - x1;
  final dy = y2 - y1;
  final lenSq = dx * dx + dy * dy;

  var t = ((px - x1) * dx + (py - y1) * dy) / lenSq;
  t = t.clamp(0.0, 1.0);

  final nearX = x1 + t * dx;
  final nearY = y1 + t * dy;

  final distX = px - nearX;
  final distY = py - nearY;
  return sqrt(distX * distX + distY * distY);
}

/// Blend a pixel with alpha onto existing content.
void _blendPixel(img.Image image, int x, int y, int r, int g, int b, int a) {
  if (a <= 0) return;
  final existing = image.getPixel(x, y);
  final ea = existing.a.toInt();

  if (ea == 0 || a == 255) {
    image.setPixelRgba(x, y, r, g, b, a);
    return;
  }

  final srcA = a / 255.0;
  final dstA = ea / 255.0;
  final outA = srcA + dstA * (1 - srcA);

  if (outA == 0) return;

  final outR = ((r * srcA + existing.r.toInt() * dstA * (1 - srcA)) / outA).round();
  final outG = ((g * srcA + existing.g.toInt() * dstA * (1 - srcA)) / outA).round();
  final outB = ((b * srcA + existing.b.toInt() * dstA * (1 - srcA)) / outA).round();

  image.setPixelRgba(x, y, outR, outG, outB, (outA * 255).round());
}

int _lerp(int a, int b, double t) => (a + (b - a) * t).round().clamp(0, 255);
