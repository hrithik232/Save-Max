part of charts;

/// It is the data type for the circular chart and it has the properties is used to assign at the value
/// declaration of the circular chart.
///
/// It provides the options for color, stroke color, fill color, radius, angle to customize the circular chart.
///
class ChartPoint<D> {
  ChartPoint([this.x, this.y, this.radius, this.pointColor, this.sortValue]);

  /// X value of chart point
  dynamic x;

  /// Y value of chart point
  num y;

  /// Degree of chart point
  num degree;

  /// Start angle of chart point
  num startAngle;

  /// End angle of chart point
  num endAngle;

  /// Middle angle of chart point
  num midAngle;

  /// Center position of chart point
  Offset center;

  /// Text value of chart point
  String text;

  /// Fill  color of the chart point
  Color fill;

  /// Color of chart point
  Color color;

  /// Stroke color of chart point
  Color strokeColor;

  /// Sort value of chart point
  D sortValue;

  /// Stroke width of chart point
  num strokeWidth;

  /// Inner radius of chart point
  num innerRadius;

  /// Outer radius of chart point
  num outerRadius;

  /// To set the explode value of chart point
  bool isExplode;

  /// To set the shadow value of chart point
  bool isShadow;

  /// to set the empty value of chart point
  bool isEmpty = false;

  /// To set the visibility of chart point
  bool isVisible = true;

  /// To set the selected or unselected of chart point
  bool isSelected = false;

  /// Data label positin of chart point
  Position dataLabelPosition;

  /// Render position of chart point
  ChartDataLabelPosition renderPosition;

  /// Label rect of chart point.
  Rect labelRect;

  /// Size of the Data label of chart point
  Size dataLabelSize = const Size(0, 0);

  /// Saturation region value of chart point
  bool saturationRegionOutside = false;

  /// Y ratio of chart point
  num yRatio;

  /// Height Ratio of chart point
  num heightRatio;

  /// Radius of the chart point
  String radius;

  /// Color property of the chart point
  Color pointColor;
}

class _Region {
  _Region(
      this.start,
      this.end,
      this.startAngle,
      this.endAngle,
      this.seriesIndex,
      this.pointIndex,
      this.center,
      this.innerRadius,
      this.outerRadius);
  int seriesIndex;
  int pointIndex;
  num startAngle;
  num start;
  num end;
  num endAngle;
  Offset center;
  num innerRadius;
  num outerRadius;
}

class _StyleOptions {
  _StyleOptions(this.fill, this.strokeWidth, this.strokeColor, [this.opacity]);
  Color fill;
  Color strokeColor;
  double opacity;
  num strokeWidth;
}

/// This class holds the properties of the connector line.
///
/// ConnectorLineSetting is the Argument type of [DataLabelSettings], It is used to customize the data label connected lines while the data label
/// position is outside the chart. It is enabled by setting the data label visibility.
///
/// It provides the options for length, width, color, and enum type [ConnectorType] to customize the appearance.
///
class ConnectorLineSettings {
  ConnectorLineSettings(
      {this.length, double width, ConnectorType type, this.color})
      : width = width ?? 1.0,
        type = type ?? ConnectorType.line;

  ///Length of the connector line.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           dataLabelSettings: DataLabelSettings(
  ///            connectorLineSettings: ConnectorLineSettings(
  ///            length: '8%
  ///           )
  ///          )
  ///        ));
  ///}
  ///```
  final String length;

  ///Width of the connector line.
  ///
  ///Defaults to `1.0`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           dataLabelSettings: DataLabelSettings(
  ///            connectorLineSettings: ConnectorLineSettings(
  ///            width: 2
  ///           )
  ///          )
  ///        ));
  ///}
  ///```
  final double width;

  ///Color of the connector line.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           dataLabelSettings: DataLabelSettings(
  ///            connectorLineSettings: ConnectorLineSettings(
  ///            color: Colors.red,
  ///           )
  ///          )
  ///        ));
  ///}
  ///```
  final Color color;

  ///Type of the connector line.
  ///
  ///Defaults to `ConnectorType.line`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///           dataLabelSettings: DataLabelSettings(
  ///            connectorLineSettings: ConnectorLineSettings(
  ///             type: ConnectorType.curve
  ///           )
  ///          )
  ///        ));
  ///}
  ///```
  final ConnectorType type;
}

class _ChartInteraction {
  _ChartInteraction(this.seriesIndex, this.pointIndex, this.series, this.point,
      [this.region]);
  int seriesIndex;
  int pointIndex;
  dynamic series;
  dynamic point;
  _Region region;
}

/// Customizes the annotation of the circular chart.
///
///Circular chart allows you to mark the specific area of interest in the chart area.
/// You can add the custom widgets using this annotation feature, It has the properties for customizing the appearance.
///
/// You can able set the angle, alignment, height, and width of the inserted annotation.
///
/// It provides options for an angle, height, width, vertical and horizontal alignment to customize the appearance.
///
class CircularChartAnnotation {
  CircularChartAnnotation(
      {int angle,
      String radius,
      this.widget,
      String height,
      String width,
      ChartAlignment horizontalAlignment,
      ChartAlignment verticalAlignment})
      : angle = angle ?? 0,
        radius = radius ?? '0%',
        height = height ?? '0%',
        width = width ?? '0%',
        verticalAlignment = verticalAlignment ?? ChartAlignment.center,
        horizontalAlignment = horizontalAlignment ?? ChartAlignment.center;

  ///Angle to rotate the annotation.
  ///
  ///Defaults to `0`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            annotations: <CircularChartAnnotation>[
  ///                CircularChartAnnotation(
  ///                    angle: 40,
  ///                    child: Container(
  ///                    child: const Text('Empty data')),
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///```
  final int angle;

  ///Radius for placing the annotation.
  ///
  ///The value ranges from 0% to 100%.
  ///
  ///Defaults to `0%`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            annotations: <CircularChartAnnotation>[
  ///                CircularChartAnnotation(
  ///                    radius: '10%'
  ///                    child: Container(
  ///                    child: const Text('Empty data'),
  ///               ),
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///```
  final String radius;

  ///Considers any widget as annotation.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            annotations: <CircularChartAnnotation>[
  ///                CircularChartAnnotation(
  ///                    child: Container(
  ///                     child:Text('Annotation')),
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///```
  final Widget widget;

  ///Height of the annotation.
  ///
  ///Defaults to `0%`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            annotations: <CircularChartAnnotation>[
  ///                CircularChartAnnotation(
  ///                    height: '10%',
  ///                    child: Container(
  ///                    child: const Text('Empty data'),
  ///                 ),
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///```
  final String height;

  ///Width of the annotation.
  ///
  ///Defaults to `0%`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            annotations: <CircularChartAnnotation>[
  ///                CircularChartAnnotation(
  ///                    width: '10%',
  ///                    child: Container(
  ///                    child: const Text('Empty data'),
  ///                 ),
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///```
  final String width;

  ///Aligns the annotation horizontally.
  ///
  ///Alignment can be set to near, far, or center.
  ///
  ///Defaults to `ChartAlignment.center`
  ///
  ///Also refer [ChartAlignment]
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            annotations: <CircularChartAnnotation>[
  ///                CircularChartAnnotation(
  ///                    horizontalAlignment: ChartAlignment.near
  ///                    child: Container(
  ///                    child: const Text('Empty data'),
  ///                 ),
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///```
  final ChartAlignment horizontalAlignment;

  ///Aligns the annotation vertically.
  ///
  ///Alignment can be set to near, far, or center.
  ///
  ///Defaults to `ChartAlignment.center`
  ///
  ///Also refer [ChartAlignment]
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCircularChart(
  ///            annotations: <CircularChartAnnotation>[
  ///                CircularChartAnnotation(
  ///                    verticalAlignment: ChartAlignment.near
  ///                    child: Container(
  ///                    child: const Text('Empty data'),
  ///                 ),
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///```
  final ChartAlignment verticalAlignment;
}

///To get circular series data label saturation color
Color _getCircularDataLabelColor(ChartPoint<dynamic> currentPoint,
    CircularSeriesRenderer seriesRenderer, SfCircularChart chart) {
  Color color;
  final DataLabelSettings dataLabel = seriesRenderer._series.dataLabelSettings;
  final String _seriesType = seriesRenderer._seriesType == 'pie'
      ? 'Pie'
      : seriesRenderer._seriesType == 'doughnut'
          ? 'Doughnut'
          : seriesRenderer._seriesType == 'radialbar' ? 'RadialBar' : 'Default';
  switch (_seriesType) {
    case 'Pie':
    case 'Doughnut':
      if (currentPoint.renderPosition == ChartDataLabelPosition.inside &&
          !currentPoint.saturationRegionOutside) {
        color = _getInnerColor(
            dataLabel._color, currentPoint.fill, chart._chartState._chartTheme);
      } else {
        color = _getOuterColor(
            dataLabel._color,
            dataLabel.useSeriesColor
                ? currentPoint.fill
                : (chart.backgroundColor ??
                    chart._chartState._chartTheme.plotAreaBackgroundColor),
            chart._chartState._chartTheme);
      }
      break;
    case 'RadialBar':
      final RadialBarSeries<dynamic, dynamic> radialBar =
          seriesRenderer._series;
      color = radialBar.trackColor;
      break;
    default:
      color = Colors.white;
  }
  return _getSaturationColor(color);
}

///To get inner data label color
Color _getInnerColor(
        Color dataLabelColor, Color pointColor, SfChartThemeData theme) =>
    dataLabelColor != null
        ? dataLabelColor
        : pointColor != null
            ? pointColor
            : theme.brightness == Brightness.light
                ? const Color.fromRGBO(255, 255, 255, 1)
                : Colors.black;

///To get outer data label color
Color _getOuterColor(
        Color dataLabelColor, Color backgroundColor, SfChartThemeData theme) =>
    dataLabelColor != null
        ? dataLabelColor
        : backgroundColor != Colors.transparent
            ? backgroundColor
            : theme.brightness == Brightness.light
                ? const Color.fromRGBO(255, 255, 255, 1)
                : Colors.black;

bool _checkIsAnyPointSelect(CircularSeriesRenderer seriesRenderer,
    ChartPoint<dynamic> point, SfCircularChart chart) {
  bool isAnyPointSelected = false;
  final CircularSeries<dynamic, dynamic> series = seriesRenderer._series;
  if (series.initialSelectedDataIndexes.isNotEmpty) {
    for (int i = 0; i < series.initialSelectedDataIndexes.length; i++) {
      final int data = series.initialSelectedDataIndexes[i];
      for (int j = 0; j < seriesRenderer._renderPoints.length; j++) {
        if (j == data) {
          isAnyPointSelected = true;
          break;
        }
      }
    }
  }
  return isAnyPointSelected;
}
