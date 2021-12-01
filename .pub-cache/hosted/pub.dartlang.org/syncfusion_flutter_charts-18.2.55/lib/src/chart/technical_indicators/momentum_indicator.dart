part of charts;

/// Renders the momentum indicator.
///
/// This class renders the momentum indicator, it also has a centerline. The [centerLineColor] and [centerLineWidth]
/// property is used to define centerline.
///
/// Provides the options for visibility, centerline color, centerline width, and period values to customize the appearance.
///
class MomentumIndicator<T, D> extends TechnicalIndicators<T, D> {
  MomentumIndicator({
    bool isVisible,
    String xAxisName,
    String yAxisName,
    String seriesName,
    List<double> dashArray,
    double animationDuration,
    List<T> dataSource,
    ChartValueMapper<T, D> xValueMapper,
    ChartValueMapper<T, num> highValueMapper,
    ChartValueMapper<T, num> lowValueMapper,
    ChartValueMapper<T, num> openValueMapper,
    ChartValueMapper<T, num> closeValueMapper,
    String name,
    bool isVisibleInLegend,
    LegendIconType legendIconType,
    String legendItemText,
    Color signalLineColor,
    double signalLineWidth,
    int period,
    final Color centerLineColor,
    final double centerLineWidth,
  })  : centerLineColor = centerLineColor ?? Colors.red,
        centerLineWidth = centerLineWidth ?? 2,
        super(
            isVisible: isVisible,
            xAxisName: xAxisName,
            yAxisName: yAxisName,
            seriesName: seriesName,
            dashArray: dashArray,
            animationDuration: animationDuration,
            dataSource: dataSource,
            xValueMapper: xValueMapper,
            highValueMapper: highValueMapper,
            lowValueMapper: lowValueMapper,
            openValueMapper: openValueMapper,
            closeValueMapper: closeValueMapper,
            name: name,
            isVisibleInLegend: isVisibleInLegend,
            legendIconType: legendIconType,
            legendItemText: legendItemText,
            signalLineColor: signalLineColor,
            signalLineWidth: signalLineWidth,
            period: period);

  /// Center line color of the momentum indicator
  ///
  /// Defaults to `Colors.red`
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///               indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///                        MomentumIndicator<dynamic, dynamic>(
  ///                        centerLineColor: Color.red,
  ///                         ),]
  ///         ));
  /// }
  /// ```
  final Color centerLineColor;

  /// Center line width of the momentum indicator
  ///
  /// Defaults to `2`
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///               indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///                        MomentumIndicator<dynamic, dynamic>(
  ///                        centerLineWidth: 3,
  ///                         ),]
  ///         ));
  /// }
  /// ```
  final double centerLineWidth;

// ignore:unused_element
  void _initSeriesCollection(
      MomentumIndicator<dynamic, dynamic> indicator, SfCartesianChart chart) {
    indicator._targetSeriesRenderers = <CartesianSeriesRenderer>[];
    indicator._setSeriesProperties(indicator, 'Momentum',
        indicator.signalLineColor, indicator.signalLineWidth, chart);
    _setSeriesProperties(indicator, 'CenterLine', indicator.centerLineColor,
        indicator.centerLineWidth, chart);
  }

  // ignore:unused_element
  void _initDataSource(MomentumIndicator<dynamic, dynamic> indicator) {
    final List<CartesianChartPoint<dynamic>> signalCollection =
        <CartesianChartPoint<dynamic>>[];
    final List<CartesianChartPoint<dynamic>> centerLineCollection =
        <CartesianChartPoint<dynamic>>[];
    final List<CartesianChartPoint<dynamic>> validData = indicator._dataPoints;
    final List<dynamic> centerXValues = <dynamic>[];
    final List<dynamic> xValues = <dynamic>[];
    num value;

    if (validData.isNotEmpty) {
      final CartesianSeriesRenderer signalSeriesRenderer =
          indicator._targetSeriesRenderers[0];
      final CartesianSeriesRenderer upperSeriesRenderer =
          indicator._targetSeriesRenderers[1];
      final num length = indicator.period;
      if (validData.length >= indicator.period && indicator.period > 0) {
        for (int i = 0; i < validData.length; i++) {
          centerLineCollection.add(_getDataPoint(validData[i].x, 100,
              validData[i], upperSeriesRenderer, centerLineCollection.length));
          centerXValues.add(validData[i].x);
          if (!(i < length)) {
            value = (validData[i].close == null ? 0 : validData[i].close) /
                (validData[i - length].close == null
                    ? 1
                    : validData[i - length].close) *
                100;
            signalCollection.add(_getDataPoint(validData[i].x, value,
                validData[i], signalSeriesRenderer, signalCollection.length));
            xValues.add(validData[i].x);
          }
        }
      }
      indicator._renderPoints = signalCollection;
      _setSeriesRange(signalCollection, indicator, xValues,
          indicator._targetSeriesRenderers[0]);
      _setSeriesRange(centerLineCollection, indicator, centerXValues,
          indicator._targetSeriesRenderers[1]);
    }
  }
}
