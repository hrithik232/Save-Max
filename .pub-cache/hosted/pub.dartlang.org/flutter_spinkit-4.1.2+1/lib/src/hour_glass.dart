import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SpinKitHourGlass extends StatefulWidget {
  const SpinKitHourGlass({
    Key key,
    @required this.color,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(color != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitHourGlassState createState() => _SpinKitHourGlassState();
}

class _SpinKitHourGlassState extends State<SpinKitHourGlass> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat();
    _animation = Tween(begin: 0.0, end: 8.0)
        .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 1.0, curve: Curves.easeOut)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        transform: Matrix4.identity()..rotateZ((_animation.value) * math.pi),
        alignment: FractionalOffset.center,
        child: CustomPaint(
          child: SizedBox.fromSize(size: Size.square(widget.size)),
          painter: _HourGlassPainter(color: widget.color),
        ),
      ),
    );
  }
}

class _HourGlassPainter extends CustomPainter {
  _HourGlassPainter({this.weight = 90.0, Color color})
      : _paint = Paint()
          ..color = color
          ..strokeWidth = 1.0;

  final Paint _paint;
  final double weight;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawArc(rect, 0.0, getRadian(weight), true, _paint);
    canvas.drawArc(rect, getRadian(180.0), getRadian(weight), true, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double getRadian(double angle) => math.pi / 180 * angle;
}
