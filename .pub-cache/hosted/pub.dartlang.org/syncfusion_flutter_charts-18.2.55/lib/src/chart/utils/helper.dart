part of charts;

// Measure the text and return the text size
Size _measureText(String textValue, TextStyle textStyle, [int angle]) {
  Size size;
  final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      text: TextSpan(text: textValue, style: textStyle));
  textPainter.layout();
  if (angle != null) {
    final Rect rect = _rotatedTextSize(textPainter.size, angle);
    size = Size(rect.width, rect.height);
  } else {
    size = Size(textPainter.width, textPainter.height);
  }
  return size;
}

num _percentageToValue(String value, num size) {
  if (value != null) {
    return value.contains('%')
        ? (size / 100) * num.tryParse(value.replaceAll(RegExp('%'), ''))
        : num.tryParse(value);
  }
  return null;
}

/// Draw the text
void _drawText(Canvas canvas, String text, Offset point, TextStyle style,
    [int angle]) {
  final num maxLines = _getMaxLinesContent(text);
  final TextSpan span = TextSpan(text: text, style: style);
  final TextPainter tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      maxLines: maxLines);
  tp.layout();
  canvas.save();
  canvas.translate(point.dx, point.dy);
  Offset labelOffset = const Offset(0.0, 0.0);
  if (angle != null && angle > 0) {
    canvas.rotate(_degreeToRadian(angle));
    labelOffset = Offset(-tp.width / 2, -tp.height / 2);
  }
  tp.paint(canvas, labelOffset);
  canvas.restore();
}

num _getMaxLinesContent(String text) {
  return text != null && text.isNotEmpty && text.contains('\n')
      ? text.split('\n').length
      : 1;
}

vector.Vector2 _offsetToVector2(Offset offset) =>
    vector.Vector2(offset.dx, offset.dy);

Offset _vector2ToOffset(vector.Vector2 vector) => Offset(vector.x, vector.y);

Offset _transform(
  vector.Matrix2 matrix,
  Offset offset,
) {
  return _vector2ToOffset(matrix * _offsetToVector2(offset));
}

Rect _rotatedTextSize(Size size, int angle) {
  final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
  final vector.Matrix2 _rotatorMatrix =
      vector.Matrix2.rotation(_degreeToRadian(angle));

  final Rect movedToCenterAsOrigin = rect.shift(-rect.center);

  Offset _topLeft = movedToCenterAsOrigin.topLeft;
  Offset _topRight = movedToCenterAsOrigin.topRight;
  Offset _bottomLeft = movedToCenterAsOrigin.bottomLeft;
  Offset _bottomRight = movedToCenterAsOrigin.bottomRight;

  _topLeft = _transform(_rotatorMatrix, _topLeft);
  _topRight = _transform(_rotatorMatrix, _topRight);
  _bottomLeft = _transform(_rotatorMatrix, _bottomLeft);
  _bottomRight = _transform(_rotatorMatrix, _bottomRight);

  final List<Offset> rotOffsets = <Offset>[
    _topLeft,
    _topRight,
    _bottomLeft,
    _bottomRight
  ];

  final double minX =
      rotOffsets.map((Offset offset) => offset.dx).reduce(math.min);
  final double maxX =
      rotOffsets.map((Offset offset) => offset.dx).reduce(math.max);
  final double minY =
      rotOffsets.map((Offset offset) => offset.dy).reduce(math.min);
  final double maxY =
      rotOffsets.map((Offset offset) => offset.dy).reduce(math.max);

  final Rect rotateRect = Rect.fromPoints(
    Offset(minX, minY),
    Offset(maxX, maxY),
  );
  return rotateRect;
}

// Draw the path
void _drawDashedPath(Canvas canvas, _CustomPaintStyle style, Offset moveToPoint,
    Offset lineToPoint,
    [List<double> dashArray]) {
  bool even = false;
  final Path path = Path();
  path.moveTo(moveToPoint.dx, moveToPoint.dy);
  path.lineTo(lineToPoint.dx, lineToPoint.dy);
  final Paint paint = Paint();
  paint.strokeWidth = style.strokeWidth;
  paint.color = style.color;
  paint.style = style.paintStyle;

  if (dashArray != null) {
    for (int i = 1; i < dashArray.length; i = i + 2) {
      if (dashArray[i] == 0) {
        even = true;
      }
    }
    if (even == false && !kIsWeb) {
      canvas.drawPath(
          _dashPath(
            path,
            dashArray: _CircularIntervalList<double>(dashArray),
          ),
          paint);
    } else
      canvas.drawPath(path, paint);
  } else
    canvas.drawPath(path, paint);
}

/// Convert degree to radian
num _degreeToRadian(int deg) => deg * (math.pi / 180);

/// find the position of point
num _valueToCoefficient(num value, ChartAxis axis) {
  num result = 0;
  if (axis._visibleRange != null && value != null) {
    final _VisibleRange range = axis._visibleRange;
    if (range != null) {
      result = (value - range.minimum) / (range.delta);
      result = axis.isInversed ? (1 - result) : result;
    }
  }
  return result;
}

num _logBase(num value, num base) => math.log(value) / math.log(base);

bool _withIn(num value, _VisibleRange range) =>
    (value <= range.maximum) && (value >= range.minimum);

/// Get the location of point
_ChartLocation _calculatePoint(num x, num y, ChartAxis xAxis, ChartAxis yAxis,
    bool isInverted, CartesianSeries<dynamic, dynamic> series, Rect rect) {
  x = xAxis is LogarithmicAxis ? _logBase(x > 1 ? x : 1, xAxis.logBase) : x;
  y = yAxis is LogarithmicAxis ? _logBase(y > 1 ? y : 1, yAxis.logBase) : y;
  x = _valueToCoefficient(x, xAxis);
  y = _valueToCoefficient(y, yAxis);
  final num xLength = isInverted ? rect.height : rect.width;
  final num yLength = isInverted ? rect.width : rect.height;
  final num locationX =
      rect.left + (isInverted ? (y * yLength) : (x * xLength));
  final num locationY =
      rect.top + (isInverted ? (1 - x) * xLength : (1 - y) * yLength);
  return _ChartLocation(locationX, locationY);
}

/// Calculate the minimum points delta
num _calculateMinPointsDelta(ChartAxis axis,
    List<CartesianSeriesRenderer> seriesRenderers, SfCartesianChart chart) {
  num minDelta = 1.7976931348623157e+308, minVal, seriesMin;
  dynamic xValues;
  for (CartesianSeriesRenderer seriesRenderer in seriesRenderers) {
    final CartesianSeries<dynamic, dynamic> series = seriesRenderer._series;
    num value;
    xValues = <dynamic>[];
    if (seriesRenderer._visible &&
        ((axis._name == series.xAxisName) ||
            (axis._name == 'primaryXAxis' && series.xAxisName == null) ||
            (axis._name == chart.primaryXAxis._name &&
                series.xAxisName != null))) {
      xValues = seriesRenderer._dataPoints
          .map<dynamic>((CartesianChartPoint<dynamic> point) {
        return point.xValue;
      }).toList();

      xValues.sort();
      if (xValues.length == 1) {
        seriesMin = (axis is DateTimeAxis &&
                seriesRenderer._minimumX == seriesRenderer._maximumX)
            ? (seriesRenderer._minimumX - 2592000000)
            : seriesRenderer._minimumX;
        minVal = xValues[0] -
            (seriesMin != null ? seriesMin : axis._visibleRange.minimum);
        if (minVal != 0) {
          minDelta = math.min(minDelta, minVal);
        }
      } else {
        for (int i = 0; i < xValues.length; i++) {
          value = xValues[i];
          if (i > 0 && value != null) {
            minVal = value - xValues[i - 1];
            if (minVal != 0) {
              minDelta = math.min(minDelta, minVal);
            }
          }
        }
      }
    }
  }
  if (minDelta == 1.7976931348623157e+308) {
    minDelta = 1;
  }

  return minDelta;
}

/// Draw different marker shapes by using height and width
class _ChartShapeUtils {
  /// Draw the circle shape marker
  static void _drawCircle(
      Path path, double x, double y, double width, double height) {
    path.addArc(
        Rect.fromLTRB(
            x - width / 2, y - height / 2, x + width / 2, y + height / 2),
        0.0,
        2 * math.pi);
  }

  /// Draw the Rectangle shape marker
  static void _drawRectangle(
      Path path, double x, double y, double width, double height) {
    path.addRect(Rect.fromLTRB(
        x - width / 2, y - height / 2, x + width / 2, y + height / 2));
  }

  ///Draw the Pentagon shape marker
  static void _drawPentagon(
      Path path, double x, double y, double width, double height) {
    const dynamic eq = 72;
    double xValue;
    double yValue;
    for (dynamic i = 0; i <= 5; i++) {
      xValue = width / 2 * math.cos((math.pi / 180) * (i * eq));
      yValue = height / 2 * math.sin((math.pi / 180) * (i * eq));
      i == 0
          ? path.moveTo(x + xValue, y + yValue)
          : path.lineTo(x + xValue, y + yValue);
    }
    path.close();
  }

  ///Draw the Vertical line shape marker
  static void _drawVerticalLine(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x, y + height / 2);
    path.lineTo(x, y - height / 2);
  }

  ///Draw the Inverted Triangle shape marker
  static void _drawInvertedTriangle(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x + width / 2, y - height / 2);
    path.lineTo(x, y + height / 2);
    path.lineTo(x - width / 2, y - height / 2);
    path.lineTo(x + width / 2, y - height / 2);
    path.close();
  }

  ///Draw the Horizontal line shape marker
  static void _drawHorizontalLine(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x - width / 2, y);
    path.lineTo(x + width / 2, y);
  }

  ///Draw the Diamond shape marker
  static void _drawDiamond(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x - width / 2, y);
    path.lineTo(x, y + height / 2);
    path.lineTo(x + width / 2, y);
    path.lineTo(x, y - height / 2);
    path.lineTo(x - width / 2, y);
    path.close();
  }

  ///Draw the Triangle shape marker
  static void _drawTriangle(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x - width / 2, y + height / 2);
    path.lineTo(x + width / 2, y + height / 2);
    path.lineTo(x, y - height / 2);
    path.lineTo(x - width / 2, y + height / 2);
    path.close();
  }
}

///Draw Legend series type icon
PaintingStyle _calculateLegendShapes(Path path, double x, double y,
    double width, double height, String seriesType) {
  PaintingStyle style = PaintingStyle.fill;
  switch (seriesType) {
    case 'line':
    case 'fastline':
    case 'stackedline':
    case 'stackedline100':
      style = PaintingStyle.stroke;
      break;
    case 'spline':
      path.moveTo(x - width / 2, y + height / 5);
      path.quadraticBezierTo(x, y - height, x, y + height / 5);
      path.moveTo(x, y + height / 5);
      path.quadraticBezierTo(
          x + width / 2, y + height / 2, x + width / 2, y - height / 2);
      style = PaintingStyle.stroke;
      break;
    case 'splinearea':
    case 'splinerangearea':
      path.moveTo(x - width / 2, y + height / 2);
      path.quadraticBezierTo(x, y - height, x, y + height / 5);
      path.quadraticBezierTo(
          x + width / 2, y - height / 2, x + width / 2, y + height / 2);
      break;
    case 'bar':
    case 'stackedbar':
    case 'stackedbar100':
      _calculateBarTypeIconPath(path, x, y, width, height);
      break;
    case 'column':
    case 'stackedcolumn':
    case 'stackedcolumn100':
    case 'rangecolumn':
    case 'histogram':
      _calculateColumnTypeIconPath(path, x, y, width, height);
      break;
    case 'area':
    case 'stackedarea':
    case 'rangearea':
    case 'stackedarea100':
      _calculateAreaTypeIconPath(path, x, y, width, height);
      break;
    case 'stepline':
      _calculateSteplineIconPath(path, x, y, width, height);
      style = PaintingStyle.stroke;
      break;
    case 'bubble':
      path.addArc(Rect.fromLTWH(x - width / 2, y - height / 2, width, height),
          0.0, 2 * math.pi);
      break;

    case 'hilo':
      path.moveTo(x, y + height / 2);
      path.lineTo(x, y - height / 2);
      style = PaintingStyle.stroke;
      break;
    case 'hiloopenclose':
    case 'candle':
      path.moveTo(x - width / 2, y);
      path.lineTo(x + width / 2, y);
      style = PaintingStyle.stroke;
      break;
    case 'pie':
      _calculatePieIconPath(path, x, y, width, height);
      break;
    case 'doughnut':
    case 'radialbar':
      break;
    case 'steparea':
      _calculateStepAreaIconPath(path, x, y, width, height);
      break;
    case 'pyramid':
      _calculatePyramidIconPath(path, x, y, width, height);
      break;
    case 'funnel':
      _calculateFunnelIconPath(path, x, y, width, height);
      break;
    default:
      path.addArc(
          Rect.fromLTRB(
              x - width / 2, y - height / 2, x + width / 2, y + height / 2),
          0.0,
          2 * math.pi);
      break;
  }
  return style;
}

///calculate bar legend icon path
void _calculateBarTypeIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - (width / 2) - padding / 4, y - 3 * (height / 5));
  path.lineTo(x + 3 * (width / 10), y - 3 * (height / 5));
  path.lineTo(x + 3 * (width / 10), y - 3 * (height / 10));
  path.lineTo(x - (width / 2) - padding / 4, y - 3 * (height / 10));
  path.close();
  path.moveTo(
      x - (width / 2) - (padding / 4), y - (height / 5) + (padding / 20));
  path.lineTo(
      x + (width / 2) + (padding / 4), y - (height / 5) + (padding / 20));
  path.lineTo(
      x + (width / 2) + (padding / 4), y + (height / 10) + (padding / 20));
  path.lineTo(
      x - (width / 2) - (padding / 4), y + (height / 10) + (padding / 20));
  path.close();
  path.moveTo(
      x - (width / 2) - (padding / 4), y + (height / 5) + (padding / 10));
  path.lineTo(x - width / 4, y + (height / 5) + (padding / 10));
  path.lineTo(x - width / 4, y + (height / 2) + (padding / 10));
  path.lineTo(
      x - (width / 2) - (padding / 4), y + (height / 2) + (padding / 10));
  path.close();
}

///calculate column legend icon path
void _calculateColumnTypeIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - 3 * (width / 5), y - (height / 5));
  path.lineTo(x + 3 * (-width / 10), y - (height / 5));
  path.lineTo(x + 3 * (-width / 10), y + (height / 2));
  path.lineTo(x - 3 * (width / 5), y + (height / 2));
  path.close();
  path.moveTo(
      x - (width / 10) - (width / 20), y - (height / 4) - (padding / 2));
  path.lineTo(
      x + (width / 10) + (width / 20), y - (height / 4) - (padding / 2));
  path.lineTo(x + (width / 10) + (width / 20), y + (height / 2));
  path.lineTo(x - (width / 10) - (width / 20), y + (height / 2));
  path.close();
  path.moveTo(x + 3 * (width / 10), y);
  path.lineTo(x + 3 * (width / 5), y);
  path.lineTo(x + 3 * (width / 5), y + (height / 2));
  path.lineTo(x + 3 * (width / 10), y + (height / 2));
  path.close();
}

///calculate area type legend icon path
void _calculateAreaTypeIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - (width / 2) - (padding / 4), y + (height / 2));
  path.lineTo(x - (width / 4) - (padding / 8), y - (height / 2));
  path.lineTo(x, y + (height / 4));
  path.lineTo(x + (width / 4) + (padding / 8), y - (height / 2) + (height / 4));
  path.lineTo(x + (height / 2) + (padding / 4), y + (height / 2));
  path.close();
}

///calculate stepline legend icon path
void _calculateSteplineIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - (width / 2) - (padding / 4), y + (height / 2));
  path.lineTo(x - (width / 2) + (width / 10), y + (height / 2));
  path.lineTo(x - (width / 2) + (width / 10), y);
  path.lineTo(x - (width / 10), y);
  path.lineTo(x - (width / 10), y + (height / 2));
  path.lineTo(x + (width / 5), y + (height / 2));
  path.lineTo(x + (width / 5), y - (height / 2));
  path.lineTo(x + (width / 2), y - (height / 2));
  path.lineTo(x + (width / 2), y + (height / 2));
  path.lineTo(x + (width / 2) + (padding / 4), y + (height / 2));
}

///calculate steparea legend icon path
void _calculateStepAreaIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - (width / 2) - (padding / 4), y + (height / 2));
  path.lineTo(x - (width / 2) - (padding / 4), y - (height / 4));
  path.lineTo(x - (width / 2) + (width / 10), y - (height / 4));
  path.lineTo(x - (width / 2) + (width / 10), y - (height / 2));
  path.lineTo(x - (width / 10), y - (height / 2));
  path.lineTo(x - (width / 10), y);
  path.lineTo(x + (width / 5), y);
  path.lineTo(x + (width / 5), y - (height / 3));
  path.lineTo(x + (width / 2), y - (height / 3));
  path.lineTo(x + (width / 2), y + (height / 2));
  path.close();
}

///Calculate pie legend icon path
void _calculatePieIconPath(
    Path path, double x, double y, double width, double height) {
  final num r = math.min(height, width) / 2;
  path.moveTo(x, y);
  path.lineTo(x + r, y);
  path.arcTo(Rect.fromCircle(center: Offset(x, y), radius: r),
      _degreesToRadians(0), _degreesToRadians(270), false);
  path.close();
  path.moveTo(x + width / 10, y - height / 10);
  path.lineTo(x + r, y - height / 10);
  path.arcTo(Rect.fromCircle(center: Offset(x + 2, y - 2), radius: r),
      _degreesToRadians(-5), _degreesToRadians(-80), false);
  path.close();
}

///calculate pyramid legend icon path
void _calculatePyramidIconPath(
    Path path, double x, double y, double width, double height) {
  path.moveTo(x - width / 2, y + height / 2);
  path.lineTo(x + width / 2, y + height / 2);
  path.lineTo(x, y - height / 2);
  path.lineTo(x - width / 2, y + height / 2);
  path.close();
}

///calculate funnel legend icon path
void _calculateFunnelIconPath(
    Path path, double x, double y, double width, double height) {
  path.moveTo(x + width / 2, y - height / 2);
  path.lineTo(x, y + height / 2);
  path.lineTo(x - width / 2, y - height / 2);
  path.lineTo(x + width / 2, y - height / 2);
  path.close();
}

/// Calculate the rect bounds for column series and Bar series.
Rect _calculateRectangle(num x1, num y1, num x2, num y2,
    CartesianSeriesRenderer seriesRenderer, SfCartesianChart chart) {
  final Rect rect = _calculatePlotOffset(
      chart._chartAxis._axisClipRect,
      Offset(
          seriesRenderer._xAxis.plotOffset, seriesRenderer._yAxis.plotOffset));
  final bool isInverted = chart._requireInvertedAxis;
  final _ChartLocation point1 = _calculatePoint(x1, y1, seriesRenderer._xAxis,
      seriesRenderer._yAxis, isInverted, seriesRenderer._series, rect);
  final _ChartLocation point2 = _calculatePoint(x2, y2, seriesRenderer._xAxis,
      seriesRenderer._yAxis, isInverted, seriesRenderer._series, rect);
  return Rect.fromLTWH(
      math.min(point1.x, point2.x),
      math.min(point1.y, point2.y),
      (point2.x - point1.x).abs(),
      (point2.y - point1.y).abs());
}

///Calculate the tracker rect bounds for column series and Bar series.
Rect _calculateShadowRectangle(
    num x1,
    num y1,
    num x2,
    num y2,
    CartesianSeriesRenderer seriesRenderer,
    SfCartesianChart chart,
    Offset plotOffset) {
  final Rect rect = _calculatePlotOffset(
      chart._chartAxis._axisClipRect,
      Offset(
          seriesRenderer._xAxis.plotOffset, seriesRenderer._yAxis.plotOffset));
  final bool isInverted = chart._requireInvertedAxis;
  final _ChartLocation point1 = _calculatePoint(x1, y1, seriesRenderer._xAxis,
      seriesRenderer._yAxis, isInverted, seriesRenderer._series, rect);
  final _ChartLocation point2 = _calculatePoint(x2, y2, seriesRenderer._xAxis,
      seriesRenderer._yAxis, isInverted, seriesRenderer._series, rect);
  final bool isColumn = seriesRenderer._seriesType == 'column';
  final bool isHistogram = seriesRenderer._seriesType == 'histogram';
  final bool isStackedColumn = seriesRenderer._seriesType == 'stackedcolumn';
  final bool isStackedBar = seriesRenderer._seriesType == 'stackedbar';
  final bool isRangeColumn = seriesRenderer._seriesType == 'rangecolumn';
  ColumnSeries<dynamic, dynamic> columnSeries;
  BarSeries<dynamic, dynamic> barSeries;
  StackedColumnSeries<dynamic, dynamic> stackedColumnSeries;
  StackedBarSeries<dynamic, dynamic> stackedBarSeries;
  RangeColumnSeries<dynamic, dynamic> rangeColumnSeries;
  HistogramSeries<dynamic, dynamic> histogramSeries;
  if (seriesRenderer._seriesType == 'column') {
    columnSeries = seriesRenderer._series;
  } else if (seriesRenderer._seriesType == 'bar') {
    barSeries = seriesRenderer._series;
  } else if (seriesRenderer._seriesType == 'stackedcolumn') {
    stackedColumnSeries = seriesRenderer._series;
  } else if (seriesRenderer._seriesType == 'stackedbar') {
    stackedBarSeries = seriesRenderer._series;
  } else if (seriesRenderer._seriesType == 'rangecolumn') {
    rangeColumnSeries = seriesRenderer._series;
  } else if (seriesRenderer._seriesType == 'histogram') {
    histogramSeries = seriesRenderer._series;
  }
  return !chart.isTransposed
      ? _getNormalShadowRect(
          rect,
          isColumn,
          isHistogram,
          isRangeColumn,
          isStackedColumn,
          isStackedBar,
          chart,
          plotOffset,
          point1,
          point2,
          columnSeries,
          barSeries,
          stackedColumnSeries,
          stackedBarSeries,
          rangeColumnSeries,
          histogramSeries)
      : _getTransposedShadowRect(
          rect,
          isColumn,
          isHistogram,
          isRangeColumn,
          isStackedColumn,
          isStackedBar,
          chart,
          plotOffset,
          point1,
          point2,
          columnSeries,
          barSeries,
          stackedColumnSeries,
          stackedBarSeries,
          rangeColumnSeries,
          histogramSeries);
}

/// calculate shadow rectangle for normal rect series
Rect _getNormalShadowRect(
    Rect rect,
    bool isColumn,
    bool isHistogram,
    bool isRangeColumn,
    bool isStackedColumn,
    bool isStackedBar,
    SfCartesianChart chart,
    Offset plotOffset,
    _ChartLocation point1,
    _ChartLocation point2,
    ColumnSeries<dynamic, dynamic> columnSeries,
    BarSeries<dynamic, dynamic> barSeries,
    StackedColumnSeries<dynamic, dynamic> stackedColumnSeries,
    StackedBarSeries<dynamic, dynamic> stackedBarSeries,
    RangeColumnSeries<dynamic, dynamic> rangeColumnSeries,
    HistogramSeries<dynamic, dynamic> histogramSeries) {
  return Rect.fromLTWH(
      isColumn
          ? math.min(point1.x, point2.x) +
              (-columnSeries.trackBorderWidth - columnSeries.trackPadding)
          : isHistogram
              ? math.min(point1.x, point2.x) +
                  (-histogramSeries.trackBorderWidth -
                      histogramSeries.trackPadding)
              : isRangeColumn
                  ? math.min(point1.x, point2.x) +
                      (-rangeColumnSeries.trackBorderWidth -
                          rangeColumnSeries.trackPadding)
                  : isStackedColumn
                      ? math.min(point1.x, point2.x) +
                          (-stackedColumnSeries.trackBorderWidth -
                              stackedColumnSeries.trackPadding)
                      : isStackedBar
                          ? chart._chartAxis._axisClipRect.left
                          : chart._chartAxis._axisClipRect.left,
      isColumn || isHistogram || isRangeColumn
          ? rect.top
          : isStackedColumn
              ? rect.top
              : isStackedBar
                  ? (math.min(point1.y, point2.y) -
                      stackedBarSeries.trackBorderWidth -
                      stackedBarSeries.trackPadding)
                  : (math.min(point1.y, point2.y) -
                      barSeries.trackBorderWidth -
                      barSeries.trackPadding),
      isColumn
          ? (point2.x - point1.x).abs() +
              (columnSeries.trackBorderWidth * 2) +
              columnSeries.trackPadding * 2
          : isHistogram
              ? (point2.x - point1.x).abs() +
                  (histogramSeries.trackBorderWidth * 2) +
                  histogramSeries.trackPadding * 2
              : isRangeColumn
                  ? (point2.x - point1.x).abs() +
                      (rangeColumnSeries.trackBorderWidth * 2) +
                      rangeColumnSeries.trackPadding * 2
                  : isStackedColumn
                      ? (point2.x - point1.x).abs() +
                          (stackedColumnSeries.trackBorderWidth * 2) +
                          stackedColumnSeries.trackPadding * 2
                      : isStackedBar
                          ? chart._chartAxis._axisClipRect.width
                          : chart._chartAxis._axisClipRect.width,
      isColumn || isHistogram || isRangeColumn
          ? (chart._chartAxis._axisClipRect.height - 2 * plotOffset.dy)
          : isStackedColumn
              ? (chart._chartAxis._axisClipRect.height - 2 * plotOffset.dy)
              : isStackedBar
                  ? (point2.y - point1.y).abs() +
                      stackedBarSeries.trackBorderWidth * 2 +
                      stackedBarSeries.trackPadding * 2
                  : (point2.y - point1.y).abs() +
                      barSeries.trackBorderWidth * 2 +
                      barSeries.trackPadding * 2);
}

/// calculate shadow rectangle for transposed rect series
Rect _getTransposedShadowRect(
    Rect rect,
    bool isColumn,
    bool isHistogram,
    bool isRangeColumn,
    bool isStackedColumn,
    bool isStackedBar,
    SfCartesianChart chart,
    Offset plotOffset,
    _ChartLocation point1,
    _ChartLocation point2,
    ColumnSeries<dynamic, dynamic> columnSeries,
    BarSeries<dynamic, dynamic> barSeries,
    StackedColumnSeries<dynamic, dynamic> stackedColumnSeries,
    StackedBarSeries<dynamic, dynamic> stackedBarSeries,
    RangeColumnSeries<dynamic, dynamic> rangeColumnSeries,
    HistogramSeries<dynamic, dynamic> histogramSeries) {
  return Rect.fromLTWH(
      isColumn || isRangeColumn || isHistogram
          ? chart._chartAxis._axisClipRect.left
          : isStackedColumn
              ? chart._chartAxis._axisClipRect.left
              : isStackedBar
                  ? math.min(point1.x, point2.x) +
                      (-stackedBarSeries.trackBorderWidth -
                          stackedBarSeries.trackPadding)
                  : math.min(point1.x, point2.x) +
                      (-barSeries.trackBorderWidth - barSeries.trackPadding),
      isColumn
          ? (math.min(point1.y, point2.y) -
              columnSeries.trackBorderWidth -
              columnSeries.trackPadding)
          : isHistogram
              ? (math.min(point1.y, point2.y) -
                  histogramSeries.trackBorderWidth -
                  histogramSeries.trackPadding)
              : isRangeColumn
                  ? (math.min(point1.y, point2.y) -
                      rangeColumnSeries.trackBorderWidth -
                      rangeColumnSeries.trackPadding)
                  : isStackedColumn
                      ? (math.min(point1.y, point2.y) -
                          stackedColumnSeries.trackBorderWidth -
                          stackedColumnSeries.trackPadding)
                      : isStackedBar ? rect.top : rect.top,
      isColumn || isRangeColumn || isHistogram
          ? chart._chartAxis._axisClipRect.width
          : isStackedColumn
              ? chart._chartAxis._axisClipRect.width
              : isStackedBar
                  ? (point2.x - point1.x).abs() +
                      (stackedBarSeries.trackBorderWidth * 2) +
                      stackedBarSeries.trackPadding * 2
                  : (point2.x - point1.x).abs() +
                      (barSeries.trackBorderWidth * 2) +
                      barSeries.trackPadding * 2,
      isColumn
          ? ((point2.y - point1.y).abs() +
              columnSeries.trackBorderWidth * 2 +
              columnSeries.trackPadding * 2)
          : isHistogram
              ? ((point2.y - point1.y).abs() +
                  histogramSeries.trackBorderWidth * 2 +
                  histogramSeries.trackPadding * 2)
              : isRangeColumn
                  ? (point2.y - point1.y).abs() +
                      rangeColumnSeries.trackBorderWidth * 2 +
                      rangeColumnSeries.trackPadding * 2
                  : isStackedColumn
                      ? (point2.y - point1.y).abs() +
                          stackedColumnSeries.trackBorderWidth * 2 +
                          stackedColumnSeries.trackPadding * 2
                      : isStackedBar
                          ? (chart._chartAxis._axisClipRect.height -
                              2 * plotOffset.dy)
                          : (chart._chartAxis._axisClipRect.height -
                              2 * plotOffset.dy));
}

/// Calculated the side by side range for Column and bar series
_VisibleRange _calculateSideBySideInfo(
    CartesianSeriesRenderer seriesRenderer, SfCartesianChart chart) {
  num rectPosition;
  num count;
  num seriesSpacing;
  num pointSpacing;
  final dynamic series = seriesRenderer._series;
  if (seriesRenderer._seriesType == 'column' &&
      chart.enableSideBySideSeriesPlacement) {
    final ColumnSeriesRenderer columnSeriesRenderer = seriesRenderer;
    _calculateSideBySidePositions(columnSeriesRenderer, chart);
    rectPosition = columnSeriesRenderer._rectPosition;
    count = columnSeriesRenderer._rectCount;
  } else if (seriesRenderer._seriesType == 'histogram' &&
      chart.enableSideBySideSeriesPlacement) {
    final HistogramSeriesRenderer histogramSeriesRenderer = seriesRenderer;
    _calculateSideBySidePositions(histogramSeriesRenderer, chart);
    rectPosition = histogramSeriesRenderer._rectPosition;
    count = histogramSeriesRenderer._rectCount;
  } else if (seriesRenderer._seriesType == 'bar' &&
      chart.enableSideBySideSeriesPlacement) {
    final BarSeriesRenderer barSeriesRenderer = seriesRenderer;
    _calculateSideBySidePositions(barSeriesRenderer, chart);
    rectPosition = barSeriesRenderer._rectPosition;
    count = barSeriesRenderer._rectCount;
  } else if ((seriesRenderer._seriesType.contains('stackedcolumn') ||
          seriesRenderer._seriesType.contains('stackedbar')) &&
      chart.enableSideBySideSeriesPlacement) {
    final _StackedSeriesRenderer stackedRectSeriesRenderer = seriesRenderer;
    _calculateSideBySidePositions(stackedRectSeriesRenderer, chart);
    rectPosition = stackedRectSeriesRenderer._rectPosition;
    count = stackedRectSeriesRenderer._rectCount;
  } else if (seriesRenderer._seriesType == 'rangecolumn' &&
      chart.enableSideBySideSeriesPlacement) {
    final RangeColumnSeriesRenderer rangeColumnSeriesRenderer = seriesRenderer;
    _calculateSideBySidePositions(rangeColumnSeriesRenderer, chart);
    rectPosition = rangeColumnSeriesRenderer._rectPosition;
    count = rangeColumnSeriesRenderer._rectCount;
  } else if (seriesRenderer._seriesType == 'hilo' &&
      chart.enableSideBySideSeriesPlacement) {
    final HiloSeriesRenderer hiloSeriesRenderer = seriesRenderer;
    _calculateSideBySidePositions(hiloSeriesRenderer, chart);
    rectPosition = hiloSeriesRenderer._rectPosition;
    count = hiloSeriesRenderer._rectCount;
  } else if (seriesRenderer._seriesType == 'hiloopenclose' &&
      chart.enableSideBySideSeriesPlacement) {
    final HiloOpenCloseSeriesRenderer hiloOpenCloseSeriesRenderer =
        seriesRenderer;
    _calculateSideBySidePositions(hiloOpenCloseSeriesRenderer, chart);
    rectPosition = hiloOpenCloseSeriesRenderer._rectPosition;
    count = hiloOpenCloseSeriesRenderer._rectCount;
  } else if (seriesRenderer._seriesType == 'candle' &&
      chart.enableSideBySideSeriesPlacement) {
    final CandleSeriesRenderer candleSeriesRenderer = seriesRenderer;
    _calculateSideBySidePositions(candleSeriesRenderer, chart);
    rectPosition = candleSeriesRenderer._rectPosition;
    count = candleSeriesRenderer._rectCount;
  }

  if (seriesRenderer._seriesType == 'column') {
    final ColumnSeries<dynamic, dynamic> columnSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? columnSeries.spacing : 0;
    pointSpacing = columnSeries.width;
  } else if (seriesRenderer._seriesType == 'histogram') {
    final HistogramSeries<dynamic, dynamic> histogramSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? histogramSeries.spacing : 0;
    pointSpacing = histogramSeries.width;
  } else if (seriesRenderer._seriesType == 'stackedcolumn' ||
      seriesRenderer._seriesType == 'stackedcolumn100' ||
      seriesRenderer._seriesType == 'stackedbar' ||
      seriesRenderer._seriesType == 'stackedbar100') {
    final _StackedSeriesBase<dynamic, dynamic> stackedRectSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? stackedRectSeries.spacing : 0;
    pointSpacing = stackedRectSeries.width;
  } else if (seriesRenderer._seriesType == 'rangecolumn') {
    final RangeColumnSeries<dynamic, dynamic> rangeColumnSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? rangeColumnSeries.spacing : 0;
    pointSpacing = rangeColumnSeries.width;
  } else if (seriesRenderer._seriesType == 'hilo') {
    final HiloSeries<dynamic, dynamic> hiloSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? hiloSeries.spacing : 0;
    pointSpacing = hiloSeries.width;
  } else if (seriesRenderer._seriesType == 'hiloopenclose') {
    final HiloOpenCloseSeries<dynamic, dynamic> hiloOpenCloseSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? hiloOpenCloseSeries.spacing : 0;
    pointSpacing = hiloOpenCloseSeries.width;
  } else if (seriesRenderer._seriesType == 'candle') {
    final CandleSeries<dynamic, dynamic> candleSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? candleSeries.spacing : 0;
    pointSpacing = candleSeries.width;
  } else {
    final BarSeries<dynamic, dynamic> barSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? barSeries.spacing : 0;
    pointSpacing = barSeries.width;
  }
  final num position =
      !chart.enableSideBySideSeriesPlacement ? 0 : rectPosition;
  final num rectCount = !chart.enableSideBySideSeriesPlacement ? 1 : count;

  /// Gets the minimum point delta in series
  final num minPointsDelta = seriesRenderer._minDelta ??
      _calculateMinPointsDelta(
          seriesRenderer._xAxis, chart._chartState.seriesRenderers, chart);
  final num width = minPointsDelta * pointSpacing;
  final num location = position / rectCount - 0.5;
  _VisibleRange doubleRange =
      _VisibleRange(location, location + (1 / rectCount));

  /// Side by side range will be calculated based on calculated width.
  if ((doubleRange.minimum is num) && (doubleRange.maximum is num)) {
    doubleRange =
        _VisibleRange(doubleRange.minimum * width, doubleRange.maximum * width);
    doubleRange.delta = doubleRange.maximum - doubleRange.minimum;
    final num radius = seriesSpacing * doubleRange.delta;
    doubleRange = _VisibleRange(
        doubleRange.minimum + radius / 2, doubleRange.maximum - radius / 2);
    doubleRange.delta = doubleRange.maximum - doubleRange.minimum;
  }
  return doubleRange;
}

/// The method returns rotated text location for the given angle
_ChartLocation _getRotatedTextLocation(double pointX, double pointY,
    String labelText, TextStyle textStyle, int angle, ChartAxis axis) {
  if (angle > 0) {
    final Size textSize = _measureText(labelText, textStyle);
    final Size rotateTextSize = _measureText(labelText, textStyle, angle);

    /// label rotation for 0 to 90
    pointX += ((rotateTextSize.width - textSize.width).abs() / 2) +
        (((angle > 90 ? 90 : angle) / 90) * textSize.height);

    /// label rotation for 90 to 180
    pointX += (angle > 90) ? (rotateTextSize.width - textSize.height).abs() : 0;
    pointY += (angle > 90)
        ? (angle / 180) * textSize.height -
            (((180 - angle) / 180) * textSize.height)
        : 0;

    /// label rotation 180 to 270
    pointX -= (angle > 180) ? (angle / 270) * textSize.height : 0;
    pointY += (angle > 180)
        ? (rotateTextSize.height - textSize.height).abs() -
            (angle / 270) * textSize.height
        : 0;

    /// label rotation 270 to 360
    pointX -=
        (angle > 270) ? (rotateTextSize.width - textSize.height).abs() : 0;
    pointY -= (angle > 270)
        ? (((angle - 270) / 90) * textSize.height) +
            (textSize.height * ((angle - 270) / 90)) / 2
        : 0;

    if (axis != null && axis.labelRotation.isNegative) {
      final num rotation = axis.labelRotation.abs();
      if (rotation > 15 && rotation < 90) {
        pointX -= (rotateTextSize.width - textSize.height).abs() / 2;
        pointY -= ((90 - rotation) / 90) / 2 * textSize.height;
      } else if (rotation > 90 && rotation < 180) {
        pointX += rotation > 164
            ? 0
            : (rotateTextSize.width - textSize.height).abs() / 2 +
                ((rotation - 90) / 90) / 2 * textSize.height;
        pointY += (rotation / 180) / 2 * textSize.height;
      } else if (rotation > 195 && rotation < 270) {
        pointX -= (rotateTextSize.width - textSize.height).abs() / 2;
      } else if (rotation > 270 && rotation < 360) {
        pointX += (rotateTextSize.width - textSize.height).abs() / 2;
      }
    }
  }
  return _ChartLocation(pointX, pointY);
}

bool _isSameSeries(dynamic oldSeries, dynamic newSeries) {
  return oldSeries.runtimeType == newSeries.runtimeType &&
      oldSeries.key == newSeries.key;
}

/// Calculate the side by side position for Rect series
void _calculateSideBySidePositions(
    CartesianSeriesRenderer seriesRenderer, SfCartesianChart chart) {
  final List<CartesianSeriesRenderer> seriesCollection =
      _findRectSeriesCollection(chart);
  num rectCount = 0;
  num position;
  final num seriesLength = seriesCollection.length;
  List<_StackingGroup> stackingGroupPos;
  for (CartesianSeriesRenderer seriesRenderer in seriesCollection) {
    if (seriesRenderer is ColumnSeriesRenderer) {
      seriesRenderer._rectPosition = rectCount++;
      seriesRenderer._rectCount = seriesLength;
    } else if (seriesRenderer is BarSeriesRenderer) {
      seriesRenderer._rectPosition = rectCount++;
      seriesRenderer._rectCount = seriesLength;
    } else if (seriesRenderer is RangeColumnSeriesRenderer) {
      seriesRenderer._rectPosition = rectCount++;
      seriesRenderer._rectCount = seriesLength;
    } else if (seriesRenderer is HiloSeriesRenderer) {
      seriesRenderer._rectPosition = rectCount++;
      seriesRenderer._rectCount = seriesLength;
    } else if (seriesRenderer is HiloOpenCloseSeriesRenderer) {
      seriesRenderer._rectPosition = rectCount++;
      seriesRenderer._rectCount = seriesLength;
    } else if (seriesRenderer is HistogramSeriesRenderer) {
      seriesRenderer._rectPosition = rectCount++;
      seriesRenderer._rectCount = seriesLength;
    } else if (seriesRenderer is CandleSeriesRenderer) {
      seriesRenderer._rectPosition = rectCount++;
      seriesRenderer._rectCount = seriesLength;
    }
  }
  if (seriesRenderer is _StackedSeriesRenderer) {
    for (int i = 0; i < seriesCollection.length; i++) {
      _StackedSeriesBase<dynamic, dynamic> series;
      if (seriesCollection[i] is _StackedSeriesRenderer) {
        seriesRenderer = seriesCollection[i];
        series = seriesRenderer._series;
      }
      if (seriesRenderer != null && seriesRenderer is _StackedSeriesRenderer) {
        final String groupName = series.groupName;
        if (groupName != null) {
          stackingGroupPos ??= <_StackingGroup>[];
          if (stackingGroupPos.isEmpty) {
            seriesRenderer._rectPosition = rectCount;
            stackingGroupPos.add(_StackingGroup(groupName, rectCount++));
          } else if (stackingGroupPos.isNotEmpty) {
            for (int j = 0; j < stackingGroupPos.length; j++) {
              if (groupName == stackingGroupPos[j].groupName) {
                seriesRenderer._rectPosition = stackingGroupPos[j].stackCount;
                break;
              } else if (groupName != stackingGroupPos[j].groupName &&
                  j == stackingGroupPos.length - 1) {
                seriesRenderer._rectPosition = rectCount;
                stackingGroupPos.add(_StackingGroup(groupName, rectCount++));
                break;
              }
            }
          }
        } else {
          if (position == null) {
            seriesRenderer._rectPosition = rectCount;
            position = rectCount++;
          } else {
            seriesRenderer._rectPosition = position;
          }
        }
      }
    }
  }
  if (seriesRenderer._seriesType.contains('stackedcolumn') ||
      seriesRenderer._seriesType.contains('stackedbar')) {
    for (int i = 0; i < seriesCollection.length; i++) {
      _StackedSeriesRenderer seriesRenderer;
      if (seriesCollection[i] is _StackedSeriesRenderer) {
        seriesRenderer = seriesCollection[i];
      }
      if (seriesRenderer != null) {
        seriesRenderer._rectCount = rectCount;
      }
    }
  }
}

/// Find the column and bar series collection in axes.
List<CartesianSeriesRenderer> _findSeriesCollection(SfCartesianChart chart,
    [bool isRect]) {
  final List<CartesianSeriesRenderer> seriesRendererCollection =
      <CartesianSeriesRenderer>[];
  for (int xAxisIndex = 0;
      xAxisIndex < chart._chartAxis._horizontalAxes.length;
      xAxisIndex++) {
    final ChartAxis xAxis = chart._chartAxis._horizontalAxes[xAxisIndex];
    for (int xSeriesIndex = 0;
        xSeriesIndex < xAxis._seriesRenderers.length;
        xSeriesIndex++) {
      final CartesianSeriesRenderer xAxisSeriesRenderer =
          xAxis._seriesRenderers[xSeriesIndex];
      for (int yAxisIndex = 0;
          yAxisIndex < chart._chartAxis._verticalAxes.length;
          yAxisIndex++) {
        final ChartAxis yAxis = chart._chartAxis._verticalAxes[yAxisIndex];
        for (int ySeriesIndex = 0;
            ySeriesIndex < yAxis._seriesRenderers.length;
            ySeriesIndex++) {
          final CartesianSeriesRenderer yAxisSeriesRenderer =
              yAxis._seriesRenderers[ySeriesIndex];
          if (xAxisSeriesRenderer == yAxisSeriesRenderer &&
              (xAxisSeriesRenderer._seriesType.contains('column') ||
                  xAxisSeriesRenderer._seriesType.contains('bar') ||
                  xAxisSeriesRenderer._seriesType.contains('hilo') ||
                  xAxisSeriesRenderer._seriesType.contains('candle') ||
                  xAxisSeriesRenderer._seriesType.contains('stackedarea') ||
                  xAxisSeriesRenderer._seriesType.contains('stackedline') ||
                  xAxisSeriesRenderer._seriesType == 'histogram') &&
              xAxisSeriesRenderer._visible) {
            seriesRendererCollection.add(yAxisSeriesRenderer);
          }
        }
      }
    }
  }
  return seriesRendererCollection;
}

RRect getRRectFromRect(Rect rect, BorderRadius borderRadius) {
  return RRect.fromRectAndCorners(
    rect,
    bottomLeft: borderRadius.bottomLeft,
    bottomRight: borderRadius.bottomRight,
    topLeft: borderRadius.topLeft,
    topRight: borderRadius.topRight,
  );
}

List<CartesianSeriesRenderer> _findRectSeriesCollection(
    SfCartesianChart chart) {
  final List<CartesianSeriesRenderer> seriesRenderCollection =
      <CartesianSeriesRenderer>[];
  for (int xAxisIndex = 0;
      xAxisIndex < chart._chartAxis._horizontalAxes.length;
      xAxisIndex++) {
    final ChartAxis xAxis = chart._chartAxis._horizontalAxes[xAxisIndex];
    for (int xSeriesIndex = 0;
        xSeriesIndex < xAxis._seriesRenderers.length;
        xSeriesIndex++) {
      final CartesianSeriesRenderer xAxisSeriesRenderer =
          xAxis._seriesRenderers[xSeriesIndex];
      for (int yAxisIndex = 0;
          yAxisIndex < chart._chartAxis._verticalAxes.length;
          yAxisIndex++) {
        final ChartAxis yAxis = chart._chartAxis._verticalAxes[yAxisIndex];
        for (int ySeriesIndex = 0;
            ySeriesIndex < yAxis._seriesRenderers.length;
            ySeriesIndex++) {
          final CartesianSeriesRenderer yAxisSeriesRenderer =
              yAxis._seriesRenderers[ySeriesIndex];
          if (xAxisSeriesRenderer == yAxisSeriesRenderer &&
              (xAxisSeriesRenderer._seriesType.contains('column') ||
                  xAxisSeriesRenderer._seriesType.contains('bar') ||
                  xAxisSeriesRenderer._seriesType.contains('hilo') ||
                  xAxisSeriesRenderer._seriesType == 'candle' ||
                  xAxisSeriesRenderer._seriesType == 'histogram') &&
              xAxisSeriesRenderer._visible) {
            seriesRenderCollection.add(yAxisSeriesRenderer);
          }
        }
      }
    }
  }
  return seriesRenderCollection;
}

Rect _calculatePlotOffset(Rect axisClipRect, Offset plotOffset) =>
    Rect.fromLTWH(
        axisClipRect.left + plotOffset.dx,
        axisClipRect.top + plotOffset.dy,
        axisClipRect.width - 2 * plotOffset.dx,
        axisClipRect.height - 2 * plotOffset.dy);

///Get gradient fill colors
Paint _getLinearGradientPaint(
    LinearGradient gradientFill, Rect region, bool isInvertedAxis) {
  Paint gradientPaint;
  gradientPaint = Paint()
    ..shader = gradientFill.createShader(region)
    ..style = PaintingStyle.fill;
  return gradientPaint;
}

/// It returns the actual label value for tooltip and data label etc
dynamic _getLabelValue(dynamic value, dynamic axis, [int showDigits]) {
  if (value.toString().split('.').length > 1) {
    final String str = value.toString();
    final List<dynamic> list = str.split('.');
    value = axis is LogarithmicAxis ? math.pow(10, value) : value;
    value = double.parse(value.toStringAsFixed(showDigits ?? 3));
    value = (list[1] == '0' ||
            list[1] == '00' ||
            list[1] == '000' ||
            list[1] == '0000' ||
            list[1] == '00000' ||
            list[1] == '000000' ||
            list[1] == '0000000')
        ? value.round()
        : value;
  }
  final dynamic text = axis is NumericAxis && axis.numberFormat != null
      ? axis.numberFormat.format(value)
      : value;
  return (axis.labelFormat != null && axis.labelFormat != '')
      ? axis.labelFormat.replaceAll(RegExp('{value}'), text.toString())
      : text.toString();
}

/// Calculate the X value from the current screen point
double _pointToXValue(
    SfCartesianChart chart, ChartAxis axis, Rect rect, double x, double y) {
  if (axis != null) {
    if (!chart._requireInvertedAxis) {
      return _coefficientToValue(x / rect.width, axis);
    }
    return _coefficientToValue(1 - (y / rect.height), axis);
  }
  return double.nan;
}

/// Calculate the Y value from the current screen point
// ignore: unused_element
double _pointToYValue(
    SfCartesianChart chart, ChartAxis axis, Rect rect, double x, double y) {
  if (axis != null) {
    if (!chart._requireInvertedAxis) {
      return _coefficientToValue(1 - (y / rect.height), axis);
    }
    return _coefficientToValue(x / rect.width, axis);
  }
  return double.nan;
}

num _coefficientToValue(double coefficient, ChartAxis axis) {
  double result;
  coefficient = axis.isInversed ? 1 - coefficient : coefficient;
  result =
      axis._visibleRange.minimum + (axis._visibleRange.delta * coefficient);
  return result;
}

void _needsRepaintChart(SfCartesianChart chart, SfCartesianChart oldChart) {
  if (chart._chartSeries.visibleSeriesRenderers.length ==
      oldChart._chartSeries.visibleSeriesRenderers.length) {
    for (int seriesIndex = 0;
        seriesIndex < chart.series.length;
        seriesIndex++) {
      _canRepaintChartSeries(chart, oldChart, seriesIndex);
    }
  } else {
    // ignore: avoid_function_literals_in_foreach_calls
    chart._chartState.seriesRenderers.forEach(
        (ChartSeriesRenderer seriesRenderer) =>
            seriesRenderer._needsRepaint = true);
  }
  if (chart._chartAxis._axisCollections.length ==
      oldChart._chartAxis._axisCollections.length) {
    for (int axisIndex = 0; axisIndex < chart.series.length; axisIndex++) {
      _canRepaintAxis(chart, oldChart, axisIndex);
      if (chart._chartAxis._needsRepaint) {
        break;
      }
    }
  } else {
    chart._chartAxis._needsRepaint = true;
  }
}

void _canRepaintChartSeries(
    SfCartesianChart chart, SfCartesianChart oldChart, int seriesIndex) {
  final CartesianSeriesRenderer seriesRenderer =
      chart._chartState.seriesRenderers[seriesIndex];
  final CartesianSeries<dynamic, dynamic> series = seriesRenderer._series;
  final CartesianSeriesRenderer oldWidgetSeriesRenderer =
      oldChart._chartSeries.visibleSeriesRenderers[seriesIndex];
  final CartesianSeries<dynamic, dynamic> oldWidgetSeries =
      oldWidgetSeriesRenderer._series;
  if (series.animationDuration != oldWidgetSeries.animationDuration ||
      oldChart._chartSeries != chart._chartSeries ||
      series.color?.value != oldWidgetSeries.color?.value ||
      series.width != oldWidgetSeries.width ||
      series.isVisible != oldWidgetSeries.isVisible ||
      series.enableTooltip != oldWidgetSeries.enableTooltip ||
      series.name != oldWidgetSeries.name ||
      series.gradient != oldWidgetSeries.gradient ||
      seriesRenderer._xAxis?._visibleRange?.delta !=
          oldWidgetSeriesRenderer._xAxis?._visibleRange?.delta ||
      seriesRenderer._xAxis?._visibleRange?.maximum !=
          oldWidgetSeriesRenderer._xAxis?._visibleRange?.maximum ||
      seriesRenderer._xAxis?._visibleRange?.minimum !=
          oldWidgetSeriesRenderer._xAxis?._visibleRange?.minimum ||
      seriesRenderer._xAxis?._visibleRange?.interval !=
          oldWidgetSeriesRenderer._xAxis?._visibleRange?.interval ||
      seriesRenderer._xAxis?.isVisible !=
          oldWidgetSeriesRenderer._xAxis?.isVisible ||
      seriesRenderer._xAxis?._bounds !=
          oldWidgetSeriesRenderer._xAxis?._bounds ||
      seriesRenderer._xAxis?.isInversed !=
          oldWidgetSeriesRenderer._xAxis?.isInversed ||
      seriesRenderer._xAxis?.desiredIntervals !=
          oldWidgetSeriesRenderer._xAxis?.desiredIntervals ||
      seriesRenderer._xAxis?.enableAutoIntervalOnZooming !=
          oldWidgetSeriesRenderer._xAxis?.enableAutoIntervalOnZooming ||
      seriesRenderer._xAxis?.opposedPosition !=
          oldWidgetSeriesRenderer._xAxis?.opposedPosition ||
      seriesRenderer._xAxis?._orientation !=
          oldWidgetSeriesRenderer._xAxis?._orientation ||
      seriesRenderer._xAxis?.plotOffset !=
          oldWidgetSeriesRenderer._xAxis?.plotOffset ||
      seriesRenderer._xAxis?.rangePadding !=
          oldWidgetSeriesRenderer._xAxis?.rangePadding ||
      seriesRenderer._dataPoints?.length !=
          oldWidgetSeriesRenderer._dataPoints?.length ||
      seriesRenderer._yAxis?._visibleRange?.delta !=
          oldWidgetSeriesRenderer._yAxis?._visibleRange?.delta ||
      seriesRenderer._yAxis?._visibleRange?.maximum !=
          oldWidgetSeriesRenderer._yAxis?._visibleRange?.maximum ||
      seriesRenderer._yAxis?._visibleRange?.minimum !=
          oldWidgetSeriesRenderer._yAxis?._visibleRange?.minimum ||
      seriesRenderer._yAxis?._visibleRange?.interval !=
          oldWidgetSeriesRenderer._yAxis?._visibleRange?.interval ||
      seriesRenderer._yAxis?.isVisible !=
          oldWidgetSeriesRenderer._yAxis?.isVisible ||
      seriesRenderer._yAxis?._bounds !=
          oldWidgetSeriesRenderer._yAxis?._bounds ||
      seriesRenderer._yAxis?.isInversed !=
          oldWidgetSeriesRenderer._yAxis?.isInversed ||
      seriesRenderer._yAxis?.desiredIntervals !=
          oldWidgetSeriesRenderer._yAxis?.desiredIntervals ||
      seriesRenderer._yAxis?.enableAutoIntervalOnZooming !=
          oldWidgetSeriesRenderer._yAxis?.enableAutoIntervalOnZooming ||
      seriesRenderer._yAxis?.opposedPosition !=
          oldWidgetSeriesRenderer._yAxis?.opposedPosition ||
      seriesRenderer._yAxis?._orientation !=
          oldWidgetSeriesRenderer._yAxis?._orientation ||
      seriesRenderer._yAxis?.plotOffset !=
          oldWidgetSeriesRenderer._yAxis?.plotOffset ||
      seriesRenderer._yAxis?.rangePadding !=
          oldWidgetSeriesRenderer._yAxis?.rangePadding ||
      series.animationDuration != oldWidgetSeries.animationDuration ||
      series.borderColor != oldWidgetSeries.borderColor ||
      series.borderWidth != oldWidgetSeries.borderWidth ||
      series.sizeValueMapper != oldWidgetSeries.sizeValueMapper ||
      series.emptyPointSettings.borderWidth !=
          oldWidgetSeries.emptyPointSettings.borderWidth ||
      series.emptyPointSettings.borderColor !=
          oldWidgetSeries.emptyPointSettings.borderColor ||
      series.emptyPointSettings.color !=
          oldWidgetSeries.emptyPointSettings.color ||
      series.emptyPointSettings.mode !=
          oldWidgetSeries.emptyPointSettings.mode ||
      seriesRenderer._maximumX != oldWidgetSeriesRenderer._maximumX ||
      seriesRenderer._maximumY != oldWidgetSeriesRenderer._maximumY ||
      seriesRenderer._minimumX != oldWidgetSeriesRenderer._minimumX ||
      seriesRenderer._minimumY != oldWidgetSeriesRenderer._minimumY ||
      series.dashArray?.length != oldWidgetSeries.dashArray?.length ||
      series.dataSource?.length != oldWidgetSeries.dataSource?.length ||
      series.markerSettings.width != oldWidgetSeries.markerSettings.width ||
      series.markerSettings.color?.value !=
          oldWidgetSeries.markerSettings.color?.value ||
      series.markerSettings.borderColor?.value !=
          oldWidgetSeries.markerSettings.borderColor?.value ||
      series.markerSettings.isVisible !=
          oldWidgetSeries.markerSettings.isVisible ||
      series.markerSettings.borderWidth !=
          oldWidgetSeries.markerSettings.borderWidth ||
      series.markerSettings.height != oldWidgetSeries.markerSettings.height ||
      series.markerSettings.shape != oldWidgetSeries.markerSettings.shape ||
      series.dataLabelSettings.color?.value !=
          oldWidgetSeries.dataLabelSettings.color?.value ||
      series.dataLabelSettings.isVisible !=
          oldWidgetSeries.dataLabelSettings.isVisible ||
      series.dataLabelSettings.labelAlignment !=
          oldWidgetSeries.dataLabelSettings.labelAlignment ||
      series.dataLabelSettings.opacity !=
          oldWidgetSeries.dataLabelSettings.opacity ||
      series.dataLabelSettings.alignment !=
          oldWidgetSeries.dataLabelSettings.alignment ||
      series.dataLabelSettings.angle !=
          oldWidgetSeries.dataLabelSettings.angle ||
      series.dataLabelSettings.textStyle?.color?.value !=
          oldWidgetSeries.dataLabelSettings.textStyle?.color?.value ||
      series.dataLabelSettings.textStyle?.fontStyle !=
          oldWidgetSeries.dataLabelSettings.textStyle?.fontStyle ||
      series.dataLabelSettings.textStyle?.fontFamily !=
          oldWidgetSeries.dataLabelSettings.textStyle?.fontFamily ||
      series.dataLabelSettings.textStyle?.fontSize !=
          oldWidgetSeries.dataLabelSettings.textStyle?.fontSize ||
      series.dataLabelSettings.textStyle?.fontWeight !=
          oldWidgetSeries.dataLabelSettings.textStyle?.fontWeight ||
      series.dataLabelSettings.borderColor?.value !=
          oldWidgetSeries.dataLabelSettings.borderColor?.value ||
      series.dataLabelSettings.borderWidth !=
          oldWidgetSeries.dataLabelSettings.borderWidth ||
      series.dataLabelSettings.margin?.right !=
          oldWidgetSeries.dataLabelSettings.margin?.right ||
      series.dataLabelSettings.margin?.bottom !=
          oldWidgetSeries.dataLabelSettings.margin?.bottom ||
      series.dataLabelSettings.margin?.top !=
          oldWidgetSeries.dataLabelSettings.margin?.top ||
      series.dataLabelSettings.margin?.left !=
          oldWidgetSeries.dataLabelSettings.margin?.left ||
      series.dataLabelSettings.borderRadius !=
          oldWidgetSeries.dataLabelSettings.borderRadius) {
    seriesRenderer._needsRepaint = true;
  } else {
    seriesRenderer._needsRepaint = false;
  }
}

void _canRepaintAxis(
    SfCartesianChart chart, SfCartesianChart oldChart, int axisIndex) {
  if (chart._chartAxis._axisCollections != null &&
      chart._chartAxis._axisCollections.isNotEmpty) {
    final ChartAxis axis = chart._chartAxis._axisCollections[axisIndex];
    final ChartAxis oldWidgetAxis =
        oldChart._chartAxis._axisCollections[axisIndex];
    if (axis.rangePadding.index != oldWidgetAxis.rangePadding.index ||
        axis.plotOffset != oldWidgetAxis.plotOffset ||
        axis._orientation != oldWidgetAxis._orientation ||
        axis.opposedPosition != oldWidgetAxis.opposedPosition ||
        axis.minorTicksPerInterval != oldWidgetAxis.minorTicksPerInterval ||
        axis.desiredIntervals != oldWidgetAxis.desiredIntervals ||
        axis.isInversed != oldWidgetAxis.isInversed ||
        axis._bounds != oldWidgetAxis._bounds ||
        axis.majorGridLines.dashArray?.length !=
            oldWidgetAxis.majorGridLines.dashArray?.length ||
        axis.majorGridLines.width != oldWidgetAxis.majorGridLines.width ||
        axis.majorGridLines.color != oldWidgetAxis.majorGridLines.color ||
        axis.title != oldWidgetAxis.title ||
        axis._visibleRange.interval != oldWidgetAxis._visibleRange.interval ||
        axis._visibleRange.minimum != oldWidgetAxis._visibleRange.minimum ||
        axis._visibleRange.maximum != oldWidgetAxis._visibleRange.maximum ||
        axis._visibleRange.delta != oldWidgetAxis._visibleRange.delta ||
        axis._isInsideTickPosition != oldWidgetAxis._isInsideTickPosition ||
        axis.maximumLabels != oldWidgetAxis.maximumLabels ||
        axis.minorGridLines.dashArray?.length !=
            oldWidgetAxis.minorGridLines.dashArray?.length ||
        axis.minorGridLines.width != oldWidgetAxis.minorGridLines.width ||
        axis.minorGridLines.color != oldWidgetAxis.minorGridLines.color ||
        axis.tickPosition.index != oldWidgetAxis.tickPosition.index) {
      chart._chartAxis._needsRepaint = true;
    } else {
      chart._chartAxis._needsRepaint = false;
    }
  }
}

dynamic _getInteractiveTooltipLabel(dynamic value, ChartAxis axis) {
  if (axis is CategoryAxis) {
    value = value < 0 ? 0 : value;
    value = axis._labels[
        (value.round() >= axis._labels.length ? value - 1 : value).round()];
  } else if (axis is DateTimeAxis) {
    final DateFormat dateFormat = axis.dateFormat ?? axis._getLabelFormat(axis);
    value =
        dateFormat.format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));
  } else {
    value = _getLabelValue(value, axis, axis.interactiveTooltip.decimalPlaces);
  }
  return value;
}

/// It returns the path of marker shapes
Path _getMarkerShapes(DataMarkerType markerType, Offset position, Size size,
    [CartesianSeriesRenderer seriesRenderer, int index]) {
  if (seriesRenderer._chart?.onMarkerRender != null) {
    final MarkerRenderArgs event =
        _triggerMarkerRenderEvent(seriesRenderer, size, markerType, index);
    markerType = event.shape;
    size = Size(event.markerHeight, event.markerWidth);
  }
  final Path path = Path();
  switch (markerType) {
    case DataMarkerType.circle:
      {
        _ChartShapeUtils._drawCircle(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.rectangle:
      {
        _ChartShapeUtils._drawRectangle(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.image:
      {
        if (seriesRenderer?._series != null) {
          _loadMarkerImage(seriesRenderer);
        }
      }
      break;
    case DataMarkerType.pentagon:
      {
        _ChartShapeUtils._drawPentagon(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.verticalLine:
      {
        _ChartShapeUtils._drawVerticalLine(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.invertedTriangle:
      {
        _ChartShapeUtils._drawInvertedTriangle(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.horizontalLine:
      {
        _ChartShapeUtils._drawHorizontalLine(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.diamond:
      {
        _ChartShapeUtils._drawDiamond(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.triangle:
      {
        _ChartShapeUtils._drawTriangle(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.none:
      break;
  }
  return path;
}

class _StackingInfo {
  _StackingInfo(this.groupName, this._stackingValues);
  String groupName;
  // ignore: prefer_final_fields
  List<double> _stackingValues;
}

class _StackingGroup {
  _StackingGroup(this.groupName, this.stackCount);

  String groupName;
  int stackCount;
}

// ignore: avoid_void_async
void _loadMarkerImage(CartesianSeriesRenderer seriesRenderer) async {
  final XyDataSeries<dynamic, dynamic> series = seriesRenderer._series;
  if (series.markerSettings != null &&
      (series.markerSettings.isVisible ||
          seriesRenderer._seriesType == 'scatter') &&
      series.markerSettings.shape == DataMarkerType.image &&
      series.markerSettings.image != null) {
    _calculateImage(null, seriesRenderer);
  }
}

/// It returns the chart location of the annotation
_ChartLocation _getAnnotationLocation(
    CartesianChartAnnotation annotation, SfCartesianChart chart) {
  final String xAxisName = annotation.xAxisName;
  final String yAxisName = annotation.yAxisName;
  ChartAxis xAxis, yAxis;
  Rect axisClipRect;
  num xValue;
  _ChartLocation location;
  if (annotation.coordinateUnit == CoordinateUnit.logicalPixel) {
    location = annotation.region == AnnotationRegion.chart
        ? _ChartLocation(annotation.x, annotation.y)
        : _ChartLocation(chart._chartAxis._axisClipRect.left + annotation.x,
            chart._chartAxis._axisClipRect.top + annotation.y);
  } else {
    for (int i = 0; i < chart._chartAxis._axisCollections.length; i++) {
      final ChartAxis axis = chart._chartAxis._axisCollections[i];
      if (xAxisName == axis._name ||
          (xAxisName == null && axis._name == 'primaryXAxis')) {
        xAxis = axis;
        if (xAxis is CategoryAxis) {
          if (annotation.x != null &&
              num.tryParse(annotation.x.toString()) != null) {
            xValue = num.tryParse(annotation.x.toString());
          } else if (xAxis._labels.length > 0) {
            xValue = xAxis._labels.indexOf(annotation.x);
          }
        } else if (xAxis is DateTimeAxis) {
          xValue = annotation.x is DateTime
              ? (annotation.x).millisecondsSinceEpoch
              : annotation.x;
        } else {
          xValue = annotation.x;
        }
      } else if (yAxisName == axis._name ||
          (yAxisName == null && axis._name == 'primaryYAxis')) {
        yAxis = axis;
      }
    }

    if (xAxis != null && yAxis != null) {
      axisClipRect = _calculatePlotOffset(chart._chartAxis._axisClipRect,
          Offset(xAxis.plotOffset, yAxis.plotOffset));
      location = _calculatePoint(xValue, annotation.y, xAxis, yAxis,
          chart._requireInvertedAxis, null, axisClipRect);
    }
  }
  return location;
}

void _drawTooltipArrowhead(
    Canvas canvas,
    Path backgroundPath,
    Paint fillPaint,
    Paint strokePaint,
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
    double x4,
    double y4) {
  backgroundPath.moveTo(x1, y1);
  backgroundPath.lineTo(x2, y2);
  backgroundPath.lineTo(x3, y3);
  backgroundPath.lineTo(x4, y4);
  backgroundPath.lineTo(x1, y1);
  fillPaint.isAntiAlias = true;
  canvas.drawPath(backgroundPath, strokePaint);
  canvas.drawPath(backgroundPath, fillPaint);
}

/// Calculate rounded rect from rect and corner radius
RRect _getRoundedCornerRect(Rect rect, double cornerRadius) =>
    RRect.fromRectAndCorners(
      rect,
      bottomLeft: Radius.circular(cornerRadius),
      bottomRight: Radius.circular(cornerRadius),
      topLeft: Radius.circular(cornerRadius),
      topRight: Radius.circular(cornerRadius),
    );

/// Calculate the X value from the current screen point
double _pointToXVal(
    SfCartesianChart chart, ChartAxis axis, Rect rect, double x, double y) {
  if (axis != null) {
    return _coefficientToValue(x / rect.width, axis);
  }
  return double.nan;
}

/// Calculate the Y value from the current screen point
double _pointToYVal(
    SfCartesianChart chart, ChartAxis axis, Rect rect, double x, double y) {
  if (axis != null) {
    return _coefficientToValue(1 - (y / rect.height), axis);
  }
  return double.nan;
}

/// It returns the x position of validated rect
Rect _validateRectXPosition(Rect labelRect, SfCartesianChart chart) {
  Rect validatedRect = labelRect;
  if (labelRect.right >= chart._chartAxis._axisClipRect.right) {
    validatedRect = Rect.fromLTRB(
        labelRect.left -
            (labelRect.right - chart._chartAxis._axisClipRect.right),
        labelRect.top,
        chart._chartAxis._axisClipRect.right,
        labelRect.bottom);
  } else if (labelRect.left <= chart._chartAxis._axisClipRect.left) {
    validatedRect = Rect.fromLTRB(
        chart._chartAxis._axisClipRect.left,
        labelRect.top,
        labelRect.right +
            (chart._chartAxis._axisClipRect.left - labelRect.left),
        labelRect.bottom);
  }
  return validatedRect;
}

/// It returns the y position of validated rect
Rect _validateRectYPosition(Rect labelRect, SfCartesianChart chart) {
  Rect validatedRect = labelRect;
  if (labelRect.bottom >= chart._chartAxis._axisClipRect.bottom) {
    validatedRect = Rect.fromLTRB(
        labelRect.left,
        labelRect.top -
            (labelRect.bottom - chart._chartAxis._axisClipRect.bottom),
        labelRect.right,
        chart._chartAxis._axisClipRect.bottom);
  } else if (labelRect.top <= chart._chartAxis._axisClipRect.top) {
    validatedRect = Rect.fromLTRB(
        labelRect.left,
        chart._chartAxis._axisClipRect.top,
        labelRect.right,
        labelRect.bottom +
            (chart._chartAxis._axisClipRect.top - labelRect.top));
  }
  return validatedRect;
}

/// This method will validate whether the tooltip exceeds the screen or not
Rect _validateRectBounds(Rect tooltipRect, Rect boundary) {
  Rect validatedRect = tooltipRect;
  double difference = 0;

  /// Padding between the corners
  const double padding = 0.5;

  if (tooltipRect.left < boundary.left) {
    difference = (boundary.left - tooltipRect.left) + padding;
    validatedRect = Rect.fromLTRB(
        validatedRect.left + difference,
        validatedRect.top,
        validatedRect.right + difference,
        validatedRect.bottom);
  }
  if (tooltipRect.right > boundary.right) {
    difference = (tooltipRect.right - boundary.right) + padding;
    validatedRect = Rect.fromLTRB(
        validatedRect.left - difference,
        validatedRect.top,
        validatedRect.right - difference,
        validatedRect.bottom);
  }
  if (tooltipRect.top < boundary.top) {
    difference = (boundary.top - tooltipRect.top) + padding;
    validatedRect = Rect.fromLTRB(
        validatedRect.left,
        validatedRect.top + difference,
        validatedRect.right,
        validatedRect.bottom + difference);
  }

  if (tooltipRect.bottom > boundary.bottom) {
    difference = (tooltipRect.bottom - boundary.bottom) + padding;
    validatedRect = Rect.fromLTRB(
        validatedRect.left,
        validatedRect.top - difference,
        validatedRect.right,
        validatedRect.bottom - difference);
  }

  return validatedRect;
}

/// To render a rect for stacked series
void _renderStackingRectSeries(
    Paint fillPaint,
    Paint strokePaint,
    Path path,
    double animationFactor,
    CartesianSeriesRenderer seriesRenderer,
    Canvas canvas,
    RRect segmentRect,
    CartesianChartPoint<dynamic> _currentPoint,
    int currentSegmentIndex) {
  final _StackedSeriesBase<dynamic, dynamic> series = seriesRenderer._series;
  if (series.selectionSettings.enable) {
    series.selectionSettings._selectionRenderer._checkWithSelectionState(
        seriesRenderer._segments[currentSegmentIndex], seriesRenderer._chart);
  }
  if (fillPaint != null) {
    series.animationDuration > 0
        ? _animateStackedRectSeries(
            canvas,
            segmentRect,
            fillPaint,
            seriesRenderer,
            animationFactor,
            _currentPoint,
            seriesRenderer._chart)
        : canvas.drawRRect(segmentRect, fillPaint);
  }
  if (strokePaint != null) {
    if (series.dashArray[0] != 0 && series.dashArray[1] != 0) {
      final XyDataSeries<dynamic, dynamic> _series = seriesRenderer._series;
      _drawDashedLine(canvas, _series.dashArray, strokePaint, path);
    } else {
      series.animationDuration > 0
          ? _animateStackedRectSeries(
              canvas,
              segmentRect,
              strokePaint,
              seriesRenderer,
              animationFactor,
              _currentPoint,
              seriesRenderer._chart)
          : canvas.drawRRect(segmentRect, strokePaint);
    }
  }
}

void _renderStackedAreaSeries(
    CartesianSeriesRenderer seriesRenderer,
    Paint fillPaint,
    Paint strokePaint,
    Canvas canvas,
    int _seriesIndex,
    Paint getFillPaint(),
    Path _path,
    Path _strokePath) {
  _drawStackedAreaPath(
      _path, _strokePath, seriesRenderer, canvas, fillPaint, strokePaint);
}

void _drawStackedAreaPath(
    Path _path,
    Path _strokePath,
    CartesianSeriesRenderer seriesRenderer,
    Canvas canvas,
    Paint fillPaint,
    Paint strokePaint) {
  Rect _pathRect;
  dynamic stackedAreaSegment;
  _pathRect = _path.getBounds();
  final XyDataSeries<dynamic, dynamic> _series = seriesRenderer._series;
  stackedAreaSegment = seriesRenderer._segments[0];
  stackedAreaSegment._pathRect = _pathRect;
  if (_series.selectionSettings.enable) {
    _series.selectionSettings._selectionRenderer._checkWithSelectionState(
        seriesRenderer._segments[0], seriesRenderer._chart);
  }
  canvas.drawPath(
      _path,
      (_series.gradient == null)
          ? fillPaint
          : seriesRenderer._segments[0].getFillPaint());
  strokePaint = seriesRenderer._segments[0].getStrokePaint();

  if (strokePaint.color != Colors.transparent) {
    _drawDashedLine(canvas, _series.dashArray, strokePaint, _strokePath);
  }
}

void _renderStackedLineSeries(_StackedSeriesBase<dynamic, dynamic> series,
    Canvas canvas, Paint strokePaint, num x1, num y1, num x2, num y2) {
  final Path path = Path();
  path.moveTo(x1, y1);
  path.lineTo(x2, y2);
  _drawDashedLine(canvas, series.dashArray, strokePaint, path);
}

/// Painter method for stacked area series
void _stackedAreaPainter(
    Canvas canvas,
    dynamic seriesRenderer,
    SfCartesianChart chart,
    Animation<double> seriesAnimation,
    Animation<double> chartElementAnimation,
    _PainterKey painterKey) {
  Rect clipRect, axisClipRect;
  final int seriesIndex = painterKey.index;
  seriesRenderer.storeSeriesProperties(chart, seriesIndex);
  double animationFactor;

  /// Clip rect will be added for series.
  if (seriesRenderer._visible) {
    final dynamic series = seriesRenderer._series;
    canvas.save();
    axisClipRect = _calculatePlotOffset(
        seriesRenderer._chart._chartAxis._axisClipRect,
        Offset(seriesRenderer._xAxis.plotOffset,
            seriesRenderer._yAxis.plotOffset));
    canvas.clipRect(axisClipRect);
    animationFactor = seriesAnimation != null ? seriesAnimation.value : 1;
    if ((!(chart._chartState.widgetNeedUpdate ||
                chart._chartState._isLegendToggled) ||
            !chart._chartState._oldSeriesKeys.contains(series.key)) &&
        series.animationDuration > 0) {
      _performLinearAnimation(seriesRenderer._chart, seriesRenderer._xAxis,
          canvas, animationFactor);
    }

    final Path _path = Path(), _strokePath = Path();
    final Rect rect = seriesRenderer._chart._chartAxis._axisClipRect;
    _ChartLocation point1, point2;
    final ChartAxis xAxis = seriesRenderer._xAxis,
        yAxis = seriesRenderer._yAxis;
    CartesianChartPoint<dynamic> point;
    final dynamic _series = seriesRenderer._series;
    if (seriesRenderer._dataPoints.isNotEmpty) {
      int startPoint = 0;
      final _StackedValues stackedValues = seriesRenderer._stackingValues[0];
      List<CartesianSeriesRenderer> seriesRendererCollection;
      CartesianSeriesRenderer previousSeriesRenderer;
      seriesRendererCollection = _findSeriesCollection(seriesRenderer._chart);
      point1 = _calculatePoint(
          seriesRenderer._dataPoints[0].xValue,
          math_lib.max(
              yAxis._visibleRange.minimum, stackedValues.startValues[0]),
          xAxis,
          yAxis,
          seriesRenderer._chart._requireInvertedAxis,
          _series,
          rect);
      _path.moveTo(point1.x, point1.y);
      _strokePath.moveTo(point1.x, point1.y);
      for (int pointIndex = 0;
          pointIndex < seriesRenderer._dataPoints.length;
          pointIndex++) {
        seriesRenderer.calculateRegionData(
            chart, seriesRenderer, seriesIndex, point, pointIndex);
        point = seriesRenderer._dataPoints[pointIndex];
        if (point.isVisible) {
          point1 = _calculatePoint(
              seriesRenderer._dataPoints[pointIndex].xValue,
              stackedValues.endValues[pointIndex],
              xAxis,
              yAxis,
              seriesRenderer._chart._requireInvertedAxis,
              _series,
              rect);
          _path.lineTo(point1.x, point1.y);
          _strokePath.lineTo(point1.x, point1.y);
        } else {
          if (_series.emptyPointSettings.mode != EmptyPointMode.drop) {
            for (int j = pointIndex - 1; j >= startPoint; j--) {
              point2 = _calculatePoint(
                  seriesRenderer._dataPoints[j].xValue,
                  stackedValues.startValues[j],
                  xAxis,
                  yAxis,
                  seriesRenderer._chart._requireInvertedAxis,
                  _series,
                  rect);
              _path.lineTo(point2.x, point2.y);
              if (_series.borderDrawMode == BorderDrawMode.excludeBottom)
                _strokePath.lineTo(point1.x, point2.y);
              else if (_series.borderDrawMode == BorderDrawMode.all)
                _strokePath.lineTo(point2.x, point2.y);
            }
            if (seriesRenderer._dataPoints.length > pointIndex + 1 &&
                seriesRenderer._dataPoints[pointIndex + 1] != null &&
                seriesRenderer._dataPoints[pointIndex + 1].isVisible) {
              point1 = _calculatePoint(
                  seriesRenderer._dataPoints[pointIndex + 1].xValue,
                  stackedValues.startValues[pointIndex + 1],
                  xAxis,
                  yAxis,
                  seriesRenderer._chart._requireInvertedAxis,
                  _series,
                  rect);
              _path.moveTo(point1.x, point1.y);
              _strokePath.moveTo(point1.x, point1.y);
            }
            startPoint = pointIndex + 1;
          }
        }
        if (pointIndex >= seriesRenderer._dataPoints.length - 1) {
          seriesRenderer.addSegment(painterKey.index, chart, animationFactor);
        }
      }
      for (int j = seriesRenderer._dataPoints.length - 1;
          j >= startPoint;
          j--) {
        previousSeriesRenderer =
            _getPreviousSeriesRenderer(seriesRendererCollection, seriesIndex);
        if (previousSeriesRenderer._series.emptyPointSettings.mode !=
                EmptyPointMode.drop ||
            previousSeriesRenderer._dataPoints[j].isVisible) {
          point2 = _calculatePoint(
              seriesRenderer._dataPoints[j].xValue,
              stackedValues.startValues[j],
              xAxis,
              yAxis,
              seriesRenderer._chart._requireInvertedAxis,
              _series,
              rect);
          _path.lineTo(point2.x, point2.y);
          if (_series.borderDrawMode == BorderDrawMode.excludeBottom)
            _strokePath.lineTo(point1.x, point2.y);
          else if (_series.borderDrawMode == BorderDrawMode.all)
            _strokePath.lineTo(point2.x, point2.y);
        }
      }
    }
    if (_path != null &&
        seriesRenderer._segments != null &&
        seriesRenderer._segments.isNotEmpty) {
      final dynamic areaSegment = seriesRenderer._segments[0];
      seriesRenderer.drawSegment(
          canvas,
          areaSegment
            .._path = _path
            .._strokePath = _strokePath);
    }

    clipRect = _calculatePlotOffset(
        Rect.fromLTRB(
            seriesRenderer._chart._chartAxis._axisClipRect.left -
                _series.markerSettings.width,
            seriesRenderer._chart._chartAxis._axisClipRect.top -
                _series.markerSettings.height,
            seriesRenderer._chart._chartAxis._axisClipRect.right +
                _series.markerSettings.width,
            seriesRenderer._chart._chartAxis._axisClipRect.bottom +
                _series.markerSettings.height),
        Offset(seriesRenderer._xAxis.plotOffset,
            seriesRenderer._yAxis.plotOffset));
    canvas.restore();
    if ((_series.animationDuration <= 0 ||
            !chart._chartState.initialRender ||
            animationFactor >= chart._seriesDurationFactor) &&
        (_series.markerSettings.isVisible ||
            _series.dataLabelSettings.isVisible)) {
      canvas.clipRect(clipRect);
      seriesRenderer.renderSeriesElements(chart, canvas, chartElementAnimation);
    }
    if (animationFactor >= 1) {
      chart._chartState.setPainterKey(painterKey.index, painterKey.name, true);
    }
  }
}

CartesianSeriesRenderer _getPreviousSeriesRenderer(
    List<CartesianSeriesRenderer> seriesRendererCollection, num seriesIndex) {
  for (int i = 0; i < seriesRendererCollection.length; i++) {
    if (seriesIndex ==
            seriesRendererCollection.indexOf(seriesRendererCollection[i]) &&
        i != 0) {
      return seriesRendererCollection[i - 1];
    }
  }
  return seriesRendererCollection[0];
}

/// Rect painter for stacked series
void _stackedRectPainter(
    Canvas canvas,
    dynamic seriesRenderer,
    SfCartesianChart chart,
    Animation<double> seriesAnimation,
    Animation<double> chartElementAnimation,
    _PainterKey painterKey) {
  if (seriesRenderer._visible) {
    canvas.save();
    Rect clipRect, axisClipRect;
    CartesianChartPoint<dynamic> point;
    final XyDataSeries<dynamic, dynamic> series = seriesRenderer._series;
    final int seriesIndex = painterKey.index;
    seriesRenderer.storeSeriesProperties(chart, seriesIndex);
    double animationFactor;
    animationFactor = seriesAnimation != null &&
            !(chart._chartState.widgetNeedUpdate ||
                chart._chartState._isLegendToggled)
        ? seriesAnimation.value
        : 1;

    /// Clip rect will be added for series.
    axisClipRect = _calculatePlotOffset(
        chart._chartAxis._axisClipRect,
        Offset(seriesRenderer._xAxis.plotOffset,
            seriesRenderer._yAxis.plotOffset));
    canvas.clipRect(axisClipRect);
    int segmentIndex = -1;
    for (int pointIndex = 0;
        pointIndex < seriesRenderer._dataPoints.length;
        pointIndex++) {
      point = seriesRenderer._dataPoints[pointIndex];
      seriesRenderer.calculateRegionData(
          chart, seriesRenderer, painterKey.index, point, pointIndex);
      if (point.isVisible && !point.isGap) {
        seriesRenderer.drawSegment(
            canvas,
            seriesRenderer.addSegment(
                point, segmentIndex += 1, painterKey.index, animationFactor));
      }
    }
    clipRect = _calculatePlotOffset(
        Rect.fromLTRB(
            chart._chartAxis._axisClipRect.left - series.markerSettings.width,
            chart._chartAxis._axisClipRect.top - series.markerSettings.height,
            chart._chartAxis._axisClipRect.right + series.markerSettings.width,
            chart._chartAxis._axisClipRect.bottom +
                series.markerSettings.height),
        Offset(seriesRenderer._xAxis.plotOffset,
            seriesRenderer._yAxis.plotOffset));
    canvas.restore();
    if ((series.animationDuration <= 0 ||
            !chart._chartState.initialRender ||
            animationFactor >= chart._seriesDurationFactor) &&
        (series.markerSettings.isVisible ||
            series.dataLabelSettings.isVisible)) {
      canvas.clipRect(clipRect);
      seriesRenderer.renderSeriesElements(chart, canvas, chartElementAnimation);
    }
    if (animationFactor >= 1) {
      chart._chartState.setPainterKey(painterKey.index, painterKey.name, true);
    }
  }
}

void _stackedLinePainter(
    Canvas canvas,
    dynamic seriesRenderer,
    Animation<double> seriesAnimation,
    SfCartesianChart chart,
    Animation<double> chartElementAnimation,
    _PainterKey painterKey) {
  Rect clipRect;
  double animationFactor;
  if (seriesRenderer._visible) {
    final dynamic series = seriesRenderer._series;
    canvas.save();
    animationFactor = seriesAnimation != null ? seriesAnimation.value : 1;
    final int seriesIndex = painterKey.index;
    _StackedValues stackedValues;
    seriesRenderer.storeSeriesProperties(chart, seriesIndex);
    if (seriesRenderer is _StackedSeriesRenderer &&
        seriesRenderer._stackingValues.isNotEmpty)
      stackedValues = seriesRenderer._stackingValues[0];

    /// Clip rect will be added for series.
    final Rect axisClipRect = _calculatePlotOffset(
        seriesRenderer._chart._chartAxis._axisClipRect,
        Offset(seriesRenderer._xAxis.plotOffset,
            seriesRenderer._yAxis.plotOffset));
    canvas.clipRect(axisClipRect);
    if ((!(chart._chartState.widgetNeedUpdate ||
                chart._chartState._isLegendToggled) ||
            !chart._chartState._oldSeriesKeys.contains(series.key)) &&
        series.animationDuration > 0) {
      _performLinearAnimation(seriesRenderer._chart, seriesRenderer._xAxis,
          canvas, animationFactor);
    }

    int segmentIndex = -1;
    double currentCummulativePos, nextCummulativePos;
    CartesianChartPoint<dynamic> startPoint, endPoint, currentPoint, _nextPoint;
    for (int pointIndex = 0;
        pointIndex < seriesRenderer._dataPoints.length;
        pointIndex++) {
      currentPoint = seriesRenderer._dataPoints[pointIndex];
      seriesRenderer.calculateRegionData(
          chart, seriesRenderer, seriesIndex, currentPoint, pointIndex);
      if ((currentPoint.isVisible && !currentPoint.isGap) &&
          startPoint == null &&
          stackedValues != null) {
        startPoint = currentPoint;
        currentCummulativePos = stackedValues.endValues[pointIndex];
      }
      if (pointIndex + 1 < seriesRenderer._dataPoints.length) {
        _nextPoint = seriesRenderer._dataPoints[pointIndex + 1];
        if (startPoint != null && _nextPoint.isGap) {
          startPoint = null;
        } else if (_nextPoint.isVisible &&
            !_nextPoint.isGap &&
            stackedValues != null) {
          endPoint = _nextPoint;
          nextCummulativePos = stackedValues.endValues[pointIndex + 1];
        }
      }

      if (startPoint != null && endPoint != null) {
        seriesRenderer.drawSegment(
            canvas,
            seriesRenderer.addSegment(
                startPoint,
                endPoint,
                segmentIndex += 1,
                seriesIndex,
                animationFactor,
                currentCummulativePos,
                nextCummulativePos));
        endPoint = startPoint = null;
      }
    }
    clipRect = _calculatePlotOffset(
        Rect.fromLTRB(
            seriesRenderer._chart._chartAxis._axisClipRect.left -
                series.markerSettings.width,
            seriesRenderer._chart._chartAxis._axisClipRect.top -
                series.markerSettings.height,
            seriesRenderer._chart._chartAxis._axisClipRect.right +
                series.markerSettings.width,
            seriesRenderer._chart._chartAxis._axisClipRect.bottom +
                series.markerSettings.height),
        Offset(seriesRenderer._xAxis.plotOffset,
            seriesRenderer._yAxis.plotOffset));
    canvas.restore();
    if ((series.animationDuration <= 0 ||
            !chart._chartState.initialRender ||
            animationFactor >= chart._seriesDurationFactor) &&
        (series.markerSettings.isVisible ||
            series.dataLabelSettings.isVisible)) {
      canvas.clipRect(clipRect);
      seriesRenderer.renderSeriesElements(chart, canvas, chartElementAnimation);
    }
    if (animationFactor >= 1) {
      chart._chartState.setPainterKey(seriesIndex, painterKey.name, true);
    }
  }
}

/// To find MonotonicSpline
List<num> _getMonotonicSpline(List<num> xValues, List<num> yValues,
    List<num> yCoef, int dataCount, List<num> dx) {
  final int count = dataCount;
  int index = -1;

  final dynamic slope = List<dynamic>(count - 1);
  final dynamic coefficient = List<num>(count);

  for (int i = 0; i < count - 1; i++) {
    dx[i] = xValues[i + 1] - xValues[i];
    slope[i] = (yValues[i + 1] - yValues[i]) / dx[i];
    if (slope[i].toDouble() == double.infinity) {
      slope[i] = 0;
    }
  }
  // Add the first and last coefficient value as Slope[0] and Slope[n-1]
  if (slope.length == 0) {
    return null;
  }

  slope[0] == double.nan
      ? coefficient[++index] = 0
      : coefficient[++index] = slope[0];

  for (int i = 0; i < dx.length - 1; i++) {
    if (slope.length > i + 1) {
      final dynamic m = slope[i], next = slope[i + 1];
      if (m * next <= 0) {
        coefficient[++index] = 0;
      } else {
        if (dx[i] == 0) {
          coefficient[++index] = 0;
        } else {
          final double firstPoint = dx[i].toDouble(),
              _nextPoint = dx[i + 1].toDouble();
          final double interPoint = firstPoint + _nextPoint;
          coefficient[++index] = 3 *
              interPoint /
              (((interPoint + _nextPoint) / m) +
                  ((interPoint + firstPoint) / next));
        }
      }
    }
  }
  slope[slope.length - 1] == double.nan
      ? coefficient[++index] = 0
      : coefficient[++index] = slope[slope.length - 1];

  yCoef.addAll(coefficient);

  return yCoef;
}

/// To find CardinalSpline
List<num> _getCardinalSpline(List<num> xValues, List<num> yValues,
    List<num> yCoef, int dataCount, double tension) {
  if (tension < 0.1) {
    tension = 0;
  } else if (tension > 1) {
    tension = 1;
  }

  final int count = dataCount;

  final dynamic tangentsX = List<num>(count);

  for (int i = 0; i < count; i++) {
    if (i == 0 && xValues.length > 2) {
      tangentsX[i] = tension * (xValues[i + 2] - xValues[i]);
    } else if (i == count - 1 && count - 3 >= 0) {
      tangentsX[i] = tension * (xValues[count - 1] - xValues[count - 3]);
    } else if (i - 1 >= 0 && xValues.length > i + 1) {
      tangentsX[i] = tension * (xValues[i + 1] - xValues[i - 1]);
    }

    if (tangentsX[i] == double.nan) {
      tangentsX[i] = 0;
    }
  }

  yCoef.addAll(tangentsX);
  return yCoef;
}

/// To find NaturalSpline
List<num> _naturalSpline(List<num> xValues, List<num> yValues, List<num> yCoeff,
    int dataCount, SplineType splineType) {
  const double a = 6;
  final int count = dataCount;
  final dynamic yCoef = List<num>(count);

  final dynamic u = List<dynamic>(count);
  if (splineType == SplineType.clamped && xValues.length > 1) {
    u[0] = 0.5;
    final dynamic d0 = (xValues[1] - xValues[0]) / (yValues[1] - yValues[0]);
    final dynamic dn = (xValues[count - 1] - xValues[count - 2]) /
        (yValues[count - 1] - yValues[count - 2]);
    yCoef[0] =
        (3 * (yValues[1] - yValues[0]) / (xValues[1] - xValues[0])) - (3 * d0);
    yCoef[count - 1] = (3 * dn) -
        ((3 * (yValues[count - 1] - yValues[count - 2])) /
            (xValues[count - 1] - xValues[count - 2]));

    if (yCoef[0] == double.infinity || yCoef[0] == double.nan) {
      yCoef[0] = 0;
    }

    if (yCoef[count - 1] == double.infinity || yCoef[count - 1] == double.nan) {
      yCoef[count - 1] = 0;
    }
  } else {
    yCoef[0] = u[0] = 0;
    yCoef[count - 1] = 0;
  }

  for (int i = 1; i < count - 1; i++) {
    yCoef[i] = 0;
    if ((yValues[i + 1] != double.nan) &&
        (yValues[i - 1] != double.nan) &&
        (yValues[i] != double.nan) &&
        yValues[i + 1] != null &&
        xValues[i + 1] != null &&
        yValues[i - 1] != null &&
        xValues[i - 1] != null &&
        xValues[i] != null &&
        yValues[i] != null) {
      final double d1 = xValues[i].toDouble() - xValues[i - 1].toDouble();
      final double d2 = xValues[i + 1].toDouble() - xValues[i - 1].toDouble();
      final double d3 = xValues[i + 1].toDouble() - xValues[i].toDouble();
      final double dy1 = yValues[i + 1].toDouble() - yValues[i].toDouble();
      final double dy2 = yValues[i].toDouble() - yValues[i - 1].toDouble();
      if (xValues[i] == xValues[i - 1] || xValues[i] == xValues[i + 1]) {
        yCoef[i] = 0;
        u[i] = 0;
      } else {
        final dynamic p = 1 / ((d1 * yCoef[i - 1]) + (2 * d2));
        yCoef[i] = -p * d3;
        if (d1 != null && u[i - 1] != null) {
          u[i] = p * ((a * ((dy1 / d3) - (dy2 / d1))) - (d1 * u[i - 1]));
        }
      }
    }
  }

  for (int k = count - 2; k >= 0; k--) {
    if (u[k] != null && yCoef[k] != null && yCoef[k + 1] != null) {
      yCoef[k] = (yCoef[k] * yCoef[k + 1]) + u[k];
    }
  }

  yCoeff.addAll(yCoef);
  return yCoeff;
}

/// To find Monotonic ControlPoints
List<double> _calculateMonotonicControlPoints(
    double pointX,
    double pointY,
    double pointX1,
    double pointY1,
    double coefficientY,
    double coefficientY1,
    double dx) {
  final dynamic value = dx / 3;
  final List<double> values = List<double>(4);
  values[0] = pointX + value;
  values[1] = pointY + (coefficientY * value);
  values[2] = pointX1 - value;
  values[3] = pointY1 - (coefficientY1 * value);
  return values;
}

/// To find Cardinal ControlPoints
List<double> _calculateCardinalControlPoints(double pointX, double pointY,
    double pointX1, double pointY1, double coefficientY, double coefficientY1) {
  final List<double> values = List<double>(4);
  values[0] = pointX + (coefficientY / 3);
  values[1] = pointY + (coefficientY / 3);
  values[2] = pointX1 - (coefficientY1 / 3);
  values[3] = pointY1 - (coefficientY1 / 3);
  return values;
}

/// to trigger Marker event
MarkerRenderArgs _triggerMarkerRenderEvent(
    CartesianSeriesRenderer seriesRenderer,
    Size size,
    DataMarkerType markerType,
    int index) {
  MarkerRenderArgs markerargs;
  final XyDataSeries<dynamic, dynamic> series = seriesRenderer._series;
  series.markerSettings._color = series.markerSettings.color;
  if (seriesRenderer._chart.onMarkerRender != null) {
    markerargs = MarkerRenderArgs();
    markerargs.pointIndex = index;
    markerargs.markerHeight = size.height;
    markerargs.markerWidth = size.width;
    markerargs.shape = markerType;
    markerargs.color = series.markerSettings._color;
    markerargs.borderColor = series.markerSettings._borderColor;
    markerargs.borderWidth = series.markerSettings._borderWidth;
    seriesRenderer._chart.onMarkerRender(markerargs);
    size = Size(markerargs.markerWidth, markerargs.markerHeight);
    markerType = markerargs.shape;
    series.markerSettings._color = markerargs.color;
    series.markerSettings._borderColor = markerargs.borderColor;
    series.markerSettings._borderWidth = markerargs.borderWidth;
  }
  return markerargs;
}

/// To find Natural ControlPoints
List<double> _calculateControlPoints(List<num> xValues, List<num> yValues,
    double yCoef, double nextyCoef, int i) {
  final List<double> controlPoints = List<double>(4);
  final double yCoeff1 = yCoef;
  final double yCoeff2 = nextyCoef;
  final double x = xValues[i].toDouble();
  final double y = yValues[i].toDouble();
  final double nextX = xValues[i + 1].toDouble();
  final double nextY = yValues[i + 1].toDouble();
  const double oneThird = 1 / 3.0;
  double deltaX2 = nextX - x;
  deltaX2 = deltaX2 * deltaX2;
  final double dx1 = (2 * x) + nextX;
  final double dx2 = x + (2 * nextX);
  final double dy1 = (2 * y) + nextY;
  final double dy2 = y + (2 * nextY);
  final double y1 =
      oneThird * (dy1 - (oneThird * deltaX2 * (yCoeff1 + (0.5 * yCoeff2))));
  final double y2 =
      oneThird * (dy2 - (oneThird * deltaX2 * ((0.5 * yCoeff1) + yCoeff2)));
  final dynamic startControlPointsX = dx1 * oneThird;
  final dynamic startControlPointsY = y1;
  final dynamic endControlPointsX = dx2 * oneThird;
  final dynamic endControlPointsY = y2;
  controlPoints[0] = startControlPointsX;
  controlPoints[1] = startControlPointsY;
  controlPoints[2] = endControlPointsX;
  controlPoints[3] = endControlPointsY;
  return controlPoints;
}

void _calculateSplineAreaControlPoints(CartesianSeriesRenderer seriesRenderer) {
  final dynamic series = seriesRenderer._series;
  List<num> yCoef = <num>[];
  List<num> lowCoef = <num>[];
  List<num> highCoef = <num>[];
  final List<num> xValues = <num>[];
  final List<num> yValues = <num>[];
  final List<num> highValues = <num>[];
  final List<num> lowValues = <num>[];
  SplineType splineType;
  splineType = series.splineType;

  for (int i = 0; i < seriesRenderer._dataPoints.length; i++) {
    xValues.add(seriesRenderer._dataPoints[i].xValue);
    if (seriesRenderer is SplineAreaSeriesRenderer ||
        seriesRenderer is SplineSeriesRenderer) {
      yValues.add(seriesRenderer._dataPoints[i].yValue);
    } else if (seriesRenderer is SplineRangeAreaSeriesRenderer) {
      highValues.add(seriesRenderer._dataPoints[i].high);
      lowValues.add(seriesRenderer._dataPoints[i].low);
    }
  }

  if (xValues.isNotEmpty) {
    final List<num> dx = List<num>(xValues.length - 1);

    /// Check the type of spline
    if (splineType == SplineType.monotonic) {
      if (seriesRenderer is SplineAreaSeriesRenderer ||
          seriesRenderer is SplineSeriesRenderer) {
        yCoef =
            _getMonotonicSpline(xValues, yValues, yCoef, xValues.length, dx);
      } else {
        lowCoef = _getMonotonicSpline(
            xValues, lowValues, lowCoef, xValues.length, dx);
        highCoef = _getMonotonicSpline(
            xValues, highValues, highCoef, xValues.length, dx);
      }
    } else if (splineType == SplineType.cardinal) {
      if (series is SplineAreaSeries || series is SplineSeries)
        yCoef = _getCardinalSpline(xValues, yValues, yCoef, xValues.length,
            series.cardinalSplineTension);
      else {
        lowCoef = _getCardinalSpline(xValues, lowValues, lowCoef,
            xValues.length, series.cardinalSplineTension);
        highCoef = _getCardinalSpline(xValues, highValues, highCoef,
            xValues.length, series.cardinalSplineTension);
      }
    } else {
      if (series is SplineAreaSeries ||
          seriesRenderer is SplineSeriesRenderer) {
        yCoef =
            _naturalSpline(xValues, yValues, yCoef, xValues.length, splineType);
      } else {
        lowCoef = _naturalSpline(
            xValues, lowValues, lowCoef, xValues.length, splineType);
        highCoef = _naturalSpline(
            xValues, highValues, highCoef, xValues.length, splineType);
      }
    }
    if (seriesRenderer is SplineAreaSeriesRenderer ||
        seriesRenderer is SplineSeriesRenderer) {
      _updateSplineAreaControlPoints(
          seriesRenderer, splineType, xValues, yValues, yCoef, dx);
    } else {
      _findControlPoint(seriesRenderer, splineType, xValues, lowValues,
          highValues, dx, lowCoef, highCoef);
    }
  }
}

/// To update the dynamic points of the spline area
void _updateSplineAreaControlPoints(
    dynamic seriesRenderer,
    SplineType splineType,
    List<num> xValues,
    List<num> yValues,
    List<num> yCoef,
    List<num> dx) {
  for (int pointIndex = 0; pointIndex < xValues.length - 1; pointIndex++) {
    List<double> controlPoints = <double>[];
    seriesRenderer._drawPoints = <_ControlPoints>[];
    if (xValues[pointIndex] != null &&
        yValues[pointIndex] != null &&
        xValues[pointIndex + 1] != null &&
        yValues[pointIndex + 1] != null) {
      final double x = xValues[pointIndex].toDouble();
      final double y = yValues[pointIndex].toDouble();
      final double nextX = xValues[pointIndex + 1].toDouble();
      final double nextY = yValues[pointIndex + 1].toDouble();
      if (splineType == SplineType.monotonic) {
        controlPoints = _calculateMonotonicControlPoints(
            x,
            y,
            nextX,
            nextY,
            yCoef[pointIndex].toDouble(),
            yCoef[pointIndex + 1].toDouble(),
            dx[pointIndex].toDouble());
        seriesRenderer._drawPoints
            .add(_ControlPoints(controlPoints[0], controlPoints[1]));
        seriesRenderer._drawPoints
            .add(_ControlPoints(controlPoints[2], controlPoints[3]));
        seriesRenderer._drawControlPoints
            .add(_ListControlPoints(seriesRenderer._drawPoints));
      } else if (splineType == SplineType.cardinal) {
        controlPoints = _calculateCardinalControlPoints(x, y, nextX, nextY,
            yCoef[pointIndex].toDouble(), yCoef[pointIndex + 1].toDouble());
        seriesRenderer._drawPoints
            .add(_ControlPoints(controlPoints[0], controlPoints[1]));
        seriesRenderer._drawPoints
            .add(_ControlPoints(controlPoints[2], controlPoints[3]));
        seriesRenderer._drawControlPoints
            .add(_ListControlPoints(seriesRenderer._drawPoints));
      } else {
        controlPoints = _calculateControlPoints(
            xValues,
            yValues,
            yCoef[pointIndex].toDouble(),
            yCoef[pointIndex + 1].toDouble(),
            pointIndex);
        seriesRenderer._drawPoints
            .add(_ControlPoints(controlPoints[0], controlPoints[1]));
        seriesRenderer._drawPoints
            .add(_ControlPoints(controlPoints[2], controlPoints[3]));
        seriesRenderer._drawControlPoints
            .add(_ListControlPoints(seriesRenderer._drawPoints));
      }
    }
  }
}

/// calculate splinerangearea control point
void _findControlPoint(
    SplineRangeAreaSeriesRenderer seriesRenderer,
    SplineType splineType,
    List<num> xValues,
    List<num> lowValues,
    List<num> highValues,
    List<num> dx,
    List<num> lowCoef,
    List<num> highCoef) {
  for (int pointIndex = 0; pointIndex < xValues.length - 1; pointIndex++) {
    List<double> controlPointslow = <double>[];
    List<double> controlPointshigh = <double>[];
    seriesRenderer._drawLowPoints = <_ControlPoints>[];
    seriesRenderer._drawHighPoints = <_ControlPoints>[];
    if (xValues[pointIndex] != null &&
        seriesRenderer._dataPoints[pointIndex].low != null &&
        seriesRenderer._dataPoints[pointIndex].high != null &&
        xValues[pointIndex + 1] != null &&
        seriesRenderer._dataPoints[pointIndex + 1].low != null &&
        seriesRenderer._dataPoints[pointIndex + 1].high != null) {
      final double x = xValues[pointIndex].toDouble();
      final double low = seriesRenderer._dataPoints[pointIndex].low.toDouble();
      final double high =
          seriesRenderer._dataPoints[pointIndex].high.toDouble();
      final double nextX = xValues[pointIndex + 1].toDouble();
      final double nextlow =
          seriesRenderer._dataPoints[pointIndex + 1].low.toDouble();
      final double nexthigh =
          seriesRenderer._dataPoints[pointIndex + 1].high.toDouble();
      if (splineType == SplineType.monotonic) {
        controlPointslow = _calculateMonotonicControlPoints(
            x,
            low,
            nextX,
            nextlow,
            lowCoef[pointIndex].toDouble(),
            lowCoef[pointIndex + 1].toDouble(),
            dx[pointIndex].toDouble());
        seriesRenderer._drawLowPoints.add(_ControlPoints(
          controlPointslow[0],
          controlPointslow[1],
        ));
        seriesRenderer._drawLowPoints.add(_ControlPoints(
          controlPointslow[2],
          controlPointslow[3],
        ));
        seriesRenderer._drawLowControlPoints
            .add(_ListControlPoints(seriesRenderer._drawLowPoints));
        controlPointshigh = _calculateMonotonicControlPoints(
            x,
            high,
            nextX,
            nexthigh,
            highCoef[pointIndex].toDouble(),
            highCoef[pointIndex + 1].toDouble(),
            dx[pointIndex].toDouble());
        seriesRenderer._drawHighPoints.add(_ControlPoints(
          controlPointshigh[0],
          controlPointshigh[1],
        ));
        seriesRenderer._drawHighPoints.add(_ControlPoints(
          controlPointshigh[2],
          controlPointshigh[3],
        ));
        seriesRenderer._drawHighControlPoints
            .add(_ListControlPoints(seriesRenderer._drawHighPoints));
      } else if (splineType == SplineType.cardinal) {
        controlPointslow = _calculateCardinalControlPoints(
            x,
            low,
            nextX,
            nextlow,
            lowCoef[pointIndex].toDouble(),
            lowCoef[pointIndex + 1].toDouble());
        seriesRenderer._drawLowPoints.add(_ControlPoints(
          controlPointslow[0],
          controlPointslow[1],
        ));
        seriesRenderer._drawLowPoints.add(_ControlPoints(
          controlPointslow[2],
          controlPointslow[3],
        ));
        seriesRenderer._drawLowControlPoints
            .add(_ListControlPoints(seriesRenderer._drawLowPoints));
        controlPointshigh = _calculateCardinalControlPoints(
            x,
            high,
            nextX,
            nexthigh,
            highCoef[pointIndex].toDouble(),
            highCoef[pointIndex + 1].toDouble());
        seriesRenderer._drawHighPoints.add(_ControlPoints(
          controlPointshigh[0],
          controlPointshigh[1],
        ));
        seriesRenderer._drawHighPoints.add(_ControlPoints(
          controlPointshigh[2],
          controlPointshigh[3],
        ));
        seriesRenderer._drawHighControlPoints
            .add(_ListControlPoints(seriesRenderer._drawHighPoints));
      } else {
        controlPointslow = _calculateControlPoints(
            xValues,
            lowValues,
            lowCoef[pointIndex].toDouble(),
            lowCoef[pointIndex + 1].toDouble(),
            pointIndex);
        seriesRenderer._drawLowPoints.add(_ControlPoints(
          controlPointslow[0],
          controlPointslow[1],
        ));
        seriesRenderer._drawLowPoints.add(_ControlPoints(
          controlPointslow[2],
          controlPointslow[3],
        ));
        seriesRenderer._drawLowControlPoints
            .add(_ListControlPoints(seriesRenderer._drawLowPoints));
        controlPointshigh = _calculateControlPoints(
            xValues,
            highValues,
            highCoef[pointIndex].toDouble(),
            highCoef[pointIndex + 1].toDouble(),
            pointIndex);
        seriesRenderer._drawHighPoints
            .add(_ControlPoints(controlPointshigh[0], controlPointshigh[1]));
        seriesRenderer._drawHighPoints.add(_ControlPoints(
          controlPointshigh[2],
          controlPointshigh[3],
        ));
        seriesRenderer._drawHighControlPoints
            .add(_ListControlPoints(seriesRenderer._drawHighPoints));
      }
    }
  }
}

///get the old axis (for stock chart animation)
ChartAxis _getOldAxis(ChartAxis axis, List<ChartAxis> oldAxisList) {
  for (int i = 0; i < oldAxisList.length; i++) {
    if (oldAxisList[i]._name == axis._name) {
      return oldAxisList[i];
    }
  }
  return null;
}

bool _isRectContains(Rect rect, Offset pos) {
  return pos.dx >= rect.left &&
      pos.dx <= rect.right &&
      pos.dy >= rect.top &&
      pos.dy <= rect.bottom;
}

CartesianChartPoint<dynamic> _getChartPoint(
    XyDataSeriesRenderer seriesRenderer, dynamic data, int pointIndex) {
  dynamic xVal,
      yVal,
      highVal,
      lowVal,
      openVal,
      closeVal,
      volumeVal,
      sortVal,
      sizeVal,
      colorVal,
      textVal,
      minVal;
  CartesianChartPoint<dynamic> currentPoint;
  final dynamic series = seriesRenderer._series;
  final dynamic _xMap = series.xValueMapper;
  final dynamic _yMap = series.yValueMapper;
  final dynamic _highMap = series.highValueMapper;
  final dynamic _lowMap = series.lowValueMapper;
  final dynamic _sortFieldMap = series.sortFieldValueMapper;
  final dynamic _pointColorMap = series.pointColorMapper;
  final dynamic _sizeMap = series.sizeValueMapper;
  final dynamic _pointTextMap = series.dataLabelMapper;

  if (seriesRenderer is HistogramSeriesRenderer) {
    minVal = seriesRenderer._histogramValues.minValue;
    yVal = seriesRenderer._histogramValues.yValues
        .where((dynamic x) =>
            x >= minVal &&
            x < (minVal + seriesRenderer._histogramValues.binWidth))
        .length;
    xVal = minVal + seriesRenderer._histogramValues.binWidth / 2;
    minVal += seriesRenderer._histogramValues.binWidth;
    seriesRenderer._histogramValues.minValue = minVal;
  } else {
    if (_xMap != null) {
      xVal = _xMap(pointIndex);
    }

    if (_yMap != null) {
      yVal = (series is RangeColumnSeries ||
              series is RangeAreaSeries ||
              series is HiloSeries ||
              series is HiloOpenCloseSeries ||
              series is SplineRangeAreaSeries ||
              series is CandleSeries)
          ? null
          : _yMap(pointIndex);
    }
  }

  if (xVal != null) {
    if (_highMap != null) {
      highVal = _highMap(pointIndex);
    }

    if (_lowMap != null) {
      lowVal = _lowMap(pointIndex);
    }

    if (series is _FinancialSeriesBase) {
      final _FinancialSeriesBase<dynamic, dynamic> financialSeries =
          seriesRenderer._series;
      final dynamic _openMap = financialSeries.openValueMapper;
      final dynamic _closeMap = financialSeries.closeValueMapper;
      final dynamic _volumeMap = financialSeries.volumeValueMapper;

      if (_openMap != null) {
        openVal = _openMap(pointIndex);
      }

      if (_closeMap != null) {
        closeVal = _closeMap(pointIndex);
      }

      if (_volumeMap != null && financialSeries is HiloOpenCloseSeries) {
        volumeVal = _volumeMap(pointIndex);
      }
    }

    if (_sortFieldMap != null) {
      sortVal = _sortFieldMap(pointIndex);
    }

    if (_sizeMap != null) {
      sizeVal = _sizeMap(pointIndex);
    }

    if (_pointColorMap != null) {
      colorVal = _pointColorMap(pointIndex);
    }

    if (_pointTextMap != null) {
      textVal = _pointTextMap(pointIndex);
    }
    currentPoint = CartesianChartPoint<dynamic>(xVal, yVal, textVal, colorVal,
        sizeVal, highVal, lowVal, openVal, closeVal, volumeVal, sortVal);
  }
  return currentPoint;
}

//This method finds whether the given point has been updated/changed and returns a boolean value.
bool _findChangesInPoint(
    CartesianChartPoint<dynamic> point,
    CartesianChartPoint<dynamic> oldPoint,
    CartesianSeriesRenderer seriesRenderer) {
  if (seriesRenderer._series.sortingOrder ==
      seriesRenderer._oldSeries.sortingOrder) {
    if (seriesRenderer is _FinancialSerieBaseRenderer ||
        seriesRenderer._seriesType.contains('range') ||
        seriesRenderer._seriesType.contains('hilo')) {
      return point.x != oldPoint.x ||
          point.high != oldPoint.high ||
          point.low != oldPoint.low ||
          point.open != oldPoint.open ||
          point.close != oldPoint.close ||
          point.volume != oldPoint.volume ||
          point.sortValue != oldPoint.sortValue;
    } else {
      return point.x != oldPoint.x ||
          point.y != oldPoint.y ||
          point.bubbleSize != oldPoint.bubbleSize ||
          point.sortValue != oldPoint.sortValue;
    }
  } else {
    return true;
  }
}

_VisibleRange _calculateYRangeOnZoomX(
    _VisibleRange _actualRange, dynamic axis) {
  num _mini, _maxi;
  final List<CartesianSeriesRenderer> _seriesRenderers = axis._seriesRenderers;
  final num minimum = axis.minimum, maximum = axis.maximum;
  for (int i = 0;
      i < _seriesRenderers.length && _seriesRenderers.isNotEmpty;
      i++) {
    final dynamic xAxis = _seriesRenderers[i]._xAxis;
    xAxis._calculateRangeAndInterval(axis._chart);
    final _VisibleRange xRange = xAxis._visibleRange;
    if (_seriesRenderers[i]._yAxis == axis &&
        xRange != null &&
        _seriesRenderers[i]._visible)
      for (int j = 0; j < _seriesRenderers[i]._dataPoints.length; j++) {
        final CartesianChartPoint<dynamic> point =
            _seriesRenderers[i]._dataPoints[j];
        if (point.xValue >= xRange.minimum && point.xValue <= xRange.maximum) {
          if (point.yValue != null) {
            _mini = min(_mini ?? point.yValue, point.yValue);
            _maxi = max(_maxi ?? point.yValue, point.yValue);
          } else if (point.high != null && point.low != null) {
            _mini = min(_mini ?? point.low, point.low);
            _maxi = max(_maxi ?? point.high, point.high);
          }
        }
      }
  }
  return _VisibleRange(minimum ?? (_mini ?? _actualRange.minimum),
      maximum ?? (_maxi ?? _actualRange.maximum));
}

bool _needCalculateYrange(num minimum, num maximum, SfCartesianChart chart,
    AxisOrientation _orientation) {
  return (chart._chartState.zoomedState == true ||
          chart._chartState.zoomProgress ||
          chart._chartState.rangeChangeBySlider) &&
      !(minimum != null && maximum != null) &&
      (!chart._requireInvertedAxis
          ? (_orientation == AxisOrientation.vertical &&
              chart.zoomPanBehavior.zoomMode == ZoomMode.x)
          : (_orientation == AxisOrientation.horizontal &&
              chart.zoomPanBehavior.zoomMode == ZoomMode.y));
}

class _ControlPoints {
  _ControlPoints(this.controlPoint1, this.controlPoint2);
  final double controlPoint1;
  final double controlPoint2;
}

class _ListControlPoints {
  _ListControlPoints(this._listControlPoints);
  final List<_ControlPoints> _listControlPoints;
}
