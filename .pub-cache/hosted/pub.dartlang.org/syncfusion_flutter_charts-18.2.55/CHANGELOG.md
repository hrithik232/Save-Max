## [18.2.55] - 08/26/2020

**Bugs**

* The spline chart will not throw any exception with null values.
* The data label builder can now return proper index value with visibleMinimum and visibleMaximum properties.

## [18.2.54] - 08/18/2020

**Features**

* Provided support to calculate the axis range based on the visible data points or based on the overall data points in the chart.

**Bugs**

* Animation for dynamic updates now works even in a zoomed state.

## [18.2.48] - 08/04/2020

**Bugs**

* Now, the onZooming event will not be triggered while handling the onTrackballPositionChanging event.

## [18.2.47] - 07/28/2020

**Bugs**

* Now, panning is working properly with LayoutBuilder and FutureBuilder.
* Annotations are rendering properly with plot offset.
* The `onTrackballPositionChanging` event is firing properly.
* Now, crosshair label is showing at the correct position with the public method.

## [18.2.46] - 07/21/2020

No changes.

## [18.2.45] - 07/14/2020

**Bugs**

* Now, `onSelectionChanged` event will return the proper index value.
* The custom data label will be visible for small y values.
* Series visibility is working properly with FutureBuilder.

## [18.2.44] - 07/07/2020

**Breaking changes**

* Considering the readability, the axis labels rotation of rotate45 and rotate90 values in [`labelIntersectAction`](https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/ChartAxis/labelIntersectAction.html) property is changed from 45, 90 degree to -45, -90 degree respectively.
* [`ChartTextStyle`](https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/ChartTextStyle-class.html) class is deprecated now and use `TextStyle` class as alternate to customize the text.
* Now, to modify the series types rendering with your own custom implementation, you must override that specific series renderer class, instead of overriding that series class. 
* Now, we have considered the values of transform, start and end properties in `LinearGradient` while rendering gradient. So specify the `begin` value as `bottomCenter` and `end` as `topCenter` to maintain the same appearance.

**Features** 

* Provided support for Spline range area and Histogram chart types.
* Provided `updateDataSource` public method to update the chart dynamically on data source change.
* Now, the gradient can be applied to the border of all the applicable series.
* Provided support for animating the axis elements like labels, gridlines, and ticks, when the axis range is changed.
* Now, the visibility of the data label and its connector line can be collapsed when its value is zero.
* The date-time interval can be specified in double value.
* Provided touch down, touch move, and marker render callback functions for the chart widget.
* Now with the same [`start`](https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/PlotBand/start.html) and [`end`](https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/PlotBand/end.html) values, a single line will be drawn with plot band feature.
* Provided support for aligning the axis labels above, below, or center to the gridlines.
* The size and shape of the markers can be customized with `onMarkerRender` callback function.
* Now, the y-axis range will be calculated based on the visible points when panning with zoom mode x.

**Bugs**

* Legends are toggled properly on user interactions.
* Now, the tick lines will not appear outside of the plot area.

## [18.1.59] - 06/23/2020

**Bugs**

* Now, the bubble segment will not render if its size and minRadius values are the same.
* Legend state is properly maintained and the series will not be hidden in the dynamic updates.

## [18.1.56] - 06/10/2020

**Bugs**

* Now, the y-axis visible range will be calculated based on the visible points in live update.
* Selection of a single point will not throw any exception.

## [18.1.55] - 06/03/2020

**Bugs**

* Data labels for stacked series will be properly visible.
* Now, the chart will not throw any exceptions for more fraction points.
* User interaction related to zooming is working properly.

## [18.1.54] - 05/26/2020

**Bugs**

* Data labels of the Circular chart is rendering properly with StreamBuilder.

## [18.1.53] - 05/19/2020

**Bugs**

* Now, the chart widget will render with multiple axes without any exception.

## [18.1.52] - 05/14/2020

**Bugs**

* Synchronized panning in multiple charts will be working properly.
* Now, the ranges for the axis will be calculated based on the visible points and ranges.
* Individual data label background color can be customized with the event.

## [18.1.48] - 05/05/2020

**Bugs**

* Now the rotated data labels are aligned properly in Bar series.

## [18.1.46] - 04/28/2020

**Breaking changes**

* Considering the readability, the axis labels rotation of `rotate45` and `rotate90` values in `labelIntersectAction` property is changed from 45, 90 degree to -45, -90 degree respectively. 

**Features**

* Provided option to show an indication when both high and low values are same in financial chart types.

**Bugs**

* Now, the tooltip template will not flicker when the data points overlap each other.
* Technical indicators are updating properly now on dynamic changes.

## [18.1.45] - 04/21/2020

**Bug fixes**

* Now, markers for HiLo series is rendering properly.
* Tooltip is displaying properly without any exception and flickering on the web.

## [18.1.44] - 04/14/2020

**Bug fixes**

* Public methods of trackball and crosshair for financial series and cartesian series with more number of points will be working properly.

## [18.1.43] - 04/07/2020 

**Bug fixes**

* User interactions on the tooltip template will be working properly.
* Now, public methods of trackball and crosshair will be working properly in the live updates.

## [18.1.42] - 04/01/2020 

No changes.

## [18.1.36] - 03/19/2020

**Features** 

* Provided support for financial charts types like High low (HiLo), Open high low close (OHLC) and Candle.
* Provided support for 10 types of technical indicators namely Accumulation distribution, ATR, Bollinger band, EMA, Momentum, RSI, SMA, Stochastic, TMA, and MACD.
* Provided support for 6 types of trendlines namely Linear, Exponential, Power, Logarithmic, Polynomial, and Moving average.
* Provided public methods to show the tooltip/trackball/crosshair by passing data point/index/pixel values.

## [17.4.51] - 02/25/2020

No major changes.

## [17.4.50] - 02/19/2020

**Bug fixes**
* Tooltip will not be shown for the hidden series.
* Plot band text will be properly positioned on panning.
* Spline area with empty point is rendering properly.

**Features** 
* Provided support for showing trackball, tooltip, crosshair based on the pixel, index and points.

## [17.4.46] - 01/30/2020

**Features** 
* Provided support for displaying the trackball dynamically based on the data point index.

**Bug fixes**
* Now, the series will not be visible when `isVisible` property is set to false in initial rendering.
* Data labels are positioned properly on panning.

## [17.4.43] - 01/14/2020

**Bug fixes**
* Now the plot bands are rendering properly when end value is not specified and on panning.
* `onTrackballPositionChanging` event is triggered properly now.
* Panning with visible minimum and maximum values are working fine for DateTime axis now.

## [17.4.40] - 12/17/2019

**Features** 
* Provided support for 100% stacked line, 100% stacked area, 100% stacked column, 100% stacked bar, range area, spline area, and step area chart types.
* Provided support to delay the hiding of trackball and crosshair.
* Provided support to display the tooltip at the pointer location.
* Provided support to calculate the empty points average with a custom implementation.
 
**Breaking changes**
* `borderMode` property in area series has been renamed as `borderDrawMode`.

## [17.3.26] - 11/05/2019

**Bug fixes**
* Data labels are positioned properly and will not collide with the y-axis.
* Now exception will not be thrown while using the chart with tooltip template in the tab widget.

## [17.3.14] - 10/03/2019

**Breaking changes**
* `roundingPlace` property has been changed to `decimalPlaces` in the axis and tooltip.
* `child` property has been changed to `widget` in chart annotation.
* `position` property has been changed to `labelAlignment` in dataLabelSettings.
* `imageUrl` property has been changed to `image` in markerSettings.
* `backgroundImageUrl` property has been changed to `backgroundImage` in SfCartesianChart.
* `initialSelectedDatIndexes` property has been moved to series from SfCartesianChart. 

**Bug fixes**
* Tooltip format with point.y value is working properly now.
* Bar chart with negative values is rendering properly now.

## [1.0.0-beta.5] - 09/17/2019

**Features**
* Stacked line, stacked area, stacked column, stacked bar, range column, pyramid and funnel chart types.
* Logarithmic axis.
* Axis crossing support.
* Plot bands and recursive plot bands support.
* Dynamic data source update animation.

**Bug fixes**
* Tooltip template will not be displayed for hidden series.
* Now the axis interval will be calculated properly for small decimal values.
* Normal range padding is working fine for category axis.
* Few more improvements and bug fixes.

## [1.0.0-beta.4] - 08/29/2019

**Bug fixes**
* Now, the category axis will work properly with additional range padding.
* Now, the column series of category axis with a point can be placed on the ticks.
* Trackball interactive tooltip will be shown only for the visible series.
* On panning with grid lines, the grid lines will be moved within the chart area.
* Panning will work properly on adding or removing the chart series dynamically.
* Now, the data labels will not be hidden on scrolling.
* The circular chart will render at the center position along with the legend.
* Now, the panning is working properly for the inversed axis.
* Now, the data labels appearance can be customized using onDataLabelRender event.
* The tooltip and explode in the circular charts will work together. properly.
* The scatter series is rendering properly with image markers.
* Few more improvements and bug fixes.

## [1.0.0-beta] - 07/16/2019

Initial release.

**Features** 
* Line, spline, area, column, bar, bubble, scatter, step line, fast line, pie, doughnut and radial bar chart types.
* Numeric, category and date time axis types.
* User interactive features like zooming and panning, trackball, crosshair, selection and tooltip.
* Additional features like animation, marker, data label, empty points, legend, annotation and much more.
