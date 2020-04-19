import 'package:flutter/foundation.dart';

class LinearInterpolation {
  final double begin;
  final double end;

  LinearInterpolation({
    @required this.begin,
    @required this.end,
  })  : assert(begin != null),
        assert(end != null);

  //x0 = MediaQuery.of(context).size.height * 0.23;
  //x1 = 80;
  //y0 = 0;
  //y1 = 70;
  //
  //F(x) = y0 + ((y1 - y0) / (x1 - x0)) * (x - x0);
  double interpolation(
    double x, {
    @required double begin,
    @required double end,
  }) {
    assert(begin != null);
    assert(end != null);
    return begin + ((end - begin) / (this.end - this.begin)) * (x - this.begin);
  }
}
