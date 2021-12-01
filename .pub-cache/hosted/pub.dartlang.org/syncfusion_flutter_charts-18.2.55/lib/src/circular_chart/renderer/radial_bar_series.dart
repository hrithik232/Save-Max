part of charts;

/// Renders the radial bar series.
///
/// The radial bar chart is used for showing the comparisons among the categories using the circular shapes.
/// To render a radial bar chart, create an instance of RadialBarSeries, and add to the series collection property of [SfCircularChart].
///
///Provides options to customize the [maximumValue], [trackColor], [trackBorderColor], [trackBorderWidth], [trackOpacity]
///and [useSeriesColor] of the pie segments.
class RadialBarSeries<T, D> extends CircularSeries<T, D> {
  RadialBarSeries(
      {ValueKey<String> key,
      ChartSeriesRendererFactory<T, D> onCreateRenderer,
      CircularSeriesRendererCreatedCallback onRendererCreated,
      List<T> dataSource,
      ChartValueMapper<T, D> xValueMapper,
      ChartValueMapper<T, num> yValueMapper,
      ChartValueMapper<T, Color> pointColorMapper,
      ChartValueMapper<T, String> pointRadiusMapper,
      ChartValueMapper<T, String> dataLabelMapper,
      ChartValueMapper<T, String> sortFieldValueMapper,
      this.trackColor = const Color.fromRGBO(234, 236, 239, 1.0),
      this.trackBorderWidth = 0.0,
      this.trackOpacity = 1,
      this.useSeriesColor = false,
      this.trackBorderColor = Colors.transparent,
      this.maximumValue,
      DataLabelSettings dataLabelSettings,
      String radius,
      String innerRadius,
      String gap,
      double strokeWidth,
      double opacity,
      Color strokeColor,
      bool enableTooltip,
      bool enableSmartLabels,
      String name,
      double animationDuration,
      SelectionSettings selectionSettings,
      SortingOrder sortingOrder,
      LegendIconType legendIconType,
      CornerStyle cornerStyle,
      List<int> initialSelectedDataIndexes})
      : super(
          key: key,
          onCreateRenderer: onCreateRenderer,
          onRendererCreated: onRendererCreated,
          dataSource: dataSource,
          animationDuration: animationDuration,
          xValueMapper: (int index) => xValueMapper(dataSource[index], index),
          yValueMapper: (int index) => yValueMapper(dataSource[index], index),
          pointColorMapper: (int index) => pointColorMapper != null
              ? pointColorMapper(dataSource[index], index)
              : null,
          pointRadiusMapper: (int index) => pointRadiusMapper != null
              ? pointRadiusMapper(dataSource[index], index)
              : null,
          dataLabelMapper: (int index) => dataLabelMapper != null
              ? dataLabelMapper(dataSource[index], index)
              : null,
          sortFieldValueMapper: sortFieldValueMapper != null
              ? (int index) => sortFieldValueMapper(dataSource[index], index)
              : null,
          radius: radius,
          innerRadius: innerRadius,
          gap: gap,
          borderColor: strokeColor,
          borderWidth: strokeWidth,
          opacity: opacity,
          enableTooltip: enableTooltip,
          dataLabelSettings: dataLabelSettings,
          name: name,
          selectionSettings: selectionSettings,
          sortingOrder: sortingOrder,
          legendIconType: legendIconType,
          enableSmartLabels: enableSmartLabels,
          cornerStyle: cornerStyle,
          initialSelectedDataIndexes: initialSelectedDataIndexes,
        );

  ///Color of the track
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            series: <RadialBarSeries<ChartData, String>>[
  ///                RadialBarSeries<ChartData, String>(
  ///                  trackColor: Colors.red,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final Color trackColor;

  ///Specifies the maximum value of the radial bar.
  ///
  /// By default, the sum of the data points values will be considered as maximum value.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            series: <RadialBarSeries<ChartData, String>>[
  ///                RadialBarSeries<ChartData, String>(
  ///                  maximumValue: 100,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final double maximumValue;

  ///Border color of the track
  ///
  ///Defaults to `colors.Transparent`.
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            series: <RadialBarSeries<ChartData, String>>[
  ///                RadialBarSeries<ChartData, String>(
  ///                  trackBorderColor: Colors.red,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final Color trackBorderColor;

  ///Border width of the track
  ///
  ///Defaults to `0.0`.
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            series: <RadialBarSeries<ChartData, String>>[
  ///                RadialBarSeries<ChartData, String>(
  ///                  trackBorderColor: Colors.red,
  ///                  trackBorderWidth: 2,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final double trackBorderWidth;

  ///Opacity of the track
  ///
  ///Defaults to `1`.
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            series: <RadialBarSeries<ChartData, String>>[
  ///                RadialBarSeries<ChartData, String>(
  ///                  trackOpacity: 0.2,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final double trackOpacity;

  ///Uses the point color for filling the track
  ///
  ///Defaults to `false`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            series: <RadialBarSeries<ChartData, String>>[
  ///                RadialBarSeries<ChartData, String>(
  ///                  useSeriesColor:true
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final bool useSeriesColor;

  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            series: <RadialBarSeries<ChartData, String>>[
  ///                RadialBarSeries<ChartData, String>(
  ///                  useSeriesColor:true
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```

// Create the  Radial bar series renderer.
  RadialBarSeriesRenderer createRenderer(CircularSeries<T, D> series) {
    RadialBarSeriesRenderer seriesRenderer;
    if (onCreateRenderer != null) {
      seriesRenderer = onCreateRenderer(series);
      assert(seriesRenderer != null,
          'This onCreateRenderer callback function should return value as extends from ChartSeriesRenderer class and should not be return value as null');
      return seriesRenderer;
    }
    return RadialBarSeriesRenderer();
  }
}

class _RadialBarPainter extends CustomPainter {
  _RadialBarPainter({
    this.chart,
    this.index,
    this.isRepaint,
    this.animationController,
    this.seriesAnimation,
    ValueNotifier<num> notifier,
  }) : super(repaint: notifier);
  final SfCircularChart chart;
  final int index;
  final bool isRepaint;
  final AnimationController animationController;
  final Animation<double> seriesAnimation;
  RadialBarSeriesRenderer seriesRenderer;

  @override
  void paint(Canvas canvas, Size size) {
    num pointStartAngle, pointEndAngle, degree, length = 0;
    seriesRenderer = chart._chartSeries.visibleSeriesRenderers[index];
    seriesRenderer._pointRegions = <_Region>[];
    final _SfCircularChartState chartState = chart._chartState;
    final num sum = seriesRenderer._sumOfPoints,
        actualStartAngle = seriesRenderer._start;
    seriesRenderer._innerRadius = seriesRenderer._currentInnerRadius;
    seriesRenderer._radius = seriesRenderer._currentRadius;
    ChartPoint<dynamic> point, _oldPoint;
    seriesRenderer._center = seriesRenderer._center;
    canvas.clipRect(chartState.chartAreaRect);

    /// finding visible points count
    for (int i = 0; i < seriesRenderer._renderPoints.length; i++) {
      length += seriesRenderer._renderPoints[i].isVisible ? 1 : 0;
    }

    /// finding first visible point
    final int firstVisible =
        seriesRenderer._getFirstVisiblePointIndex(seriesRenderer);
    final num ringSize =
        (seriesRenderer._currentRadius - seriesRenderer._currentInnerRadius)
                .abs() /
            length;
    final num gap = _percentToValue(
        seriesRenderer._series.gap,
        (seriesRenderer._currentRadius - seriesRenderer._currentInnerRadius)
            .abs());
    final num animationValue =
        seriesAnimation != null ? seriesAnimation.value : 1;
    final bool isLegendToggle = chartState._isLegendToggled;
    final RadialBarSeriesRenderer oldSeriesRenderer =
        (chartState.widgetNeedUpdate &&
                !chartState._isLegendToggled &&
                chartState.prevSeriesRenderer._seriesType == 'radialbar')
            ? chartState.prevSeriesRenderer
            : null;
    for (int i = 0; i < seriesRenderer._renderPoints.length; i++) {
      point = seriesRenderer._renderPoints[i];
      RadialBarSeries<dynamic, dynamic> series;
      if (seriesRenderer._series is RadialBarSeries) {
        series = seriesRenderer._series;
      }
      _oldPoint = (oldSeriesRenderer != null &&
              (oldSeriesRenderer._oldRenderPoints.length - 1 >= i))
          ? oldSeriesRenderer._oldRenderPoints[i]
          : (isLegendToggle ? chartState._oldPoints[i] : null);
      pointStartAngle = actualStartAngle;
      final bool isDynamicUpdate = _oldPoint != null;
      bool hide = false;
      num oldStart, oldEnd, oldRadius, oldInnerRadius, value;
      if (!isDynamicUpdate ||
          ((_oldPoint.isVisible && point.isVisible) ||
              (_oldPoint.isVisible && !point.isVisible) ||
              (!_oldPoint.isVisible && point.isVisible))) {
        if (point.isVisible) {
          hide = false;
          if (isDynamicUpdate && !isLegendToggle) {
            value = (point.y > _oldPoint.y)
                ? _oldPoint.y + (point.y - _oldPoint.y) * animationValue
                : _oldPoint.y - (_oldPoint.y - point.y) * animationValue;
          }
          degree = (value != null ? value : point.y).abs() /
              (series.maximumValue ?? sum);
          degree = (degree > 1 ? 1 : degree) * (360 - 0.001);
          degree = isDynamicUpdate ? degree : degree * animationValue;
          pointEndAngle = pointStartAngle + degree;
          point.midAngle = (pointStartAngle + pointEndAngle) / 2;
          point.startAngle = pointStartAngle;
          point.endAngle = pointEndAngle;
          point.center = seriesRenderer._center;
          point.innerRadius = seriesRenderer._innerRadius =
              seriesRenderer._innerRadius +
                  ((i == firstVisible) ? 0 : ringSize);
          point.outerRadius = seriesRenderer._radius =
              ringSize < gap ? 0 : seriesRenderer._innerRadius + ringSize - gap;
          if (isLegendToggle) {
            seriesRenderer._calculateVisiblePointLegendToggleAnimation(
                point, _oldPoint, i, animationValue);
          }
        } //animate on hiding
        else if (isLegendToggle && !point.isVisible && _oldPoint.isVisible) {
          hide = true;
          oldEnd = _oldPoint.endAngle;
          oldStart = _oldPoint.startAngle;
          degree = _oldPoint.y.abs() / (series.maximumValue ?? sum);
          degree = (degree > 1 ? 1 : degree) * (360 - 0.001);
          oldInnerRadius = _oldPoint.innerRadius +
              ((_oldPoint.outerRadius + _oldPoint.innerRadius) / 2 -
                      _oldPoint.innerRadius) *
                  animationValue;
          oldRadius = _oldPoint.outerRadius -
              (_oldPoint.outerRadius -
                      (_oldPoint.outerRadius + _oldPoint.innerRadius) / 2) *
                  animationValue;
        }
        if (seriesRenderer is RadialBarSeriesRenderer) {
          seriesRenderer._drawDataPoint(
              point,
              degree,
              pointStartAngle,
              pointEndAngle,
              seriesRenderer,
              hide,
              oldRadius,
              oldInnerRadius,
              _oldPoint,
              oldStart,
              oldEnd,
              i,
              canvas,
              index,
              chart);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => isRepaint;
}

/// Creates series renderer for RadialBar series
class RadialBarSeriesRenderer extends CircularSeriesRenderer {
  RadialBarSeriesRenderer();

  CircularSeries<dynamic, dynamic> _series;

  num _innerRadius;

  num _radius;

  Offset _center;

  /// finding first visible point
  int _getFirstVisiblePointIndex(RadialBarSeriesRenderer seriesRenderer) {
    for (int i = 0; i < seriesRenderer._renderPoints.length; i++) {
      if (seriesRenderer._renderPoints[i].isVisible) {
        return i;
      }
    }
    return null;
  }

  void _calculateVisiblePointLegendToggleAnimation(ChartPoint<dynamic> point,
      ChartPoint<dynamic> _oldPoint, int i, num animationValue) {
    if (!_oldPoint.isVisible && point.isVisible) {
      _radius = i == 0
          ? point.outerRadius
          : (point.innerRadius +
              (point.outerRadius - point.innerRadius) * animationValue);
      _innerRadius = i == 0
          ? (point.outerRadius -
              (point.outerRadius - point.innerRadius) * animationValue)
          : _innerRadius;
    } else {
      _radius = (point.outerRadius > _oldPoint.outerRadius)
          ? _oldPoint.outerRadius +
              (point.outerRadius - _oldPoint.outerRadius) * animationValue
          : _oldPoint.outerRadius -
              (_oldPoint.outerRadius - point.outerRadius) * animationValue;
      _innerRadius = (point.innerRadius > _oldPoint.innerRadius)
          ? _oldPoint.innerRadius +
              (point.innerRadius - _oldPoint.innerRadius) * animationValue
          : _oldPoint.innerRadius -
              (_oldPoint.innerRadius - point.innerRadius) * animationValue;
    }
  }

  void _drawDataPoint(
      ChartPoint<dynamic> point,
      num degree,
      num pointStartAngle,
      num pointEndAngle,
      RadialBarSeriesRenderer seriesRenderer,
      bool hide,
      num oldRadius,
      num oldInnerRadius,
      ChartPoint<dynamic> _oldPoint,
      num oldStart,
      num oldEnd,
      int i,
      Canvas canvas,
      int index,
      SfCircularChart chart) {
    RadialBarSeries<dynamic, dynamic> series;
    if (seriesRenderer._series is RadialBarSeries) {
      series = seriesRenderer._series;
    }
    _drawPath(
        canvas,
        _StyleOptions(
            series.useSeriesColor ? point.fill : series.trackColor,
            series.trackBorderWidth,
            series.trackBorderColor,
            series.trackOpacity),
        _getArcPath(
            hide ? oldInnerRadius : _innerRadius,
            hide ? oldRadius : _radius.toDouble(),
            _center,
            0,
            360 - 0.001,
            360 - 0.001,
            chart,
            true));
    if (_radius > 0 && degree > 0) {
      _renderRadialPoints(
          point,
          degree,
          pointStartAngle,
          pointEndAngle,
          seriesRenderer,
          hide,
          oldRadius,
          oldInnerRadius,
          _oldPoint,
          oldStart,
          oldEnd,
          i,
          canvas,
          index,
          chart);
    }
  }

  void _renderRadialPoints(
      ChartPoint<dynamic> point,
      num degree,
      num pointStartAngle,
      num pointEndAngle,
      RadialBarSeriesRenderer seriesRenderer,
      bool hide,
      num oldRadius,
      num oldInnerRadius,
      ChartPoint<dynamic> _oldPoint,
      num oldStart,
      num oldEnd,
      int i,
      Canvas canvas,
      int index,
      SfCircularChart chart) {
    if (point.isVisible) {
      final _Region pointRegion = _Region(
          _degreesToRadians(point.startAngle),
          _degreesToRadians(point.endAngle),
          point.startAngle,
          point.endAngle,
          index,
          i,
          point.center,
          _innerRadius,
          point.outerRadius);
      seriesRenderer._pointRegions.add(pointRegion);
    }

    final num angleDeviation = _findAngleDeviation(
        hide ? oldInnerRadius : _innerRadius, hide ? oldRadius : _radius, 360);
    final CornerStyle cornerStyle = _series.cornerStyle;
    if (cornerStyle == CornerStyle.bothCurve ||
        cornerStyle == CornerStyle.startCurve) {
      hide
          ? oldStart = _oldPoint.startAngle + angleDeviation
          : pointStartAngle += angleDeviation;
    }
    if (cornerStyle == CornerStyle.bothCurve ||
        cornerStyle == CornerStyle.endCurve) {
      hide
          ? oldEnd = _oldPoint.endAngle - angleDeviation
          : pointEndAngle -= angleDeviation;
    }
    final _StyleOptions style =
        seriesRenderer._selectPoint(i, seriesRenderer, chart, point);
    final Color fillColor = style != null && style.fill != null
        ? style.fill
        : (point.fill != Colors.transparent
            ? _series._renderer.getPointColor(
                seriesRenderer, point, i, index, point.fill, _series.opacity)
            : point.fill);
    final Color strokeColor = style != null && style.strokeColor != null
        ? style.strokeColor
        : _series._renderer.getPointStrokeColor(
            seriesRenderer, point, i, index, point.strokeColor);
    final double strokeWidth = style != null && style.strokeWidth != null
        ? style.strokeWidth
        : _series._renderer.getPointStrokeWidth(
            seriesRenderer, point, i, index, point.strokeWidth);
    final double opacity = style != null && style.opacity != null
        ? style.opacity
        : _series._renderer
            .getOpacity(seriesRenderer, point, i, index, _series.opacity);
    if (hide
        ? (((oldEnd - oldStart) > 0) && (oldRadius != oldInnerRadius))
        : ((pointEndAngle - pointStartAngle) > 0)) {
      _drawPath(
          canvas,
          _StyleOptions(
              fillColor,
              chart._chartState.animateCompleted ? strokeWidth : 0,
              strokeColor,
              opacity),
          _getRoundedCornerArcPath(
              hide ? oldInnerRadius : _innerRadius,
              hide ? oldRadius : _radius,
              _center,
              hide ? oldStart : pointStartAngle,
              hide ? oldEnd : pointEndAngle,
              degree,
              _series.cornerStyle));
    }
  }
}
