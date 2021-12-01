part of charts;

///Renders relative strength index (RSI) indicator.
///
///The relative strength index (RSI) is a momentum indicator that measures the magnitude of recent price
/// changes to evaluate [overbought] or [oversold] conditions.
///
///The RSI indicator has additional two lines other than the signal line.They indicate the [overbought] and [oversold] region.
///
///The [upperLineColor] property is used to define the color for the line that indicates [overbought] region, and
///the [lowerLineColor] property is used to define the color for the line that indicates [oversold] region.
class RsiIndicator<T, D> extends TechnicalIndicators<T, D> {
  RsiIndicator(
      {bool isVisible,
      String xAxisName,
      String yAxisName,
      String seriesName,
      List<double> dashArray,
      double animationDuration,
      List<T> dataSource,
      ChartValueMapper<T, D> xValueMapper,
      ChartValueMapper<T, num> highValueMapper,
      ChartValueMapper<T, num> lowValueMapper,
      ChartValueMapper<T, num> closeValueMapper,
      String name,
      bool isVisibleInLegend,
      LegendIconType legendIconType,
      String legendItemText,
      Color signalLineColor,
      double signalLineWidth,
      int period,
      bool showZones,
      double overbought,
      double oversold,
      final Color upperLineColor,
      final double upperLineWidth,
      final Color lowerLineColor,
      final double lowerLineWidth})
      : showZones = showZones ?? true,
        overbought = overbought ?? 80,
        oversold = oversold ?? 20,
        upperLineColor = upperLineColor ?? Colors.red,
        upperLineWidth = upperLineWidth ?? 2,
        lowerLineColor = lowerLineColor ?? Colors.green,
        lowerLineWidth = lowerLineWidth ?? 2,
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
            closeValueMapper: closeValueMapper,
            name: name,
            isVisibleInLegend: isVisibleInLegend,
            legendIconType: legendIconType,
            legendItemText: legendItemText,
            signalLineColor: signalLineColor,
            signalLineWidth: signalLineWidth,
            period: period);

  ///ShowZones boolean value for RSI indicator
  ///
  ///Defaults to `true`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///            RsiIndicator<dynamic, dynamic>(
  ///                showZones : false,
  ///              ),
  ///        ));
  ///}
  ///```
  final bool showZones;

  ///Overbought value for RSI indicator.
  ///
  ///Defaults to `80`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///            RsiIndicator<dynamic, dynamic>(
  ///                overbought : 50,
  ///              ),
  ///        ));
  ///}
  ///```
  final double overbought;

  ///Oversold value for RSI indicator.
  ///
  ///Defaults to `20`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///            RsiIndicator<dynamic, dynamic>(
  ///                oversold : 30,
  ///              ),
  ///        ));
  ///}
  ///```
  final double oversold;

  ///Color of the upperLine for RSI indicator.
  ///
  ///Defaults to `red`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///            RsiIndicator<dynamic, dynamic>(
  ///                 upperLineColor : Colors.greenAccent,
  ///              ),
  ///        ));
  ///}
  ///```
  final Color upperLineColor;

  ///Width of the upperLine for RSI indicator.
  ///
  ///Defaults to `2`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///            RsiIndicator<dynamic, dynamic>(
  ///                 upperLineWidth : 4.0,
  ///              ),
  ///        ));
  ///}
  ///```
  final double upperLineWidth;

  ///Color of the lowerLine for RSI indicator.
  ///
  ///Defaults to `green`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///            RsiIndicator<dynamic, dynamic>(
  ///                 lowerLineColor : Colors.blue,
  ///              ),
  ///        ));
  ///}
  ///```
  final Color lowerLineColor;

  ///Width of the upperLine for RSI indicator.
  ///
  ///Defaults to `2`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            indicators: <TechnicalIndicators<dynamic, dynamic>>[
  ///            RsiIndicator<dynamic, dynamic>(
  ///                 lowerLineWidth : 4.0,
  ///              ),
  ///        ));
  ///}
  ///```
  final double lowerLineWidth;

// ignore:unused_element
  void _initSeriesCollection(
      RsiIndicator<dynamic, dynamic> indicator, SfCartesianChart chart) {
    indicator._targetSeriesRenderers = <CartesianSeriesRenderer>[];
    indicator._setSeriesProperties(indicator, 'RSI', indicator.signalLineColor,
        indicator.signalLineWidth, chart);
    if (indicator.showZones == true) {
      _setSeriesProperties(indicator, 'UpperLine', indicator.upperLineColor,
          indicator.upperLineWidth, chart);
      _setSeriesProperties(indicator, 'LowerLine', indicator.lowerLineColor,
          indicator.lowerLineWidth, chart);
    }
  }

  // ignore:unused_element
  void _initDataSource(RsiIndicator<dynamic, dynamic> indicator) {
    final List<CartesianChartPoint<dynamic>> signalCollection =
        <CartesianChartPoint<dynamic>>[];
    final List<CartesianChartPoint<dynamic>> lowerCollection =
        <CartesianChartPoint<dynamic>>[];
    final List<CartesianChartPoint<dynamic>> upperCollection =
        <CartesianChartPoint<dynamic>>[];
    final CartesianSeriesRenderer signalSeriesRenderer =
        indicator._targetSeriesRenderers[0];
    final List<CartesianChartPoint<dynamic>> validData = indicator._dataPoints;
    final List<dynamic> xValues = <dynamic>[];
    final List<dynamic> signalXValues = <dynamic>[];

    if (validData.isNotEmpty &&
        validData.length >= indicator.period &&
        indicator.period > 0) {
      if (indicator.showZones) {
        for (int i = 0; i < validData.length; i++) {
          upperCollection.add(_getDataPoint(
              validData[i].x,
              indicator.overbought,
              validData[i],
              indicator._targetSeriesRenderers[1],
              upperCollection.length));
          lowerCollection.add(_getDataPoint(
              validData[i].x,
              indicator.oversold,
              validData[i],
              indicator._targetSeriesRenderers[2],
              lowerCollection.length));
          xValues.add(validData[i].x);
        }
      }
      num prevClose = validData[0].close == null ? 0 : validData[0].close;
      num gain = 0;
      num loss = 0;
      for (int i = 1; i <= indicator.period; i++) {
        final num close = validData[i].close == null ? 0.0 : validData[i].close;
        if (close > prevClose) {
          gain += close - prevClose;
        } else {
          loss += prevClose - close;
        }
        prevClose = close;
      }
      gain = gain / indicator.period;
      loss = loss / indicator.period;

      signalCollection.add(_getDataPoint(
          validData[indicator.period].x,
          100 - (100 / (1 + (gain / loss))),
          validData[indicator.period],
          signalSeriesRenderer,
          signalCollection.length));
      signalXValues.add(validData[indicator.period].x);

      for (int j = indicator.period + 1; j < validData.length; j++) {
        if (!validData[j].isGap && !validData[j].isDrop) {
          final num close = validData[j].close;
          if (close > prevClose) {
            gain = (gain * (indicator.period - 1) + (close - prevClose)) /
                indicator.period;
            loss = (loss * (indicator.period - 1)) / indicator.period;
          } else if (close < prevClose) {
            loss = (loss * (indicator.period - 1) + (prevClose - close)) /
                indicator.period;
            gain = (gain * (indicator.period - 1)) / indicator.period;
          }
          prevClose = close;
          signalCollection.add(_getDataPoint(
              validData[j].x,
              100 - (100 / (1 + (gain / loss))),
              validData[j],
              signalSeriesRenderer,
              signalCollection.length));
          signalXValues.add(validData[j].x);
        }
      }
    }
    indicator._renderPoints = signalCollection;
    _setSeriesRange(signalCollection, indicator, signalXValues,
        indicator._targetSeriesRenderers[0]);
    if (indicator.showZones) {
      _setSeriesRange(upperCollection, indicator, xValues,
          indicator._targetSeriesRenderers[1]);
      _setSeriesRange(lowerCollection, indicator, xValues,
          indicator._targetSeriesRenderers[2]);
    }
  }
}
