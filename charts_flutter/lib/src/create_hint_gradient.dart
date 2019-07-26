import 'package:flutter_web_ui/ui.dart';
import 'package:charts_common/common.dart' as common;

const double rect_top_gradient_pixels = 5;

/// Creates a bottom to top gradient that transitions [fill] to transparent.
Gradient createHintGradient(double left, double top, common.Color fill) {
  return Gradient.linear(
     Offset(left, top),
     Offset(left, top - rect_top_gradient_pixels),
    [
       Color.fromARGB(fill.a, fill.r, fill.g, fill.b),
       Color.fromARGB(0, fill.r, fill.g, fill.b)
    ],
  );
}
