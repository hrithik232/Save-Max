part of charts;

/// Creates the segments for bar series.
///
/// This generates the bar series points and has the [calculateSegmentPoints] override method
/// used to customize the bar series segment point calculation.
///
/// It gets the path, stroke color and fill color from the [series] to render the bar segment.
///
class BarSegment extends ChartSegment {
  RRect _trackBarRect;
  CartesianChartPoint<dynamic> _currentPoint;
  Paint _trackerFillPaint;
  Paint _trackerStrokePaint;

  ///Path to render.
  Path path;

  /// Gets the color of the series.
  @override
  Paint getFillPaint() {
    if (series.gradient == null) {
      fillPaint = Paint()
        ..color = _currentPoint.isEmpty == true
            ? series.emptyPointSettings.color
            : (_currentPoint.pointColorMapper ?? _color)
        ..style = PaintingStyle.fill;
    } else {
      fillPaint = _getLinearGradientPaint(series.gradient, _currentPoint.region,
          seriesRenderer._chart._requireInvertedAxis);
    }
    fillPaint.color =
        (series.opacity < 1 && fillPaint.color != Colors.transparent)
            ? fillPaint.color.withOpacity(series.opacity)
            : fillPaint.color;
    _defaultFillColor = fillPaint;
    return fillPaint;
  }

  /// Gets the border color of the series.
  @override
  Paint getStrokePaint() {
    strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _currentPoint.isEmpty == true
          ? series.emptyPointSettings.borderWidth
          : _strokeWidth;
    if (series.borderGradient != null) {
      strokePaint.shader =
          series.borderGradient.createShader(_currentPoint.region);
    } else {
      strokePaint.color = _currentPoint.isEmpty == true
          ? series.emptyPointSettings.borderColor
          : _strokeColor;
    }
    series.borderWidth == 0
        ? strokePaint.color = Colors.transparent
        : strokePaint.color;
    _defaultStrokeColor = strokePaint;
    return strokePaint;
  }

  /// Method to get series tracker fill.
  Paint _getTrackerFillPaint() {
    final BarSeries<dynamic, dynamic> barSeries = series;
    _trackerFillPaint = Paint()
      ..color = barSeries.trackColor
      ..style = PaintingStyle.fill;
    return _trackerFillPaint;
  }

  /// Method to get series tracker stroke color.
  Paint _getTrackerStrokePaint() {
    final BarSeries<dynamic, dynamic> barSeries = series;
    _trackerStrokePaint = Paint()
      ..color = barSeries.trackBorderColor
      ..strokeWidth = barSeries.trackBorderWidth
      ..style = PaintingStyle.stroke;
    barSeries.trackBorderWidth == 0
        ? _trackerStrokePaint.color = Colors.transparent
        : _trackerStrokePaint.color;
    return _trackerStrokePaint;
  }

  /// Calculates the rendering bounds of a segment.
  @override
  void calculateSegmentPoints() {}

  /// Draws segment in series bounds.
  @override
  void onPaint(Canvas canvas) {
    final BarSeries<dynamic, dynamic> barSeries = series;
    series.selectionSettings._selectionRenderer._checkWithSelectionState(
        seriesRenderer._segments[currentSegmentIndex], seriesRenderer._chart);
    if (_trackerFillPaint != null && barSeries.isTrackVisible) {
      _drawSegmentRect(canvas, _trackBarRect, _trackerFillPaint);
    }

    if (_trackerStrokePaint != null && barSeries.isTrackVisible) {
      _drawSegmentRect(canvas, _trackBarRect, _trackerStrokePaint);
    }

    if (fillPaint != null) {
      _drawSegmentRect(canvas, segmentRect, fillPaint);
    }
    if (strokePaint != null) {
      if (series.dashArray[0] != 0 && series.dashArray[1] != 0) {
        _drawDashedLine(canvas, series.dashArray, strokePaint, path);
      } else {
        _drawSegmentRect(canvas, segmentRect, strokePaint);
      }
    }
  }

  void _drawSegmentRect(Canvas canvas, RRect segmentRect, Paint paint) {
    (series.animationDuration > 0)
        ? _animateRectSeries(
            canvas,
            seriesRenderer,
            paint,
            segmentRect,
            _currentPoint.yValue,
            animationFactor,
            _oldPoint != null ? _oldPoint.region : _oldRegion,
            _oldPoint?.yValue,
            _oldSeriesVisible)
        : canvas.drawRRect(segmentRect, paint);
  }
}
