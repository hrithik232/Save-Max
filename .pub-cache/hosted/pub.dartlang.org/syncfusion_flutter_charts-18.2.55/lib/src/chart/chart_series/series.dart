part of charts;

/// This class has the properties of the cartesian series.
///
///  CartesianSeries Provides a variety of options, such as animation, dynamic animation, Transpose, color palette,
/// color mapping to customize the cartesian chart. The chart’s data source can be sorted using the sorting order and
/// sortFieldValueMapper properties of series.
///
/// Provides the options for animation, color palette, sorting, and empty point mode to customize the charts.
///
abstract class CartesianSeries<T, D> extends ChartSeries<T, D> {
  CartesianSeries(
      {this.key,
      this.xValueMapper,
      this.yValueMapper,
      this.dataLabelMapper,
      this.name,
      this.dataSource,
      this.xAxisName,
      this.yAxisName,
      this.sizeValueMapper,
      this.pointColorMapper,
      this.color,
      this.legendItemText,
      this.sortFieldValueMapper,
      this.gradient,
      this.borderGradient,
      this.width,
      this.highValueMapper,
      this.lowValueMapper,
      this.trendlines,
      this.onRendererCreated,
      this.onCreateRenderer,
      MarkerSettings markerSettings,
      bool isVisible,
      bool enableTooltip,
      EmptyPointSettings emptyPointSettings,
      DataLabelSettings dataLabelSettings,
      double animationDuration,
      List<double> dashArray,
      List<int> initialSelectedDataIndexes,
      Color borderColor,
      double borderWidth,
      SelectionSettings selectionSettings,
      bool isVisibleInLegend,
      LegendIconType legendIconType,
      double opacity,
      SortingOrder sortingOrder})
      : isVisible = isVisible ?? true,
        markerSettings = markerSettings ?? MarkerSettings(),
        dataLabelSettings = dataLabelSettings ?? DataLabelSettings(),
        enableTooltip = enableTooltip ?? true,
        emptyPointSettings = emptyPointSettings ?? EmptyPointSettings(),
        dashArray = dashArray ?? <double>[0, 0],
        initialSelectedDataIndexes = initialSelectedDataIndexes ?? <int>[],
        animationDuration = animationDuration ?? 1500,
        borderColor = borderColor ?? Colors.transparent,
        selectionSettings = selectionSettings ?? SelectionSettings(),
        legendIconType = legendIconType ?? LegendIconType.seriesType,
        isVisibleInLegend = isVisibleInLegend ?? true,
        borderWidth = borderWidth ?? 0,
        opacity = opacity ?? 1,
        sortingOrder = sortingOrder ?? SortingOrder.none,
        super(
            name: name,
            xValueMapper: xValueMapper,
            yValueMapper: yValueMapper,
            sortFieldValueMapper: sortFieldValueMapper,
            pointColorMapper: pointColorMapper,
            dataLabelMapper: dataLabelMapper,
            dataSource: dataSource,
            emptyPointSettings: emptyPointSettings,
            dataLabelSettings: dataLabelSettings,
            enableTooltip: enableTooltip,
            animationDuration: animationDuration,
            selectionSettings: selectionSettings,
            legendIconType: legendIconType,
            sortingOrder: sortingOrder,
            opacity: opacity);

  ///Key to identify a series in a collection.

  ///

  ///On specifying [ValueKey] as the series [key], existing series index can be changed in the series collection without losing its state.

  ///

  ///When a new series is added dynamically to the collection, existing series index will be changed. On that case,

  /// the existing series and its state will be linked based on its chart type and this key value.

  ///

  ///Defaults to `null`.

  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, num>>[
  ///                LineSeries<SalesData, num>(
  ///                      key: const ValueKey<String>('line_series_key'),
  ///                 ),
  ///              ],
  ///        ));
  ///}
  ///```
  final ValueKey<String> key;

  ///Used to create the renderer for custom series.
  ///
  ///This is applicable only when the custom series is defined in the sample
  /// and for built-in series types, it is not applicable.
  ///
  ///Renderer created in this will hold the series state and
  /// this should be created for each series. [onCreateRenderer] callback
  /// function should return the renderer class and should not return null.
  ///
  ///Series state will be created only once per series and will not be created
  ///again when we update the series.
  ///
  ///Defaults to `null`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, num>>[
  ///                LineSeries<SalesData, num>(
  ///                  onCreateRenderer:(ChartSeries<dynamic, dynamic> series){
  ///                      return CustomLinerSeriesRenderer();
  ///                    }
  ///                ),
  ///              ],
  ///        ));
  /// }
  ///  class CustomLinerSeriesRenderer extends LineSeriesRenderer {
  ///       // custom implementation here...
  ///  }
  ///```
  final ChartSeriesRendererFactory<T, D> onCreateRenderer;

  ///Triggers when the series renderer is created.

  ///

  ///Using this callback, able to get the [ChartSeriesController] instance, which is used to access the public methods in the series.

  ///

  ///Defaults to `null`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    ChartSeriesController _chartSeriesController;
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, num>>[
  ///                LineSeries<SalesData, num>(
  ///                    onRendererCreated: (ChartSeriesController controller) {
  ///                       _chartSeriesController = controller;
  ///                    },
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final SeriesRendererCreatedCallback onRendererCreated;

  ///Data required for rendering the series.
  ///
  /// If no data source is specified, empty chart will be rendered without series.
  ///
  ///Defaults to `null`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <ColumnSeries<SalesData, num>>[
  ///                ColumnSeries<SalesData, num>(
  ///                  dataSource: chartData,
  ///                  xValueMapper: (SalesData sales, _) => sales.x,
  ///                  yValueMapper: (SalesData sales, _) => sales.y,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///final List<SalesData> chartData = <SalesData>[
  ///    SalesData(1, 23),
  ///    SalesData(2, 35),
  ///    SalesData(3, 19)
  ///  ];
  ///
  ///class SalesData {
  ///   SalesData(this.x, this.y);
  ///   final double x;
  ///   final double y;
  ///}
  ///```
  final List<T> dataSource;

  ///Field in the data source, which is considered as x-value.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <ColumnSeries<SalesData, num>>[
  ///                ColumnSeries<SalesData, num>(
  ///                  dataSource: chartData,
  ///                  xValueMapper: (SalesData sales, _) => sales.x,
  ///                  yValueMapper: (SalesData sales, _) => sales.y,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///final List<SalesData> chartData = <SalesData>[
  ///    SalesData(1, 23),
  ///    SalesData(2, 35),
  ///    SalesData(3, 19)
  ///  ];
  ///
  ///class SalesData {
  ///   SalesData(this.x, this.y);
  ///   final double x;
  ///   final double y;
  ///}
  ///```
  final ChartIndexedValueMapper<D> xValueMapper;

  ///Field in the data source, which is considered as y-value.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <ColumnSeries<SalesData, num>>[
  ///                ColumnSeries<SalesData, num>(
  ///                  dataSource: chartData,
  ///                  xValueMapper: (SalesData sales, _) => sales.x,
  ///                  yValueMapper: (SalesData sales, _) => sales.y,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///final List<SalesData> chartData = <SalesData>[
  ///    SalesData(1, 23),
  ///    SalesData(2, 35),
  ///    SalesData(3, 19)
  ///  ];
  ///
  ///class SalesData {
  ///   SalesData(this.x, this.y);
  ///   final double x;
  ///   final double y;
  ///}
  ///```
  final ChartIndexedValueMapper<num> yValueMapper;

  ///Field in the data source, which is considered as fill color for the data points.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <ColumnSeries<ColumnColors, num>>[
  ///                   ColumnSeries<ColumnColors, num>(
  ///                       dataSource: chartData,
  ///                       xValueMapper: (ColumnColors sales, _) => sales.x,
  ///                       yValueMapper: (ColumnColors sales, _) => sales.y,
  ///                       pointColorMapper: (ColumnColors sales, _) => sales.pointColorMapper,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///final dynamic chartData = <ColumnColors>[
  ///    ColumnColors(1991, 7.8, const Color.fromRGBO(0, 0, 255, 1)),
  ///    ColumnColors(1992, 6.5, const Color.fromRGBO(255, 0, 0, 1)),
  ///    ColumnColors(1993, 6.0, const Color.fromRGBO(255, 100, 102, 1)),
  /// ];
  ///class ColumnColors {
  ///  ColumnColors(this.x, this.y,this.pointColorMapper);
  ///  final num x;
  ///  final num y;
  ///  final Color pointColorMapper;
  ///}
  ///```
  final ChartIndexedValueMapper<Color> pointColorMapper;

  ///Field in the data source, which is considered as text for the data points.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BarSeries<SalesData, num>>[
  ///                BarSeries<SalesData, num>(
  ///                 dataSource: <SalesData>[
  ///                    SalesData(DateTime(2005, 0, 1), 'India', 16),
  ///                    SalesData(DateTime(2006, 0, 1), 'China', 12),
  ///                    SalesData(DateTime(2007, 0, 1), 'USA',18),
  ///                 ],
  ///                dataLabelSettings: DataLabelSettings(isVisible:true),
  ///                dataLabelMapper: (SalesData data, _) => data.category,
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///class SalesData {
  ///   SalesData(this.year, this.category, this.sales1);
  ///   final DateTime year;
  ///   final String category;
  ///   final int sales1;
  ///}
  ///```
  final ChartIndexedValueMapper<String> dataLabelMapper;

  ///Field in the data source, which is considered as size of the bubble for
  ///all the data points.
  ///
  /// _Note:_ This is applicable only for bubble series.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BubbleSeries<BubbleColors, num>>[
  ///                   BubbleSeries<BubbleColors, num>(
  ///                       dataSource: chartData,
  ///                       sizeValueMapper: (BubbleColors sales, _) => sales.bubbleSize,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///final dynamic chartData = <BubbleColors>[
  ///    BubbleColors(92.2, 7.8, 1.347, const Color.fromRGBO(0, 0, 255, 1)),
  ///    BubbleColors(74, 6.5, 1.241, const Color.fromRGBO(255, 0, 0, 1)),
  ///    BubbleColors(90.4, 6.0, 0.238, const Color.fromRGBO(255, 100, 102, 1)),
  ///    BubbleColors(99.4, 2.2, 0.197, const Color.fromRGBO(122, 100, 255, 1)),
  /// ];
  ///class BubbleColors {
  ///  BubbleColors(this.year, this.growth,[this.bubbleSize, this.sizeValueMapper]);
  ///  final num year;
  ///  final num growth;
  ///  final num bubbleSize;
  ///  final Color pointColorMapper;
  ///}
  ///```
  final ChartIndexedValueMapper<num> sizeValueMapper;

  ///Field in the data source, which is considered as high value for the data points.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                 dataSource: <SalesData>[
  ///                    SalesData(2005, 24, 16),
  ///                    SalesData(2006, 22, 12),
  ///                    SalesData(2007, 31, 18),
  ///                 ],
  ///                highValueMapper: (SalesData data, _) => data.high,
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///class SalesData {
  ///   SalesData(this.year, this.high, this.low);
  ///   final num year;
  ///   final num high;
  ///   final num low;
  ///}
  ///```
  final ChartIndexedValueMapper<num> highValueMapper;

  ///Field in the data source, which is considered as low value for the data points.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <RangeColumnSeries<SalesData, num>>[
  ///                RangeColumnSeries<SalesData, num>(
  ///                 dataSource: <SalesData>[
  ///                    SalesData(2005, 24, 16),
  ///                    SalesData(2006, 22, 12),
  ///                    SalesData(2007, 31, 18),
  ///                 ],
  ///                lowValueMapper: (SalesData data, _) => data.low,
  ///              ),
  ///             ],
  ///        ));
  ///}
  ///class SalesData {
  ///   SalesData(this.year, this.high, this.low);
  ///   final num year;
  ///   final num high;
  ///   final num low;
  ///}
  ///```
  final ChartIndexedValueMapper<num> lowValueMapper;

  ///Name of the x-axis to bind the series.
  ///
  ///Defaults to `‘’`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///             axes: <ChartAxis>[
  ///                        NumericAxis(
  ///                            plotOffset: 0,
  ///                            majorGridLines: MajorGridLines(color: Colors.transparent),
  ///                            opposedPosition: true,
  ///                            name: 'xAxis1',
  ///                            axisTitle: AxisTitle(
  ///                                text: 'China - Growth'))
  ///                      ],
  ///            series: <BubbleSeries<BubbleColors, num>>[
  ///                   BubbleSeries<BubbleColors, num>(
  ///                       dataSource: chartData,
  ///                       xAxisName: 'xAxis1',
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///final dynamic chartData = <BubbleColors>[
  ///    BubbleColors(92.2, 7.8, 1.347, const Color.fromRGBO(0, 0, 255, 1)),
  ///    BubbleColors(74, 6.5, 1.241, const Color.fromRGBO(255, 0, 0, 1)),
  ///    BubbleColors(90.4, 6.0, 0.238, const Color.fromRGBO(255, 100, 102, 1)),
  ///    BubbleColors(99.4, 2.2, 0.197, const Color.fromRGBO(122, 100, 255, 1)),
  /// ];
  ///```
  final String xAxisName;

  ///Name of the y-axis to bind the series.
  ///
  ///Defaults to `‘’`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///             axes: <ChartAxis>[
  ///                        NumericAxis(
  ///                            plotOffset: 0,
  ///                            majorGridLines: MajorGridLines(color: Colors.transparent),
  ///                            opposedPosition: true,
  ///                            name: 'yAxis1',
  ///                            axisTitle: AxisTitle(
  ///                                text: 'China - Population '))
  ///                      ],
  ///            series: <BubbleSeries<BubbleColors, num>>[
  ///                   BubbleSeries<BubbleColors, num>(
  ///                       dataSource: chartData,
  ///                       yAxisName: 'yAxis1',
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///final dynamic chartData = <BubbleColors>[
  ///    BubbleColors(92.2, 7.8, 1.347, const Color.fromRGBO(0, 0, 255, 1)),
  ///    BubbleColors(74, 6.5, 1.241, const Color.fromRGBO(255, 0, 0, 1)),
  ///    BubbleColors(90.4, 6.0, 0.238, const Color.fromRGBO(255, 100, 102, 1)),
  ///    BubbleColors(99.4, 2.2, 0.197, const Color.fromRGBO(122, 100, 255, 1)),
  /// ];
  ///```
  final String yAxisName;

  ///Color of the series.
  ///
  /// If no color is specified, then the series will be rendered
  ///with the default palette color.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BubbleSeries<BubbleColors, num>>[
  ///                   BubbleSeries<BubbleColors, num>(
  ///                       color: const Color.fromRGBO(255, 0, 102, 1),
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final Color color;

  ///Width of the series.
  ///
  ///In line, spline, step line, and fast line series, width
  ///of the line will be changed. In column series, width of the column rectangle will
  ///be changed. In bar series, the height of the bar rectangle will be changed.
  ///
  ///  _Note:_ This is not applicable for area, scatter, and bubble series.
  ///
  ///Default to `2`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<LineData, num>>[
  ///                   LineSeries<LineData, num>(
  ///                       width: 2,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final double width;

  ///Indication of data points.
  ///
  ///Mark the data point location with symbols for better
  ///indication. The shape, color, border, and size of the marker can be customized.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<ChartData, num>>[
  ///                   LineSeries<ChartData, num>(
  ///                       markerSettings: MarkerSettings(isVisible: true),
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final MarkerSettings markerSettings;

  ///Customizes the empty points, i.e. null data points in a series.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <ColumnSeries<ChartData, num>>[
  ///                   ColumnSeries<ChartData, num>(
  ///                       emptyPointSettings: EmptyPointSettings(color: Colors.black),
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  ///
  final EmptyPointSettings emptyPointSettings;

  ///Customizes the data labels in a series. Data label is a text, which displays
  ///the details about the data point.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<ChartData, num>>[
  ///                   LineSeries<ChartData, num>(
  ///                       dataLabelSettings: DataLabelSettings(isVisible: true),
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final DataLabelSettings dataLabelSettings;

  ///Customizes the trendlines.
  ///
  /// Trendline are used to mark the specific area of interest
  /// in the plot area with texts, shapes, or images.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  /// series: <LineSeries<ChartData, num>>[
  ///                   LineSeries<ChartData, num>(
  ///                   trendlines: <ChartTrendline>[
  ///
  ///                 ])
  ///             ],
  ///        ));
  ///}
  ///```
  final List<Trendline> trendlines;

  ///Fills the chart series with gradient color.
  ///
  ///Default to `null`
  ///
  ///```dart
  ///final List <Color> color = <Color>[];
  ///    color.add(Colors.pink[50]);
  ///    color.add(Colors.pink[200]);
  ///    color.add(Colors.pink);
  ///
  ///final List<double> stops = <double>[];
  ///    stops.add(0.0);
  ///    stops.add(0.5);
  ///    stops.add(1.0);
  ///
  ///final LinearGradient gradients = LinearGradient(colors: color, stops: stops);
  ///
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BarSeries<SalesData, String>>[
  ///                   BarSeries<SalesData, String>(
  ///                       gradient: gradients,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final LinearGradient gradient;

  ///Fills the border of the chart series with gradient color.
  ///
  ///Default to `null`
  ///
  ///```dart
  ///final List <Color> color = <Color>[];
  ///    color.add(Colors.pink[50]);
  ///    color.add(Colors.pink[200]);
  ///    color.add(Colors.pink);
  ///
  ///final List<double> stops = <double>[];
  ///    stops.add(0.0);
  ///    stops.add(0.5);
  ///    stops.add(1.0);
  ///
  ///final LinearGradient gradients = LinearGradient(colors: color, stops: stops);
  ///
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <ChartSeries<SalesData, String>>[
  ///                   AreaSeries<SalesData, String>(
  ///                       borderGradient: gradients,
  ///                       borderWidth: 2
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final LinearGradient borderGradient;

  ///Name of the series.
  ///
  ///The name will be displayed in legend item by default.
  ///If name is not specified for the series, then the current series index with ‘series’
  ///text prefix will be considered as series name.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BubbleSeries<BubbleColors, num>>[
  ///                   BubbleSeries<BubbleColors, num>(
  ///                       name: 'Bubble Series',
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final String name;

  ///Enables or disables the tooltip for this series.
  ///
  /// Tooltip will display more details about data points when tapping the data point region.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BubbleSeries<BubbleColors, num>>[
  ///                   BubbleSeries<BubbleColors, num>(
  ///                       enableTooltip: true,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final bool enableTooltip;

  ///Dashes of the series.
  ///
  ///Any number of values can be provided in the list. Odd value
  ///is considered as rendering size and even value is considered as gap.
  ///
  /// _Note:_ This is applicable for line, spline, step line, and fast line series only.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, String>>[
  ///                   LineSeries<SalesData, String>(
  ///                       dashArray: <double>[10, 10],
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final List<double> dashArray;

  ///Duration of the series animation. It takes millisecond value as input.
  ///
  ///Series will be animated while rendering. Animation is enabled by default,
  ///you can also control the duration of the animation using `animationDuration` property
  ///You can disable the animation by setting 0 value to that property.
  ///
  ///Defaults to `1500`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, String>>[
  ///                   LineSeries<SalesData, String>(
  ///                       animationDuration: 1000,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final double animationDuration;

  ///Border color of the series.
  ///
  /// _Note:_ This is not applicable for line, spline, step line, and fast line series types.
  ///
  ///Defaults to `Colors.transparent`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, String>>[
  ///                   LineSeries<SalesData, String>(
  ///                       borderColor: Colors.red,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final Color borderColor;

  ///Border width of the series.
  ///
  ///_Note:_ This is not applicable for line, spline, step line, and fast line series types.
  ///
  ///Defaults to `0`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, String>>[
  ///                   LineSeries<SalesData, String>(
  ///                       borderWidth: 5,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final double borderWidth;

  ///Shape of the legend icon.
  ///
  ///Any shape in the LegendIconType can be applied to this property. By default, icon will be rendered based on the type of the series.
  ///
  ///Defaults to `LegendIconType.seriesType`
  ///
  ///Also refer [LegendIconType]
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, String>>[
  ///                   LineSeries<SalesData, String>(
  ///                       legendIconType: LegendIconType.diamond,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final LegendIconType legendIconType;

  ///Toggles the visibility of the legend item of this specific series in the legend.
  ///
  ///If it is set to false, the legend item for this series will not be visible in the legend.
  ///
  ///Defaults to `true`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, String>>[
  ///                   LineSeries<SalesData, String>(
  ///                       isVisibleInLegend: true,
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final bool isVisibleInLegend;

  ///Text to be displayed in legend.
  ///
  /// By default, the series name will be displayed in the legend. You can change this by setting values to this property.
  ///
  ///Defaults to `‘’`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, String>>[
  ///                   LineSeries<SalesData, String>(
  ///                       legendItemText: 'legend',
  ///                  ),
  ///             ],
  ///        ));
  ///}
  ///```
  final String legendItemText;

  ///Customizes the data points or series on selection.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BarSeries<SalesData, num>>[
  ///                BarSeries<SalesData, num>(
  ///                  selectionSettings: SelectionSettings(
  ///                    selectedColor: Colors.red,
  ///                    unselectedColor: Colors.grey,
  ///                    selectedOpacity : 0.8,
  ///                    unselectedOpacity: 0.4
  ///                  ),
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final SelectionSettings selectionSettings;

  ///Opacity of the series.
  ///
  ///The value ranges from 0 to 1. It used to control the transparency of the legend icon shape.
  ///
  ///Defaults to `1`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BarSeries<SalesData, num>>[
  ///                BarSeries<SalesData, num>(
  ///                      opacity: 1
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final double opacity;

  ///Field in the data source, which is considered for sorting the data points.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <ColumnSeries<SalesData, num>>[
  ///                ColumnSeries<SalesData, num>(
  ///                  dataSource: chartData,
  ///                  xValueMapper: (SalesData sales, _) => sales.x,
  ///                  yValueMapper: (SalesData sales, _) => sales.y,
  ///                  sortFieldValueMapper: (SalesData sales, _) => sales.x,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///final List<SalesData> chartData = <SalesData>[
  ///    SalesData(1, 23),
  ///    SalesData(2, 35),
  ///    SalesData(3, 19)
  ///  ];
  ///
  ///class SalesData {
  ///   SalesData(this.x, this.y);
  ///   final double x;
  ///   final double y;
  ///}
  ///```
  final ChartIndexedValueMapper<dynamic> sortFieldValueMapper;

  ///The data points in the series can be sorted in ascending or descending order.
  ///
  ///The data points will be rendered in the specified order if it is set to none.
  ///
  ///Default to `none`
  ///
  ///Also refer [SortingOrder]
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BarSeries<SalesData, num>>[
  ///                BarSeries<SalesData, num>(
  ///                    sortingOrder: SortingOrder.ascending,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final SortingOrder sortingOrder;

  ///Toggles the visibility of the series.
  ///
  ///Defaults to `true`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <BarSeries<SalesData, num>>[
  ///                BarSeries<SalesData, num>(
  ///                    isVisible:false,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final bool isVisible;

  /// List of data indexes to initially be selected
  ///
  /// Defaults to `null`.
  ///```dart
  ///     Widget build(BuildContext context) {
  ///    return Scaffold(
  ///        body: Center(
  ///            child: Container(
  ///                  child: SfCartesianChart(
  ///                      initialSelectedDataIndexes: <IndexesModel>[IndexesModel(1, 0)]
  ///                 )
  ///              )
  ///          )
  ///      );
  ///  }
  final List<int> initialSelectedDataIndexes;
}

/// Creates a series renderer for Chart series
abstract class ChartSeriesRenderer {
  String _seriesName;

  bool _visible;

  //ignore: prefer_final_fields
  bool _needsRepaint = true;

  SfCartesianChart _chart;
}

typedef SeriesRendererCreatedCallback = void Function(
    ChartSeriesController controller);

///We can redraw the series with updating or creating new points by using this controller.If we need to access the redrawing methods
///in this before we must get the ChartSeriesController onRendererCreated event.
class ChartSeriesController {
  ChartSeriesController(this.seriesRenderer);

  ///Used to access the series properties.
  ///
  ///Defaults to `null`
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    ChartSeriesController _chartSeriesController;
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, num>>[
  ///                LineSeries<SalesData, num>(
  ///                    onRendererCreated: (ChartSeriesController controller) {
  ///                       _chartSeriesController = controller;
  ///                       // prints series yAxisName
  ///                      print(_chartSeriesController.seriesRenderer._series.yAxisName);
  ///                    },
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final XyDataSeriesRenderer seriesRenderer;

  bool _needXRecalculation = false, _needYRecalculation = false;

  ///Used to process only the newly added, updated and removed data points in a series,
  /// instead of processing all the data points.
  ///
  ///To re-render the chart with modified data points, setState() will be called.
  /// This will render the process and render the chart from scratch.
  /// Thus, the app’s performance will be degraded on continuous update.
  /// To overcome this problem, [updateDataSource] method can be called by passing updated data points indexes.
  /// Chart will process only that point and skip various steps like bounds calculation,
  /// old data points processing, etc. Thus, this will improve the app’s performance.
  ///
//The following are the arguments of this method.
  /// * addedDataIndexes – `List<int>` type – Indexes of newly added data points in the existing series.
  /// * removedDataIndexes – `List<int>` type – Indexes of removed data points in the existing series.
  /// * updatedDataIndexes – `List<int>` type – Indexes of updated data points in the existing series.
  /// * addedDataIndex – `int` type – Index of newly added data point in the existing series.
  /// * removedDataIndex – `int` type – Index of removed data point in the existing series.
  /// * updatedDataIndex – `int` type – Index of updated data point in the existing series.
  ///
  ///Returns `void`.
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    ChartSeriesController _chartSeriesController;
  ///    return Column(
  ///      children: <Widget>[
  ///      Container(
  ///        child: SfCartesianChart(
  ///            series: <LineSeries<SalesData, num>>[
  ///                LineSeries<SalesData, num>(
  ///                   dataSource: chartData,
  ///                    onRendererCreated: (ChartSeriesController controller) {
  ///                       _chartSeriesController = controller;
  ///                    },
  ///                ),
  ///              ],
  ///        )),
  ///   Container(
  ///      child: RaisedButton(
  ///           onPressed: () {
  ///           chartData.removeAt(0);
  ///           chartData.add(ChartData(3,23));
  ///           _chartSeriesController.updateDataSource(
  ///               addedDataIndexes: <int>[chartData.length -1],
  ///               removedDataIndexes: <int>[0],
  ///           );
  ///      })
  ///   )]
  ///  );
  /// }
  ///```
  void updateDataSource(
      {List<int> addedDataIndexes,
      List<int> removedDataIndexes,
      List<int> updatedDataIndexes,
      int addedDataIndex,
      int removedDataIndex,
      int updatedDataIndex}) {
    bool _needUpdate = false;
    if (removedDataIndexes != null && removedDataIndexes.isNotEmpty) {
      _removeDataPoints(removedDataIndexes);
    } else if (removedDataIndex != null) {
      _removeDataPoint(removedDataIndex);
    }
    if (addedDataIndexes != null && addedDataIndexes.isNotEmpty) {
      _addOrUpdateDataPoints(addedDataIndexes, false);
    } else if (addedDataIndex != null) {
      _addOrUpdateDataPoint(addedDataIndex, false);
    }
    if (updatedDataIndexes != null && updatedDataIndexes.isNotEmpty) {
      _needUpdate = true;
      _addOrUpdateDataPoints(updatedDataIndexes, true);
    } else if (updatedDataIndex != null) {
      _needUpdate = true;
      _addOrUpdateDataPoint(updatedDataIndex, true);
    }
    _updateSeries(_needXRecalculation, _needYRecalculation, _needUpdate);
  }

  /// Add or update the data points on dynamic series update
  void _addOrUpdateDataPoints(List<int> indexes, bool needUpdate) {
    for (int i = 0; i < indexes.length; i++) {
      final int _dataIndex = indexes[i];
      _addOrUpdateDataPoint(_dataIndex, needUpdate);
    }
  }

  /// add or update a data point in the given index
  void _addOrUpdateDataPoint(int index, bool needUpdate) {
    final CartesianSeries<dynamic, dynamic> series = seriesRenderer._series;
    if (index >= 0 &&
        series.dataSource.length > index &&
        series.dataSource[index] != null) {
      final _VisibleRange _xRange = seriesRenderer._xAxis._visibleRange;
      final _VisibleRange _yRange = seriesRenderer._yAxis._visibleRange;
      final CartesianChartPoint<dynamic> currentPoint =
          _getChartPoint(seriesRenderer, series.dataSource[index], index);
      final String _seriesType = seriesRenderer._seriesType;
      dynamic x = currentPoint.x;
      if (seriesRenderer._xAxis is DateTimeAxis) {
        x = x.millisecondsSinceEpoch;
      } else if (seriesRenderer._xAxis is LogarithmicAxis) {
        final LogarithmicAxis axis = seriesRenderer._xAxis;
        x = _logBase(x > 1 ? x : 1, axis.logBase);
      }
      if (!_needXRecalculation &&
          (_xRange.minimum >= x || _xRange.maximum <= x)) {
        _needXRecalculation = true;
      }
      dynamic minYVal =
          currentPoint.y != null ? currentPoint.y : currentPoint.low;
      dynamic maxYVal =
          currentPoint.y != null ? currentPoint.y : currentPoint.high;
      if (seriesRenderer._yAxis is LogarithmicAxis) {
        final LogarithmicAxis axis = seriesRenderer._yAxis;
        minYVal = _logBase(minYVal > 1 ? minYVal : 1, axis.logBase);
        maxYVal = _logBase(maxYVal > 1 ? maxYVal : 1, axis.logBase);
      }
      if (!_needYRecalculation &&
          (_yRange.minimum >= minYVal || _yRange.maximum <= maxYVal)) {
        _needYRecalculation = true;
      }

      if (needUpdate) {
        if (seriesRenderer._dataPoints.length > index) {
          seriesRenderer._dataPoints[index] = currentPoint;
        }
      } else {
        if (seriesRenderer._dataPoints.length == index) {
          seriesRenderer._dataPoints.add(currentPoint);
        } else if (seriesRenderer._dataPoints.length > index && index >= 0) {
          seriesRenderer._dataPoints.insert(index, currentPoint);
        }
      }

      if (_seriesType.contains('range') ||
              _seriesType.contains('hilo') ||
              _seriesType.contains('candle')
          ? _seriesType == 'hiloopenclose' || _seriesType.contains('candle')
              ? (currentPoint.low == null ||
                  currentPoint.high == null ||
                  currentPoint.open == null ||
                  currentPoint.close == null)
              : (currentPoint.low == null || currentPoint.high == null)
          : currentPoint.y == null) {
        if (seriesRenderer is XyDataSeriesRenderer)
          seriesRenderer.calculateEmptyPointValue(
              index, currentPoint, seriesRenderer);
      }

      /// Below lines for changing high, low values based on input
      if ((_seriesType.contains('range') ||
              _seriesType.contains('hilo') ||
              _seriesType.contains('candle')) &&
          currentPoint.isVisible) {
        final num high = currentPoint.high;
        final num low = currentPoint.low;
        currentPoint.high = math.max<num>(high, low);
        currentPoint.low = math.min<num>(high, low);
      }
    }
  }

  ///Remove list of points
  void _removeDataPoints(List<int> removedDataIndexes) {
    ///Remove the redudant index from the list
    final List<int> indexList = removedDataIndexes.toSet().toList();
    indexList.sort((int b, int a) => a.compareTo(b));
    for (int i = 0; i < indexList.length; i++) {
      final int _dataIndex = indexList[i];
      _removeDataPoint(_dataIndex);
    }
  }

  /// remove a data point in the given index
  void _removeDataPoint(int index) {
    if (seriesRenderer._dataPoints.isNotEmpty &&
        index >= 0 &&
        index < seriesRenderer._dataPoints.length) {
      final CartesianChartPoint<dynamic> currentPoint =
          seriesRenderer._dataPoints[index];
      seriesRenderer._dataPoints.removeAt(index);
      if (currentPoint != null) {
        if (!_needXRecalculation &&
            (seriesRenderer._minimumX == currentPoint.x ||
                seriesRenderer._maximumX == currentPoint.x)) {
          _needXRecalculation = true;
        }
        final String _seriesType = seriesRenderer._seriesType;

        /// Below lines for changing high, low values based on input
        if ((_seriesType.contains('range') ||
                _seriesType.contains('hilo') ||
                _seriesType.contains('candle')) &&
            currentPoint.isVisible) {
          final num high = currentPoint.high;
          final num low = currentPoint.low;
          currentPoint.high = math.max<num>(high, low);
          currentPoint.low = math.min<num>(high, low);
        }
        final dynamic minYVal =
            currentPoint.y != null ? currentPoint.y : currentPoint.low;
        final dynamic maxYVal =
            currentPoint.y != null ? currentPoint.y : currentPoint.high;
        if (!_needYRecalculation &&
            (seriesRenderer._minimumY == minYVal ||
                seriesRenderer._maximumY == maxYVal)) {
          _needYRecalculation = true;
        }
      }
    }
  }

  /// After add/remove/update datapoints, recalculate the x, y range and inveral
  void _updateSeries(
      bool needXRecalculation, bool needYRecalculation, bool needUpdate) {
    final SfCartesianChart chart = seriesRenderer._chart;
    if (needXRecalculation || needYRecalculation || needUpdate) {
      if (needXRecalculation) {
        seriesRenderer._minimumX = seriesRenderer._maximumX = null;
      }
      if (needYRecalculation) {
        seriesRenderer._minimumY = seriesRenderer._maximumY = null;
      }
      chart._chartSeries._findSeriesMinMax(seriesRenderer);
      if (seriesRenderer._seriesType.contains('stacked')) {
        chart._chartSeries
            ?._calculateStackedValues(_findSeriesCollection(chart));
      }
    }
    if (needXRecalculation) {
      final dynamic axis = seriesRenderer._xAxis;
      axis._calculateRangeAndInterval(chart);
    }
    if (needYRecalculation) {
      final dynamic axis = seriesRenderer._yAxis;
      axis._calculateRangeAndInterval(chart);
    }
    if (needXRecalculation || needYRecalculation) {
      chart._chartState.renderAxis.state.axisRepaintNotifier.value++;
    }
    seriesRenderer._repaintNotifier.value++;
  }
}

abstract class CartesianSeriesRenderer extends ChartSeriesRenderer {
  /// Stores the series type
  String _seriesType;

  /// Whether to check the series is rect series or not
  bool _isRectSeries;

  final List<_ListControlPoints> _drawControlPoints = <_ListControlPoints>[];

  final List<_ListControlPoints> _drawLowControlPoints = <_ListControlPoints>[];

  final List<_ListControlPoints> _drawHighControlPoints =
      <_ListControlPoints>[];

  Path _segmentPath;

  /// Gets the Segments collection variable declarations.
  // ignore: prefer_final_fields
  List<ChartSegment> _segments = <ChartSegment>[];

  //Maintain the old series state.
  //ignore: unused_field
  CartesianSeries<dynamic, dynamic> _oldSeries;

  //Store the current series state
  CartesianSeries<dynamic, dynamic> _series;

  /// Holds the collection of cartesian data points
  // ignore: prefer_final_fields
  List<CartesianChartPoint<dynamic>> _dataPoints =
      <CartesianChartPoint<dynamic>>[];

  //Maintain the old data points state
  // ignore: prefer_final_fields
  List<CartesianChartPoint<dynamic>> _oldDataPoints =
      <CartesianChartPoint<dynamic>>[];

  /// Holds the information for x Axis
  ChartAxis _xAxis;

  /// Holds the information for y Axis
  ChartAxis _yAxis;

  /// Minimum x value for Series
  num _minimumX;

  /// Maximum x value for Series
  num _maximumX;

  /// Minimum y value for Series
  num _minimumY;

  /// Maximum y value for Series
  num _maximumY;

  /// Hold the data about point regions
  Map<dynamic, dynamic> _regionalData;

  /// Color for the series based on color palette
  Color _seriesColor;
  List<dynamic> _xValues;

  /// Hold the information about chart class
  SfCartesianChart _chart;

  /// Side by side index for series
  int _sideBySideIndex;

  /// Contains the collection of path for markers
  List<Path> _markerShapes;

  List<Path> _markerShapes2;

  // ignore: prefer_final_fields
  bool _isOuterRegion = false;

  /// used to differentiate indicator from series
  // ignore: prefer_final_fields
  bool _isIndicator = false;

  ///storing mindelta for rect series
  num _minDelta;

  /// Repaint notifier for series
  ValueNotifier<int> _repaintNotifier;

  // ignore: prefer_final_fields
  bool _needAnimateSeriesElements = false;

  ///We can redraw the series with updating or creating new points by using this controller.If we need to access the redrawing methods
  ///in this before we must get the ChartSeriesController onRendererCreated event.
  ChartSeriesController _controller;

  /// To create segment for series
  ChartSegment createSegment();

  /// To customize each segments
  void customizeSegment(ChartSegment segment);

  /// To customize each data markers
  void drawDataMarker(int index, Canvas canvas, Paint fillPaint,
      Paint strokePaint, double pointX, double pointY,
      [CartesianSeriesRenderer seriesRenderer]);

  /// To customize each data labels
  void drawDataLabel(int index, Canvas canvas, String dataLabel, double pointX,
      double pointY, int angle, TextStyle style);

  void calculateEmptyPointValue(
      int pointIndex, CartesianChartPoint<dynamic> currentPoint,
      [CartesianSeriesRenderer seriesRenderer]);
}
