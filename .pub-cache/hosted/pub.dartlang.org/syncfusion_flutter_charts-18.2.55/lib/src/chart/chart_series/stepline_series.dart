part of charts;

/// Renders the step line series.
///
/// A step line chart is a line chart in which points are connected
///  by horizontal and vertical line segments, looking like steps of a staircase.
///
/// To render a step line chart, create an instance of StepLineSeries, and add it to the series collection property of [SfCartesianChart].
/// Provides option to customise the [color], [opacity], [width] of the stepline segments
class StepLineSeries<T, D> extends XyDataSeries<T, D> {
  StepLineSeries(
      {ValueKey<String> key,
      ChartSeriesRendererFactory<T, D> onCreateRenderer,
      @required List<T> dataSource,
      @required ChartValueMapper<T, D> xValueMapper,
      @required ChartValueMapper<T, num> yValueMapper,
      ChartValueMapper<T, dynamic> sortFieldValueMapper,
      ChartValueMapper<T, Color> pointColorMapper,
      ChartValueMapper<T, String> dataLabelMapper,
      String xAxisName,
      String yAxisName,
      String name,
      Color color,
      double width,
      MarkerSettings markerSettings,
      List<Trendline> trendlines,
      EmptyPointSettings emptyPointSettings,
      DataLabelSettings dataLabelSettings,
      bool isVisible,
      bool enableTooltip,
      List<double> dashArray,
      double animationDuration,
      SelectionSettings selectionSettings,
      SortingOrder sortingOrder,
      bool isVisibleInLegend,
      LegendIconType legendIconType,
      String legendItemText,
      SeriesRendererCreatedCallback onRendererCreated,
      double opacity})
      : super(
            key: key,
            onCreateRenderer: onCreateRenderer,
            xValueMapper: xValueMapper,
            yValueMapper: yValueMapper,
            sortFieldValueMapper: sortFieldValueMapper,
            pointColorMapper: pointColorMapper,
            dataLabelMapper: dataLabelMapper,
            dataSource: dataSource,
            xAxisName: xAxisName,
            yAxisName: yAxisName,
            trendlines: trendlines,
            name: name,
            color: color,
            width: width ?? 2,
            markerSettings: markerSettings,
            dataLabelSettings: dataLabelSettings,
            emptyPointSettings: emptyPointSettings,
            enableTooltip: enableTooltip,
            dashArray: dashArray,
            isVisible: isVisible,
            animationDuration: animationDuration,
            selectionSettings: selectionSettings,
            legendItemText: legendItemText,
            isVisibleInLegend: isVisibleInLegend,
            legendIconType: legendIconType,
            sortingOrder: sortingOrder,
            onRendererCreated: onRendererCreated,
            opacity: opacity);

  // Create the stacked area series renderer.
  StepLineSeriesRenderer createRenderer(ChartSeries<T, D> series) {
    StepLineSeriesRenderer stepLineSeriesRenderer;
    if (onCreateRenderer != null) {
      stepLineSeriesRenderer = onCreateRenderer(series);
      assert(stepLineSeriesRenderer != null,
          'This onCreateRenderer callback function should return value as extends from ChartSeriesRenderer class and should not be return value as null');
      return stepLineSeriesRenderer;
    }
    return StepLineSeriesRenderer();
  }
}

/// Creates series renderer for Step line series
class StepLineSeriesRenderer extends XyDataSeriesRenderer {
  StepLineSeriesRenderer();

  /// StepLine segment is created here
  ChartSegment addSegment(
      CartesianChartPoint<dynamic> currentPoint,
      num midX,
      num midY,
      CartesianChartPoint<dynamic> _nextPoint,
      int pointIndex,
      int seriesIndex,
      num animateFactor) {
    final StepLineSegment segment = createSegment();
    final List<CartesianSeriesRenderer> _oldSeriesRenderers =
        _chart._chartState.oldSeriesRenderers;
    _isRectSeries = false;
    segment.currentSegmentIndex = pointIndex;
    segment._seriesIndex = seriesIndex;
    segment.seriesRenderer = this;
    segment.series = _series;
    segment._currentPoint = currentPoint;
    segment._midX = midX;
    segment._midY = midY;
    segment._nextPoint = _nextPoint;
    segment._chart = _chart;
    segment.animationFactor = animateFactor;
    segment._pointColorMapper = currentPoint.pointColorMapper;
    if (_chart._chartState.widgetNeedUpdate &&
        _oldSeriesRenderers != null &&
        _oldSeriesRenderers.isNotEmpty &&
        _oldSeriesRenderers.length - 1 >= segment._seriesIndex &&
        _oldSeriesRenderers[segment._seriesIndex]._seriesName ==
            segment.seriesRenderer._seriesName) {
      segment._oldSeriesRenderer = _oldSeriesRenderers[segment._seriesIndex];
    }
    segment.calculateSegmentPoints();
    customizeSegment(segment);
    segment.strokePaint = segment.getStrokePaint();
    segment.fillPaint = segment.getFillPaint();
    _segments.add(segment);
    return segment;
  }

  void drawSegment(Canvas canvas, ChartSegment segment) {
    segment.onPaint(canvas);
  }

  /// Creates a segment for a data point in the series.
  @override
  ChartSegment createSegment() => StepLineSegment();

  /// Changes the series color, border color, and border width.
  @override
  void customizeSegment(ChartSegment segment) {
    segment._color = segment.seriesRenderer._seriesColor;
    segment._strokeColor = segment.seriesRenderer._seriesColor;
    segment._strokeWidth = segment.series.width;
  }

  ///Draws marker with different shape and color of the appropriate data point in the series.
  @override
  void drawDataMarker(int index, Canvas canvas, Paint fillPaint,
      Paint strokePaint, double pointX, double pointY,
      [CartesianSeriesRenderer seriesRenderer]) {
    canvas.drawPath(seriesRenderer._markerShapes[index], fillPaint);
    canvas.drawPath(seriesRenderer._markerShapes[index], strokePaint);
  }

  /// Draws data label text of the appropriate data point in a series.
  @override
  void drawDataLabel(int index, Canvas canvas, String dataLabel, double pointX,
          double pointY, int angle, TextStyle style) =>
      _drawText(canvas, dataLabel, Offset(pointX, pointY), style, angle);
}
