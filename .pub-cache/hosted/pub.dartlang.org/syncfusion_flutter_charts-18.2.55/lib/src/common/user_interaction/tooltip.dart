part of charts;

/// Customizes the tooltip.
///
/// This class provides options for customizing the properties of the tooltip.
class TooltipBehavior extends ChartBehavior {
  TooltipBehavior(
      {TextStyle textStyle,
      ActivationMode activationMode,
      int animationDuration,
      bool enable,
      double opacity,
      Color borderColor,
      double borderWidth,
      double duration,
      bool shouldAlwaysShow,
      double elevation,
      bool canShowMarker,
      ChartAlignment textAlignment,
      int decimalPlaces,
      TooltipPosition tooltipPosition,
      bool shared,
      this.color,
      this.header,
      this.format,
      this.builder,
      this.shadowColor})
      : animationDuration = animationDuration ?? 350,
        textAlignment = textAlignment ?? ChartAlignment.center,
        textStyle = textStyle ?? const TextStyle(fontSize: 12),
        activationMode = activationMode ?? ActivationMode.singleTap,
        borderColor = borderColor ?? Colors.transparent,
        borderWidth = borderWidth ?? 0,
        duration = duration ?? 3000,
        enable = enable ?? false,
        opacity = opacity ?? 1,
        shouldAlwaysShow = shouldAlwaysShow ?? false,
        canShowMarker = canShowMarker ?? true,
        tooltipPosition = tooltipPosition ?? TooltipPosition.auto,
        elevation = elevation ?? 2.5,
        decimalPlaces = decimalPlaces ?? 3,
        shared = shared ?? false;

  ///Toggles the visibility of the tooltip.
  ///
  ///Defaults to `false`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true),
  ///        ));
  ///}
  ///```
  final bool enable;

  ///Color of the tooltip.
  ///
  ///Defaults to `null`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, color: Colors.yellow),
  ///        ));
  ///}
  ///```
  final Color color;

  /// Header of the tooltip. By default, the series name will be displayed in the header.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, header: 'Default'),
  ///        ));
  ///}
  ///```
  final String header;

  ///Opacity of the tooltip.
  ///
  ///The value ranges from 0 to 1.
  ///
  ///Defaults to `1`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, opacity: 0.7),
  ///        ));
  ///}
  ///```
  final double opacity;

  ///Customizes the tooltip text
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(
  ///           enable: true,
  ///            textStyle: TextStyle(color: Colors.green)),
  ///        ));
  ///}
  ///```
  final TextStyle textStyle;

  ///Specifies the number decimals to be displayed in tooltip text
  ///
  ///Defaults to `3`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(
  ///           enable: true, decimalPlaces:5),
  ///        ));
  ///}
  ///```
  final int decimalPlaces;

  _TooltipPainter _painter;

  ///Formats the tooltip text.
  ///
  ///By default, the tooltip will be rendered with x and y-values.
  ///
  ///You can add prefix or suffix to x, y, and series name values in the
  ///tooltip by formatting them.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, format: '{value}%'),
  ///        ));
  ///}
  ///```
  final String format;

  ///Duration for animating the tooltip.
  ///
  ///Defaults to `350`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, animationDuration: 1000),
  ///        ));
  ///}
  ///```
  final int animationDuration;

  ///Toggles the visibility of the marker in the tooltip.
  ///
  ///Defaults to `true`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, canShowMarker: true),
  ///        ));
  ///}
  ///```
  final bool canShowMarker;

  ///Gesture for activating the tooltip.
  ///
  ///Tooltip can be activated in tap, double tap, and long press.
  ///
  ///Defaults to `ActivationMode.tap`.
  ///
  ///Also refer [ActivationMode]
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(
  ///           enable: true,
  ///           activationMode: ActivationMode.doubleTap),
  ///        ));
  ///}
  ///```
  final ActivationMode activationMode;

  ///Border color of the tooltip.
  ///
  ///Defaults to `Colors.transparent`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, borderColor: Colors.red),
  ///        ));
  ///}
  ///```
  final Color borderColor;

  ///Border width of the tooltip.
  ///
  ///Defaults to `0`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(
  ///           enable: true,
  ///           borderWidth: 2,
  ///           borderColor: Colors.red
  ///         ),
  ///        ));
  ///}
  ///```
  final double borderWidth;

  ///Builder of the tooltip.
  ///
  ///Defaults to `null`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(
  ///           enable: true,
  ///           builder: (dynamic data, dynamic point,
  ///           dynamic series, int pointIndex, int seriesIndex) {
  ///           return Container(
  ///              height: 50,
  ///              width: 100,
  ///              decoration: const BoxDecoration(
  ///              color: Color.fromRGBO(66, 244, 164, 1)),
  ///              child: Row(
  ///              children: <Widget>[
  ///              Container(
  ///              width: 50,
  ///              child: Image.asset('images/bike.png')),],
  ///         ));
  ///         }),
  ///        ));
  ///}
  ///```
  final ChartWidgetBuilder<dynamic> builder;

  _TooltipTemplate _tooltipTemplate;

  ///Color of the tooltip shadow.
  ///
  ///Defaults to `null`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, shadowColor: Colors.green),
  ///        ));
  ///}
  ///```
  final Color shadowColor;

  ///Elevation of the tooltip.
  ///
  ///Defaults to `2.5`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, elevation: 10),
  ///        ));
  ///}
  ///```
  final double elevation;

  ///Shows or hides the tooltip.
  ///
  /// By default, the tooltip will be hidden on touch. To avoid this, set this property to true.
  ///
  ///Defaults to `false`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, shouldAlwaysShow: true),
  ///        ));
  ///}
  ///```
  final bool shouldAlwaysShow;

  ///Duration for displaying the tooltip.
  ///
  ///Defaults to `3000`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true, duration: 1000),
  ///        ));
  ///}
  ///```
  final double duration;

  ///Alignment of the text in the tooltip
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true,textAlignment : ChartAlignment.near),
  ///        ));
  ///}
  ///```
  final ChartAlignment textAlignment;

  ///Show tooltip at tapped position
  ///
  ///Defaults to `TooltipPosition.auto`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true,
  ///           tooltipPosition: TooltipPosition.pointer),
  ///        ));
  ///}
  ///```
  final TooltipPosition tooltipPosition;

  ///Share the tooltip with same index points
  ///
  ///Defaults to `false`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           tooltipBehavior: TooltipBehavior(enable: true,
  ///           shared: true),
  ///        ));
  ///}
  ///```
  final bool shared;

  _ChartTooltipRenderer _chartTooltip;

  //ignore: prefer_final_fields
  bool _isInteraction = false;

  //ignore: prefer_final_fields
  bool _isHovering = false;

  dynamic _chart;

  /// Displays the tooltip at the specified x and y-positions.
  ///
  ///
  /// * x & y - logical pixel values to position the tooltip.
  ///
  // shouldInsidePointRegion - determines if whether the given pixel values remains within point region.
  // Defaults to true.
  void showByPixel(double x, double y) {
    //, [bool shouldInsidePointRegion]) {
    final dynamic chart = _chart;
    bool isInsidePointRegion;
    if (chart is SfCartesianChart) {
      for (int i = 0;
          i < chart._chartSeries.visibleSeriesRenderers.length;
          i++) {
        final dynamic seriesRenderer =
            chart._chartSeries.visibleSeriesRenderers[i];
        if (seriesRenderer._visible &&
            seriesRenderer._series.enableTooltip &&
            seriesRenderer._regionalData != null) {
          final String seriesType = seriesRenderer._seriesType;
          final double padding = (seriesType == 'bubble' ||
                  seriesType == 'scatter' ||
                  seriesType.contains('column') ||
                  seriesType.contains('bar'))
              ? 0
              : chart.tooltipBehavior._isHovering
                  ? 0
                  : 15; // regional padding to detect smooth touch
          seriesRenderer._regionalData
              .forEach((dynamic regionRect, dynamic values) {
            final Rect region = regionRect[0];
            final Rect paddedRegion = Rect.fromLTRB(
                region.left - padding,
                region.top - padding,
                region.right + padding,
                region.bottom + padding);
            if (paddedRegion.contains(Offset(x, y))) {
              isInsidePointRegion = true;
            }
          });
        }
      }
    }
    if (_chartTooltip != null &&
        activationMode != ActivationMode.none &&
        x != null &&
        y != null) {
      final _ChartTooltipRendererState tooltipState = _chartTooltip?.state;
      if (!(chart is SfCartesianChart) ||
          _isInteraction ||
          (isInsidePointRegion ?? false)) {
        tooltipState?._needMarker = true;
        tooltipState?._showTooltip(x, y);
      } else if (_chartTooltip.chartWidget.tooltipBehavior._painter != null) {
        tooltipState?.show = true;
        tooltipState?._needMarker = false;
        _chartTooltip.chartWidget.tooltipBehavior._painter
            ._showChartAreaTooltip(
                Offset(x, y), chart.primaryXAxis, chart.primaryYAxis);
      }
    }
    if (chart is SfCartesianChart &&
        chart.tooltipBehavior._tooltipTemplate != null &&
        x != null &&
        y != null) {
      _showTemplateTooltip(Offset(x, y));
    }
    if (chart?.tooltipBehavior != null) {
      chart.tooltipBehavior._isInteraction = false;
    }
  }

  /// Displays the tooltip at the specified x and y-values.
  ///
  ///
  /// *x & y - x & y point values at which the tooltip needs to be shown.
  ///
// shouldInsidePointRegion - determines if whether the given pixel values remains within point region.
// Defaults to true.
  ///
  /// * xAxisName - name of the x axis the given point must be bind to.
  ///
  /// * yAxisName - name of the y axis the given point must be bind to.
  void show(dynamic x, double y, [String xAxisName, String yAxisName]) {
    final SfCartesianChart chart = _chart;
    bool isInsidePointRegion = false;
    ChartAxis xAxis, yAxis;
    if (xAxisName != null && yAxisName != null)
      for (ChartAxis axis in chart._chartAxis._axisCollections) {
        if (axis._name == xAxisName)
          xAxis = axis;
        else if (axis._name == yAxisName) {
          yAxis = axis;
        }
      }
    else {
      xAxis = chart.primaryXAxis;
      yAxis = chart.primaryYAxis;
    }
    final _ChartLocation position = _calculatePoint(
        x is DateTime ? x.millisecondsSinceEpoch : x,
        y,
        xAxis,
        yAxis,
        chart._requireInvertedAxis,
        null,
        chart._chartAxis._axisClipRect);
    for (int i = 0; i < chart._chartSeries.visibleSeriesRenderers.length; i++) {
      final dynamic seriesRenderer =
          chart._chartSeries.visibleSeriesRenderers[i];
      if (seriesRenderer._visible &&
          seriesRenderer._series.enableTooltip &&
          seriesRenderer._regionalData != null) {
        final double padding = (seriesRenderer._seriesType == 'bubble' ||
                seriesRenderer._seriesType == 'scatter' ||
                seriesRenderer._seriesType.contains('column') ||
                seriesRenderer._seriesType.contains('bar'))
            ? 0
            : 15; // regional padding to detect smooth touch
        seriesRenderer._regionalData
            .forEach((dynamic regionRect, dynamic values) {
          final Rect region = regionRect[0];
          final Rect paddedRegion = Rect.fromLTRB(
              region.left - padding,
              region.top - padding,
              region.right + padding,
              region.bottom + padding);
          if (paddedRegion.contains(Offset(position.x, position.y)))
            isInsidePointRegion = true;
        });
      }
    }
    if (chart.tooltipBehavior._tooltipTemplate == null) {
      final _ChartTooltipRendererState tooltipState = _chartTooltip?.state;
      if (isInsidePointRegion ?? false) {
        tooltipState?._needMarker = true;
        tooltipState?._showTooltip(position.x, position.y);
      } else {
        //to show tooltip when the position is out of point region
        tooltipState?.show = true;
        tooltipState?._needMarker = false;
        chart.tooltipBehavior._painter._showChartAreaTooltip(
            Offset(position.x, position.y), xAxis, yAxis);
      }
    } else if (chart.tooltipBehavior._tooltipTemplate != null &&
        position != null) {
      _showTemplateTooltip(Offset(position.x, position.y), x, y);
    }
  }

  /// Displays the tooltip at the specified series and point index.
  ///
  /// * seriesIndex - index of the series for which the pointIndex is specified
  ///
  /// * pointIndex - index of the point for which the tooltip should be shown
  void showByIndex(int seriesIndex, int pointIndex) {
    dynamic x, y;
    final dynamic chart = _chart;
    if (chart is SfCartesianChart) {
      if (_validIndex(pointIndex, seriesIndex, chart)) {
        final CartesianSeriesRenderer cSeriesRenderer =
            chart._chartSeries.visibleSeriesRenderers[seriesIndex];
        if (cSeriesRenderer._visible) {
          x = cSeriesRenderer._dataPoints[pointIndex].markerPoint.x;
          y = cSeriesRenderer._dataPoints[pointIndex].markerPoint.y;
        }
      }
      if (x != null && y != null && chart.series[seriesIndex].enableTooltip) {
        if (chart.tooltipBehavior.builder != null) {
          _showTemplateTooltip(Offset(x, y));
        } else if (chart.series[seriesIndex].enableTooltip) {
          _chartTooltip?.state?._showTooltip(x, y);
        }
      }
    } else if (chart is SfCircularChart) {
      if (chart.tooltipBehavior.builder != null &&
          seriesIndex < chart.series.length &&
          pointIndex <
              chart._chartSeries.visibleSeriesRenderers[seriesIndex]._dataPoints
                  .length &&
          chart.series[seriesIndex].enableTooltip) {
        //to show the tooltip template when the provided indices are valid
        chart._circularArea
            ._showCircularTooltipTemplate(seriesIndex, pointIndex);
      } else if (chart.tooltipBehavior.builder == null) {
        final ChartPoint<dynamic> chartPoint = chart._chartSeries
            .visibleSeriesRenderers[seriesIndex]._renderPoints[pointIndex];
        if (chartPoint.isVisible) {
          final Offset position = _degreeToPoint(
              chartPoint.midAngle,
              (chartPoint.innerRadius + chartPoint.outerRadius) / 2,
              chartPoint.center);
          x = position.dx;
          y = position.dy;
          _chartTooltip?.state?._showTooltip(x, y);
        }
      }
    } else if (pointIndex != null &&
        pointIndex <
            chart._chartSeries.visibleSeriesRenderers[0]._dataPoints.length) {
      //this shows the tooltip for triangular type of charts (funnerl and pyramid)
      if (chart.tooltipBehavior.builder == null) {
        chart._chartState._tooltipPointIndex = pointIndex;
        final Offset position = chart._chartSeries.visibleSeriesRenderers[0]
            ._renderPoints[pointIndex].region?.center;
        x = position?.dx;
        y = position?.dy;
        _chartTooltip?.state?._showTooltip(x, y);
      } else {
        if (chart is SfFunnelChart) {
          chart._funnelplotArea._showFunnelTooltipTemplate(pointIndex);
        } else if (chart is SfPyramidChart) {
          chart._chartPlotArea._showPyramidTooltipTemplate(pointIndex);
        }
      }
    }
  }

  void _showTemplateTooltip(Offset position, [dynamic xValue, dynamic yValue]) {
    final dynamic chart = _chart;
    dynamic series;
    _tooltipTemplate?._alwaysShow = shouldAlwaysShow;
    if (chart._chartAxis._axisClipRect.contains(position)) {
      int seriesIndex, pointIndex;
      bool isTooltipRegion = false;
      if (!_isHovering) {
        //assingning null for the previous and current tooltip values in case of mouse not hovering
        _tooltipTemplate?.state?.prevTooltipValue = null;
        _tooltipTemplate?.state?.currentTooltipValue = null;
      }
      for (int i = 0;
          i < chart._chartSeries.visibleSeriesRenderers.length;
          i++) {
        final CartesianSeriesRenderer seriesRenderer =
            chart._chartSeries.visibleSeriesRenderers[i];
        series = seriesRenderer._series;

        int j = 0;
        final double padding = (series.runtimeType.toString().contains('Bar') ||
                    series.runtimeType.toString().contains('Column')) ||
                _isHovering
            ? 0
            : 15;
        if (seriesRenderer._visible &&
            series.enableTooltip &&
            seriesRenderer._regionalData != null) {
          seriesRenderer._regionalData
              .forEach((dynamic regionRect, dynamic values) {
            final Rect region = regionRect[0];
            final double left = region.left - padding;
            final double right = region.right + padding;
            final double top = region.top - padding;
            final double bottom = region.bottom + padding;
            final Rect paddedRegion = Rect.fromLTRB(left, top, right, bottom);
            if (paddedRegion.contains(position)) {
              seriesIndex = i;
              pointIndex = seriesRenderer._dataPoints.indexOf(regionRect[4]);
              final Offset tooltipPosition = regionRect[1];
              _tooltipTemplate.rect = Rect.fromLTWH(
                  tooltipPosition.dx,
                  tooltipPosition.dy - padding / 2,
                  region.width,
                  region.height);
              _tooltipTemplate.template = chart.tooltipBehavior.builder(
                  series.dataSource[j], regionRect[4], series, pointIndex, i);
              isTooltipRegion = true;
            }
            j++;
          });
          if (chart.tooltipBehavior._isHovering && isTooltipRegion) {
            _tooltipTemplate.state.prevTooltipValue =
                _tooltipTemplate.state.currentTooltipValue;
            _tooltipTemplate.state.currentTooltipValue =
                TooltipValue(seriesIndex, pointIndex);
          }
          _tooltipTemplate.show = isTooltipRegion;
          _tooltipTemplate?.state?._performTooltip();
        }
      }
      if (!isTooltipRegion && !_isInteraction && chart.series.isNotEmpty) {
        //to show tooltip temlate when the position resides outside point region
        final dynamic x = xValue ??
            _pointToXValue(
                chart,
                chart.primaryXAxis,
                chart.primaryXAxis._bounds,
                position.dx -
                    (chart._chartAxis._axisClipRect.left +
                        chart.primaryXAxis.plotOffset),
                position.dy -
                    (chart._chartAxis._axisClipRect.top +
                        chart.primaryXAxis.plotOffset));
        final dynamic y = yValue ??
            _pointToYValue(
                chart,
                chart.primaryYAxis,
                chart.primaryYAxis._bounds,
                position.dx -
                    (chart._chartAxis._axisClipRect.left +
                        chart.primaryYAxis.plotOffset),
                position.dy -
                    (chart._chartAxis._axisClipRect.top +
                        chart.primaryYAxis.plotOffset));
        chart.tooltipBehavior._tooltipTemplate.rect =
            Rect.fromLTWH(position.dx, position.dy, 1, 1);
        _tooltipTemplate.template = chart.tooltipBehavior.builder(
            null, CartesianChartPoint<dynamic>(x, y), null, null, null);
        isTooltipRegion = true;
        _tooltipTemplate.show = isTooltipRegion;
        _tooltipTemplate?.state?._performTooltip();
      }
      if (!isTooltipRegion) {
        _tooltipTemplate?.state?.hideOnTimer();
      }
    }
    chart.tooltipBehavior._isInteraction = false;
  }

  /// Hides the tooltip if it is displayed.
  void hide() {
    if (builder != null) {
      //hides tooltip template
      _tooltipTemplate?.show = false;
      //ignore: invalid_use_of_protected_member
      _tooltipTemplate?.state?.setState(() {});
    } else {
      //hides default tooltip
      _chartTooltip?.state?.show = false;
      _painter?.currentTooltipValue = _painter?.prevTooltipValue = null;
      _chartTooltip?.state?.tooltipRepaintNotifier?.value++;
      _painter?.canResetPath = true;
    }
  }

  /// Hides the Mouse tooltip if it is displayed.
  void _hideMouseTooltip() => _painter?.hide();

  /// Draws tooltip
  ///
  /// * canvas -Canvas used to draw tooltip
  @override
  void onPaint(Canvas canvas) {
    if (_painter != null) {
      _painter._renderTooltip(canvas);
    }
  }

  /// Performs the double-tap action of appropriate point.
  ///
  /// Hits while double tapping on the chart.
  /// * xPos - X value of the touch position.
  /// * yPos - Y value of the touch position.
  @override
  void onDoubleTap(double xPos, double yPos) => showByPixel(xPos, yPos);

  /// Performs the double-tap action of appropriate point.
  ///
  /// Hits while a long tap on the chart.
  ///
  /// * xPos - X value of the touch position.
  /// * yPos - Y value of the touch position.
  @override
  void onLongPress(double xPos, double yPos) => showByPixel(xPos, yPos);

  /// Performs the touch-down action of appropriate point.
  ///
  /// Hits while tapping on the chart.
  ///
  /// * xPos - X value of the touch position.
  /// * yPos - Y value of the touch position.
  @override
  void onTouchDown(double xPos, double yPos) => showByPixel(xPos, yPos);

  /// Performs the touch move action of chart.
  ///
  /// Hits while tap and moving on the chart.
  ///
  /// * xPos - X value of the touch position.
  /// *  yPos - Y value of the touch position.
  @override
  void onTouchMove(double xPos, double yPos) {
    // Not valid for tooltip
  }

  /// Performs the touch move action of chart.
  ///
  /// Hits while release tap on the chart.
  ///
  /// * xPos - X value of the touch position.
  /// * yPos - Y value of the touch position.
  @override
  void onTouchUp(double xPos, double yPos) => showByPixel(xPos, yPos);

  /// Performs the mouse hover action of chart.
  ///
  /// Hits while enter tap on the chart.
  ///
  /// * xPos - X value of the touch position.
  /// * yPos - Y value of the touch position.
  @override
  void onEnter(double xPos, double yPos) => showByPixel(xPos, yPos);

  /// Performs the mouse exit action of chart.
  ///
  /// Hits while exit tap on the chart.
  ///
  /// * xPos - X value of the touch position.
  /// * yPos - Y value of the touch position.
  @override
  void onExit(double xPos, double yPos) {
    if (_painter != null) {
      _hideMouseTooltip();
    } else if (_tooltipTemplate != null) {
      //ignore: unused_local_variable
      final Timer t = Timer(Duration(milliseconds: duration.toInt()),
          _tooltipTemplate.state.hideTooltipTemplate);
    }
  }
}
