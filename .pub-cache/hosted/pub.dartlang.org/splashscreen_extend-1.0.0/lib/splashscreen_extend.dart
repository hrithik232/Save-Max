library splashscreen_extend;

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  /// The Future which should deliver the [Widget] to navigate.
  final Future<dynamic> widgetToNavigateAfterFuture;

  /// The color of the background from the splash screen.
  final Color backgroundColor;

  /// The image to show as splash logo. If null, no image will be shown.
  final Image logo;

  /// Percentage size of the logo, measured on device height.
  final double logoPercentageSize;

  /// FractionalOffset where the logo should be positioned on the screen.
  final FractionalOffset logoFractionalOffset;

  /// Whether the circular progress indicator should be enabled or not.
  final bool enableProgressIndicator;

  /// Percentage size of the progress indicator, measured on device height.
  final double progressIndicatorPercentageSize;

  /// Color of the progress indicator.
  final Color progressIndicatorColor;

  /// FractionalOffset where the progress indicator should be positioned on the screen.
  final FractionalOffset progressIndicatorFractionalOffset;

  SplashScreen({
    @required this.widgetToNavigateAfterFuture,
    this.backgroundColor = Colors.white,
    this.logo,
    this.logoPercentageSize = 0.2,
    this.logoFractionalOffset = const FractionalOffset(0.5, 0.2),
    this.enableProgressIndicator = true,
    this.progressIndicatorPercentageSize = 0.06,
    this.progressIndicatorColor = Colors.white,
    this.progressIndicatorFractionalOffset = const FractionalOffset(0.5, 0.8),
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    if (this.widget.widgetToNavigateAfterFuture is! Future<Widget>) {
      throw new ArgumentError(
          'navigateAfterFuture Property must be a Future<Widget>!');
    }

    this.widget.widgetToNavigateAfterFuture.then(
          (widgetToNavigate) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => widgetToNavigate,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: this.getStackChildren(),
    );
  }

  List<Widget> getStackChildren() {
    final stackChildren = <Widget>[
      Container(
        color: this.widget.backgroundColor,
      ),
    ];

    if (this.widget.logo != null) {
      stackChildren.add(
        Align(
          alignment: this.widget.logoFractionalOffset,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight * this.widget.logoPercentageSize,
                child: this.widget.logo,
              );
            },
          ),
        ),
      );
    }

    if (this.widget.enableProgressIndicator) {
      stackChildren.add(
        Align(
          alignment: this.widget.progressIndicatorFractionalOffset,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final progressIndicatorSize = constraints.maxHeight *
                  this.widget.progressIndicatorPercentageSize;
              return Container(
                height: progressIndicatorSize,
                width: progressIndicatorSize,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    this.widget.progressIndicatorColor,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return stackChildren;
  }
}
