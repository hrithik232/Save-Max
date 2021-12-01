part of charts;

/// Renders the range column series.
///
/// To render a range column chart, create an instance of RangeColumnSeries and add to the series collection property of [SfCartesianChart].
///
/// RangeColumnSeries is similar to column series but requires two Y values for a point,
/// your data should contain high and low values.
/// High and low value specify the maximum and minimum range of the point.
///
/// * [highValueMapper] - Field in the data source, which is considered as high value for the data points.
/// * [lowValueMapper] - Field in the data source, which is considered as low value for the data points.
class RangeColumnSeries<T, D> extends XyDataSeries<T, D> {
  RangeColumnSeries(
      {ValueKey<String> key,
      ChartSeriesRendererFactory<T, D> onCreateRenderer,
      @required List<T> dataSource,
      @required ChartValueMapper<T, D> xValueMapper,
      @required ChartValueMapper<T, num> highValueMapper,
      @required ChartValueMapper<T, num> lowValueMapper,
      ChartValueMapper<T, dynamic> sortFieldValueMapper,
      ChartValueMapper<T, Color> pointColorMapper,
      ChartValueMapper<T, String> dataLabelMapper,
      SortingOrder sortingOrder,
      this.isTrackVisible = false,
      String xAxisName,
      String yAxisName,
      String name,
      Color color,
      double width,
      double spacing,
      MarkerSettings markerSettings,
      EmptyPointSettings emptyPointSettings,
      DataLabelSettings dataLabelSettings,
      bool isVisible,
      LinearGradient gradient,
      LinearGradient borderGradient,
      BorderRadius borderRadius,
      bool enableTooltip,
      double animationDuration,
      Color trackColor,
      Color trackBorderColor,
      double trackBorderWidth,
      double trackPadding,
      Color borderColor,
      List<Trendline> trendlines,
      double borderWidth,
      SelectionSettings selectionSettings,
      bool isVisibleInLegend,
      LegendIconType legendIconType,
      String legendItemText,
      double opacity,
      List<double> dashArray,
      SeriesRendererCreatedCallback onRendererCreated,
      List<int> initialSelectedDataIndexes})
      : trackColor = trackColor ?? Colors.grey,
        trackBorderColor = trackBorderColor ?? Colors.transparent,
        trackBorderWidth = trackBorderWidth ?? 1,
        trackPadding = trackPadding ?? 0,
        spacing = spacing ?? 0,
        borderRadius = borderRadius ?? const BorderRadius.all(Radius.zero),
        super(
            key: key,
            onCreateRenderer: onCreateRenderer,
            name: name,
            xValueMapper: xValueMapper,
            highValueMapper: highValueMapper,
            lowValueMapper: lowValueMapper,
            sortFieldValueMapper: sortFieldValueMapper,
            pointColorMapper: pointColorMapper,
            dataLabelMapper: dataLabelMapper,
            dataSource: dataSource,
            trendlines: trendlines,
            xAxisName: xAxisName,
            yAxisName: yAxisName,
            color: color,
            width: width ?? 0.7,
            markerSettings: markerSettings,
            dataLabelSettings: dataLabelSettings,
            isVisible: isVisible,
            gradient: gradient,
            borderGradient: borderGradient,
            emptyPointSettings: emptyPointSettings,
            enableTooltip: enableTooltip,
            animationDuration: animationDuration,
            borderColor: borderColor,
            borderWidth: borderWidth,
            selectionSettings: selectionSettings,
            legendItemText: legendItemText,
            isVisibleInLegend: isVisibleInLegend,
            legendIconType: legendIconType,
            sortingOrder: sortingOrder,
            opacity: opacity,
            dashArray: dashArray,
            onRendererCreated: onRendererCreated,
            initialSelectedDataIndexes: initialSelectedDataIndexes);

  ///Color of the track.
  ///
  ///Defaults to `grey`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                  isTrackVisible: true,
  ///                  trackColor: Colors.red
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final Color trackColor;

  ///Color of the track border.
  ///
  ///Defaults to `transparent`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                  isTrackVisible: true,
  ///                  trackBorderColor: Colors.red
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final Color trackBorderColor;

  ///Width of the track border.
  ///
  ///Defaults to `1`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                  isTrackVisible: true,
  ///                  trackBorderColor: Colors.red ,
  ///                  trackBorderWidth: 2
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final double trackBorderWidth;

  ///Padding of the track.
  ///
  ///Defaults to `0`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            selectionGesture: ActivationMode.doubleTap,
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                  isTrackVisible: true,
  ///                  trackPadding: 2
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final double trackPadding;

  ///Spacing between the columns.
  ///
  ///The value ranges from 0 to 1. 1 represents 100% and 0 represents 0% of the available space.
  ///
  ///Spacing also affects the width of the range column. For example, setting 20% spacing
  ///and 100% width renders the column with 80% of total width.
  ///
  ///Defaults to `0`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                  spacing: 0,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final double spacing;

  ///Renders range column with track.
  ///
  /// Track is a rectangular bar rendered from the start to the end of the axis. Range Column Series will be rendered
  /// above the track.
  ///
  ///Defaults to `false`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                  isTrackVisible: true,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final bool isTrackVisible;

  ///Customizes the corners of the range column.
  ///
  /// Each corner can be customized with a desired value or with a single value.
  ///
  ///Defaults to `zero`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                  borderRadius: BorderRadius.circular(5),
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final BorderRadius borderRadius;

  // Create the range column series renderer.
  RangeColumnSeriesRenderer createRenderer(ChartSeries<T, D> series) {
    RangeColumnSeriesRenderer seriesRenderer;
    if (onCreateRenderer != null) {
      seriesRenderer = onCreateRenderer(series);
      assert(seriesRenderer != null,
          'This onCreateRenderer callback function should return value as extends from ChartSeriesRenderer class and should not be return value as null');
      return seriesRenderer;
    }
    return RangeColumnSeriesRenderer();
  }
}

/// Creates series renderer for Range column series
class RangeColumnSeriesRenderer extends XyDataSeriesRenderer {
  RangeColumnSeriesRenderer();

  // Store the rect position //
  num _rectPosition;

  // Store the rect count //
  num _rectCount;

  ChartSegment addSegment(CartesianChartPoint<dynamic> currentPoint,
      int pointIndex, int seriesIndex, num animateFactor) {
    final RangeColumnSegment segment = createSegment();
    final List<CartesianSeriesRenderer> _oldSeriesRenderers =
        _chart._chartState.oldSeriesRenderers;
    final RangeColumnSeries<dynamic, dynamic> _rangeColumnSeries = _series;
    final BorderRadius borderRadius = _rangeColumnSeries.borderRadius;
    segment._seriesIndex = seriesIndex;
    segment.currentSegmentIndex = pointIndex;
    segment.seriesRenderer = this;
    segment.series = _rangeColumnSeries;
    segment._chart = _chart;
    segment.animationFactor = animateFactor;
    segment._currentPoint = currentPoint;
    if (_chart._chartState.widgetNeedUpdate &&
        _chart.zoomPanBehavior._isPinching != true &&
        !_chart._chartState._isLegendToggled &&
        _oldSeriesRenderers != null &&
        _oldSeriesRenderers.isNotEmpty &&
        _oldSeriesRenderers.length - 1 >= segment._seriesIndex &&
        _oldSeriesRenderers[segment._seriesIndex]._seriesName ==
            segment.seriesRenderer._seriesName) {
      segment._oldSeriesRenderer = _oldSeriesRenderers[segment._seriesIndex];
      segment._oldPoint = (segment._oldSeriesRenderer._segments.isNotEmpty &&
              segment._oldSeriesRenderer._segments[0] is RangeColumnSegment &&
              segment._oldSeriesRenderer._dataPoints.length - 1 >= pointIndex)
          ? segment._oldSeriesRenderer._dataPoints[pointIndex]
          : null;
    } else if (_chart._chartState._isLegendToggled &&
        _chart._chartState.segments != null &&
        _chart._chartState.segments.isNotEmpty) {
      segment._oldSeriesVisible =
          _chart._chartState._oldSeriesVisible[segment._seriesIndex];
      ChartSegment oldSegment;
      for (int i = 0; i < _chart._chartState.segments.length; i++) {
        oldSegment = _chart._chartState.segments[i];
        if (oldSegment.currentSegmentIndex == segment.currentSegmentIndex &&
            oldSegment._seriesIndex == segment._seriesIndex) {
          segment._oldRegion = oldSegment.segmentRect.outerRect;
        }
      }
    }
    segment.path = _dashedBorder(currentPoint, _rangeColumnSeries.borderWidth);
    if (borderRadius != null) {
      segment.segmentRect = getRRectFromRect(currentPoint.region, borderRadius);

      //Tracker rect
      if (_rangeColumnSeries.isTrackVisible) {
        segment._trackRect =
            getRRectFromRect(currentPoint.trackerRectRegion, borderRadius);
      }
    }
    customizeSegment(segment);
    _segments.add(segment);
    return segment;
  }

  void drawSegment(Canvas canvas, ChartSegment segment) {
    segment.onPaint(canvas);
  }

  /// Creates a segment for a data point in the series.
  @override
  ChartSegment createSegment() => RangeColumnSegment();

  /// Changes the series color, border color, and border width.
  @override
  void customizeSegment(ChartSegment segment) {
    final RangeColumnSegment rangeColumnSegment = segment;
    rangeColumnSegment._color = segment.seriesRenderer._seriesColor;
    rangeColumnSegment._strokeColor = segment.series.borderColor;
    rangeColumnSegment._strokeWidth = segment.series.borderWidth;
    rangeColumnSegment.strokePaint = rangeColumnSegment.getStrokePaint();
    rangeColumnSegment.fillPaint = rangeColumnSegment.getFillPaint();
    rangeColumnSegment._trackerFillPaint =
        rangeColumnSegment._getTrackerFillPaint();
    rangeColumnSegment._trackerStrokePaint =
        rangeColumnSegment._getTrackerStrokePaint();
  }

  ///Draws marker with different shape and color of the appropriate data point in the series.
  @override
  void drawDataMarker(int index, Canvas canvas, Paint fillPaint,
      Paint strokePaint, double pointX, double pointY,
      [CartesianSeriesRenderer seriesRenderer]) {
    canvas.drawPath(seriesRenderer._markerShapes[index], fillPaint);
    canvas.drawPath(seriesRenderer._markerShapes2[index], fillPaint);
    canvas.drawPath(seriesRenderer._markerShapes[index], strokePaint);
    canvas.drawPath(seriesRenderer._markerShapes2[index], strokePaint);
  }

  /// Draws data label text of the appropriate data point in a series.
  @override
  void drawDataLabel(int index, Canvas canvas, String dataLabel, double pointX,
          double pointY, int angle, TextStyle style) =>
      _drawText(canvas, dataLabel, Offset(pointX, pointY), style, angle);
}
