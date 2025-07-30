import 'package:flutter/material.dart';

List<Color> makeSmoothHSL(Color start, Color end, int n) {
  final a = HSLColor.fromColor(start);
  final b = HSLColor.fromColor(end);
  return List<Color>.generate(n, (i) {
    final t = i / (n - 1);
    final hsl = HSLColor.lerp(a, b, t)!;
    return hsl.toColor();
  });
}
