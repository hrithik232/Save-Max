part of charts;

class _ChartSeries {
  _ChartSeries();
  SfCartesianChart chart;
  bool isStacked100;
  int paletteIndex = 0;
  num sumOfYvalues = 0;
  List<num> yValues = <num>[];

  /// Contains the visible series for chart
  List<CartesianSeriesRenderer> visibleSeriesRenderers =
      <CartesianSeriesRenderer>[];
  List<_ClusterStackedItemInfo> clusterStackedItemInfo;

  void _processData() {
    final List<CartesianSeriesRenderer> seriesRendererList =
        visibleSeriesRenderers;
    isStacked100 = false;
    paletteIndex = 0;
    _findAreaType(seriesRendererList);
    if (chart.indicators.isNotEmpty) {
      _populateDataPoints(seriesRendererList);
      _calculateIndicators();
      chart._chartAxis?._calculateVisibleAxes();
      _findMinMax(seriesRendererList);
      _renderTrendline();
    } else {
      chart._chartAxis?._calculateVisibleAxes();
      _populateDataPoints(seriesRendererList);
    }
    _calculateStackedValues(_findSeriesCollection(chart));
    _renderTrendline();
  }

  /// Find the data points for each series
  void _populateDataPoints(List<CartesianSeriesRenderer> seriesRendererList) {
    chart._chartState._needsAnimation = false;
    for (CartesianSeriesRenderer seriesRenderer in seriesRendererList) {
      final CartesianSeries<dynamic, dynamic> series = seriesRenderer._series;
      final dynamic _bubbleSize = series.sizeValueMapper;
      seriesRenderer._minimumX = seriesRenderer._minimumY =
          seriesRenderer._maximumX = seriesRenderer._maximumY = null;
      if (seriesRenderer is BubbleSeriesRenderer) {
        seriesRenderer._maxSize = seriesRenderer._minSize = null;
      }
      seriesRenderer._needAnimateSeriesElements = false;
      CartesianChartPoint<dynamic> currentPoint;
      yValues = <num>[];
      sumOfYvalues = 0;
      seriesRenderer._dataPoints = <CartesianChartPoint<dynamic>>[];
      seriesRenderer._xValues = <dynamic>[];
      if (!isStacked100 && seriesRenderer._seriesType.contains('100')) {
        isStacked100 = true;
      }
      if (seriesRenderer is HistogramSeriesRenderer) {
        final HistogramSeries<dynamic, dynamic> series = seriesRenderer._series;
        for (int pointIndex = 0;
            pointIndex < series.dataSource.length;
            pointIndex++) {
          yValues.add(series.yValueMapper(pointIndex) ?? 0);
          sumOfYvalues += yValues[pointIndex] ?? 0;
        }
        seriesRenderer._processData(series, yValues, sumOfYvalues);
        seriesRenderer._histogramValues.minValue =
            seriesRenderer._histogramValues.yValues.reduce(min);
        seriesRenderer._histogramValues.binWidth = series.binInterval ??
            ((3.5 * seriesRenderer._histogramValues.sDValue) /
                    math.pow(
                        seriesRenderer._histogramValues.yValues.length, 1 / 3))
                .round();
      }
      final String _seriesType = seriesRenderer._seriesType;
      final bool needSorting = series.sortingOrder != SortingOrder.none &&
          series.sortFieldValueMapper != null;
      if (series.dataSource != null) {
        dynamic xVal;
        dynamic yVal;
        for (int pointIndex = 0; pointIndex < series.dataSource.length;) {
          currentPoint = _getChartPoint(
              seriesRenderer, series.dataSource[pointIndex], pointIndex);
          xVal = currentPoint?.x;
          yVal = currentPoint?.y;
          currentPoint?.overallDataPointIndex = pointIndex;
          if (xVal != null) {
            dynamic bubbleSize;
            final dynamic _xAxis = seriesRenderer._xAxis;
            final dynamic _yAxis = seriesRenderer._yAxis;
            dynamic xMin = _xAxis?.visibleMinimum;
            dynamic xMax = _xAxis?.visibleMaximum;
            final dynamic yMin = _yAxis?.visibleMinimum;
            final dynamic yMax = _yAxis?.visibleMaximum;
            dynamic xPointValue = xVal;
            int _dataPointsLength;
            bool _isXVisibleRange = true;
            bool _isYVisibleRange = true;
            if (_xAxis is DateTimeAxis) {
              xMin = xMin != null ? xMin.millisecondsSinceEpoch : xMin;
              xMax = xMax != null ? xMax.millisecondsSinceEpoch : xMax;
              xPointValue = xPointValue != null
                  ? xPointValue.millisecondsSinceEpoch
                  : xPointValue;
            } else if (_xAxis is CategoryAxis) {
              xPointValue = pointIndex;
            }
            if (xMin != null || xMax != null) {
              _isXVisibleRange = false;
            }
            if (yMin != null || yMax != null) {
              _isYVisibleRange = false;
            }

            if ((!(chart._chartState.zoomProgress ||
                        chart._chartState.zoomedState == true) &&
                    (xMin != null ||
                        xMax != null ||
                        yMin != null ||
                        yMax != null))
                ? ((xMin != null && xMax != null)
                        ? (xPointValue >= xMin) && (xPointValue <= xMax)
                        : xMin != null
                            ? xPointValue >= xMin
                            : xMax != null ? xPointValue <= xMax : false) ||
                    ((yMin != null && yMax != null)
                        ? (yVal >= yMin) && (yVal <= yMax)
                        : yMin != null
                            ? yVal >= yMin
                            : yMax != null ? yVal <= yMax : false)
                : true) {
              _isXVisibleRange = true;
              _isYVisibleRange = true;
              seriesRenderer._dataPoints.add(currentPoint);
              seriesRenderer._xValues.add(xVal);
              if (seriesRenderer is BubbleSeriesRenderer) {
                bubbleSize = series.sizeValueMapper == null
                    ? 4
                    : _bubbleSize(pointIndex) ?? 4;
                currentPoint.bubbleSize = bubbleSize.toDouble();
                seriesRenderer._maxSize ??= currentPoint.bubbleSize;
                seriesRenderer._minSize ??= currentPoint.bubbleSize;
                seriesRenderer._maxSize =
                    math.max(seriesRenderer._maxSize, currentPoint.bubbleSize);
                seriesRenderer._minSize =
                    math.min(seriesRenderer._minSize, currentPoint.bubbleSize);
              }

              if (_seriesType.contains('range') ||
                      _seriesType.contains('hilo') ||
                      _seriesType.contains('candle')
                  ? _seriesType == 'hiloopenclose' ||
                          _seriesType.contains('candle')
                      ? (currentPoint.low == null ||
                          currentPoint.high == null ||
                          currentPoint.open == null ||
                          currentPoint.close == null)
                      : (currentPoint.low == null || currentPoint.high == null)
                  : currentPoint.y == null) {
                if (seriesRenderer is XyDataSeriesRenderer)
                  seriesRenderer.calculateEmptyPointValue(
                      pointIndex, currentPoint, seriesRenderer);
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
              //determines whether the data source has been changed in-order to perform dynamic animation
              if (!chart._chartState._needsAnimation) {
                _dataPointsLength = seriesRenderer._dataPoints.length;
                if (seriesRenderer._oldSeries == null ||
                    seriesRenderer._oldDataPoints.length < _dataPointsLength) {
                  chart._chartState._needsAnimation = seriesRenderer._visible;
                } else {
                  if (_dataPointsLength <=
                      seriesRenderer._oldDataPoints.length) {
                    chart._chartState._needsAnimation =
                        seriesRenderer._visible &&
                            _findChangesInPoint(
                              currentPoint,
                              seriesRenderer
                                  ._oldDataPoints[_dataPointsLength - 1],
                              seriesRenderer,
                            );
                  } else {
                    chart._chartState._needsAnimation = seriesRenderer._visible;
                  }
                }
              }
            }
            if (seriesRenderer._xAxis != null &&
                seriesRenderer._yAxis != null &&
                !needSorting &&
                chart.indicators.isEmpty) {
              _findMinMaxValue(
                  seriesRenderer._xAxis,
                  seriesRenderer,
                  currentPoint,
                  pointIndex,
                  series.dataSource.length,
                  _isXVisibleRange,
                  _isYVisibleRange);
            }
            if (seriesRenderer is SplineSeriesRenderer && !needSorting) {
              if (pointIndex == 0) {
                seriesRenderer._xValueList.clear();
                seriesRenderer._yValueList.clear();
              }
              if (!currentPoint.isDrop) {
                seriesRenderer._xValueList.add(currentPoint.xValue);
                seriesRenderer._yValueList.add(currentPoint.yValue);
              }
            }
          }
          pointIndex = seriesRenderer._seriesType != 'histogram'
              ? pointIndex + 1
              : pointIndex + yVal;
        }
        if (needSorting) {
          _sortDataSource(seriesRenderer);
          if (chart.indicators.isEmpty) {
            _findSeriesMinMax(seriesRenderer);
          }
        }
      }
    }
  }

  /// To find the minimum and maximum values for axis
  void _findMinMaxValue(ChartAxis axis, CartesianSeriesRenderer seriesRenderer,
      CartesianChartPoint<dynamic> currentPoint, int pointIndex, int dataLength,
      [bool _isXVisibleRange, bool _isYVisibleRange]) {
    if (seriesRenderer._visible) {
      if (axis is NumericAxis) {
        axis._findAxisMinMax(seriesRenderer, currentPoint, pointIndex,
            dataLength, _isXVisibleRange, _isYVisibleRange);
      } else if (axis is CategoryAxis) {
        axis._findAxisMinMax(seriesRenderer, currentPoint, pointIndex,
            dataLength, _isXVisibleRange, _isYVisibleRange);
      } else if (axis is DateTimeAxis) {
        axis._findAxisMinMax(seriesRenderer, currentPoint, pointIndex,
            dataLength, _isXVisibleRange, _isYVisibleRange);
      } else if (axis is LogarithmicAxis) {
        axis._findAxisMinMax(seriesRenderer, currentPoint, pointIndex,
            dataLength, _isXVisibleRange, _isYVisibleRange);
      }
    }
  }

  /// To find the minimum and maximum values for series axis
  void _findSeriesMinMax(CartesianSeriesRenderer seriesRenderer) {
    final dynamic axis = seriesRenderer._xAxis;
    if (seriesRenderer._visible) {
      if (seriesRenderer is SplineSeriesRenderer) {
        seriesRenderer._xValueList.clear();
        seriesRenderer._yValueList.clear();
      }
      for (int pointIndex = 0;
          pointIndex < seriesRenderer._dataPoints.length;
          pointIndex++) {
        _findMinMaxValue(
            axis,
            seriesRenderer,
            seriesRenderer._dataPoints[pointIndex],
            pointIndex,
            seriesRenderer._dataPoints.length,
            true,
            true);
        if (seriesRenderer is SplineSeriesRenderer) {
          if (!seriesRenderer._dataPoints[pointIndex].isDrop) {
            seriesRenderer._xValueList
                .add(seriesRenderer._dataPoints[pointIndex].xValue);
            seriesRenderer._yValueList
                .add(seriesRenderer._dataPoints[pointIndex].yValue);
          }
        }
      }
    }
  }

  void _findMinMax(List<CartesianSeriesRenderer> seriesCollection) {
    for (int seriesIndex = 0;
        seriesIndex < seriesCollection.length;
        seriesIndex++) {
      _findSeriesMinMax(seriesCollection[seriesIndex]);
    }
  }

  /// Method to render a trendline
  void _renderTrendline() {
    for (CartesianSeriesRenderer seriesRenderer in visibleSeriesRenderers) {
      if (seriesRenderer._series.trendlines != null) {
        for (Trendline trendline in seriesRenderer._series.trendlines) {
          trendline._isNeedRender = trendline._visible == true &&
              seriesRenderer._visible &&
              (trendline.type == TrendlineType.polynomial
                  ? (trendline.polynomialOrder >= 2 &&
                      trendline.polynomialOrder <= 6)
                  : trendline.type == TrendlineType.movingAverage
                      ? (trendline.period >= 2 &&
                          trendline.period <=
                              seriesRenderer._series.dataSource.length - 1)
                      : true);
          if (trendline._isNeedRender) {
            trendline._setDataSource(seriesRenderer, chart);
          }
        }
      }
    }
  }

  /// Sort the dataSource
  void _sortDataSource(CartesianSeriesRenderer seriesRenderer) {
    seriesRenderer._dataPoints.sort(
        // ignore: missing_return
        (CartesianChartPoint<dynamic> firstPoint,
            CartesianChartPoint<dynamic> secondPoint) {
      if (seriesRenderer._series.sortingOrder == SortingOrder.ascending) {
        return (firstPoint.sortValue == null)
            ? -1
            : (secondPoint.sortValue == null
                ? 1
                : (firstPoint.sortValue is String
                    ? firstPoint.sortValue
                        .toLowerCase()
                        .compareTo(secondPoint.sortValue.toLowerCase())
                    : firstPoint.sortValue.compareTo(secondPoint.sortValue)));
      } else if (seriesRenderer._series.sortingOrder ==
          SortingOrder.descending) {
        return (firstPoint.sortValue == null)
            ? 1
            : (secondPoint.sortValue == null
                ? -1
                : (firstPoint.sortValue is String
                    ? secondPoint.sortValue
                        .toLowerCase()
                        .compareTo(firstPoint.sortValue.toLowerCase())
                    : secondPoint.sortValue.compareTo(firstPoint.sortValue)));
      }
    });
  }

  /// To calculate stacked values of a stacked series
  void _calculateStackedValues(
      List<CartesianSeriesRenderer> seriesRendererCollection) {
    _StackedItemInfo stackedItemInfo;
    _ClusterStackedItemInfo clusterStackedItemInfo;
    String groupName = ' ';
    List<_StackingInfo> positiveValues;
    List<_StackingInfo> negativeValues;
    CartesianSeriesRenderer seriesRenderer;
    if (isStacked100) {
      _calculateStackingPercentage(seriesRendererCollection);
    }

    chart._chartSeries.clusterStackedItemInfo = <_ClusterStackedItemInfo>[];
    for (int i = 0; i < seriesRendererCollection.length; i++) {
      seriesRenderer = seriesRendererCollection[i];
      if (seriesRenderer is _StackedSeriesRenderer &&
          seriesRenderer._series is _StackedSeriesBase) {
        final _StackedSeriesBase<dynamic, dynamic> stackedSeriesBase =
            seriesRenderer._series;
        if (seriesRenderer._dataPoints.isNotEmpty) {
          groupName = (seriesRenderer._seriesType.contains('stackedarea'))
              ? 'stackedareagroup'
              : (stackedSeriesBase.groupName ?? 'series ' + i.toString());
          stackedItemInfo = _StackedItemInfo(i, seriesRenderer);
          if (chart._chartSeries.clusterStackedItemInfo.isNotEmpty) {
            for (int k = 0;
                k < chart._chartSeries.clusterStackedItemInfo.length;
                k++) {
              clusterStackedItemInfo =
                  chart._chartSeries.clusterStackedItemInfo[k];
              if (clusterStackedItemInfo.stackName == groupName) {
                clusterStackedItemInfo.stackedItemInfo.add(stackedItemInfo);
                break;
              } else if (k ==
                  chart._chartSeries.clusterStackedItemInfo.length - 1) {
                chart._chartSeries.clusterStackedItemInfo.add(
                    _ClusterStackedItemInfo(
                        groupName, <_StackedItemInfo>[stackedItemInfo]));
                break;
              }
            }
          } else {
            chart._chartSeries.clusterStackedItemInfo.add(
                _ClusterStackedItemInfo(
                    groupName, <_StackedItemInfo>[stackedItemInfo]));
          }

          seriesRenderer._stackingValues = <_StackedValues>[];
          _StackingInfo currentPositiveStackInfo;

          if (positiveValues == null || negativeValues == null) {
            positiveValues = <_StackingInfo>[];
            currentPositiveStackInfo = _StackingInfo(groupName, <double>[]);
            positiveValues.add(currentPositiveStackInfo);
            negativeValues = <_StackingInfo>[];
            negativeValues.add(_StackingInfo(groupName, <double>[]));
          }
          _addStackingValues(seriesRenderer, isStacked100, positiveValues,
              negativeValues, currentPositiveStackInfo, groupName);
        }
      }
    }
  }

  /// To add the values of stacked series
  void _addStackingValues(
      CartesianSeriesRenderer seriesRenderer,
      bool isStacked100,
      List<_StackingInfo> positiveValues,
      List<_StackingInfo> negativeValues,
      _StackingInfo currentPositiveStackInfo,
      String groupName) {
    num lastValue, value;
    CartesianChartPoint<dynamic> point;
    _StackingInfo currentNegativeStackInfo;
    final List<double> startValues = <double>[];
    final List<double> endValues = <double>[];
    for (int j = 0; j < seriesRenderer._dataPoints.length; j++) {
      point = seriesRenderer._dataPoints[j];
      value = point.y;
      if (positiveValues.isNotEmpty) {
        for (int k = 0; k < positiveValues.length; k++) {
          if (groupName == positiveValues[k].groupName) {
            currentPositiveStackInfo = positiveValues[k];
            break;
          } else if (k == positiveValues.length - 1) {
            currentPositiveStackInfo = _StackingInfo(groupName, <double>[]);
            positiveValues.add(currentPositiveStackInfo);
          }
        }
      }
      if (negativeValues.isNotEmpty) {
        for (int k = 0; k < negativeValues.length; k++) {
          if (groupName == negativeValues[k].groupName) {
            currentNegativeStackInfo = negativeValues[k];
            break;
          } else if (k == negativeValues.length - 1) {
            currentNegativeStackInfo = _StackingInfo(groupName, <double>[]);
            negativeValues.add(currentNegativeStackInfo);
          }
        }
      }
      if (currentPositiveStackInfo._stackingValues != null) {
        final int length = currentPositiveStackInfo._stackingValues.length;
        if (length == 0 || j > length - 1) {
          currentPositiveStackInfo._stackingValues.add(0);
        }
      }
      if (currentNegativeStackInfo._stackingValues != null) {
        final int length = currentNegativeStackInfo._stackingValues.length;
        if (length == 0 || j > length - 1) {
          currentNegativeStackInfo._stackingValues.add(0);
        }
      }
      if (isStacked100 && seriesRenderer is _StackedSeriesRenderer) {
        value = value / seriesRenderer._percentageValues[j] * 100;
        value = value.isNaN ? 0 : value;
      }
      if (value >= 0) {
        lastValue = currentPositiveStackInfo._stackingValues[j];
        currentPositiveStackInfo._stackingValues[j] = lastValue + value;
      } else {
        lastValue = currentNegativeStackInfo._stackingValues[j];
        currentNegativeStackInfo._stackingValues[j] = lastValue + value;
      }
      startValues.add(lastValue.toDouble());
      endValues.add(value + lastValue);
      if (isStacked100 && endValues[j] > 100) {
        endValues[j] = 100;
      }
      point.cumulativeValue = !seriesRenderer._seriesType.contains('100')
          ? endValues[j]
          : endValues[j].truncateToDouble();
    }
    if (seriesRenderer is _StackedSeriesRenderer)
      seriesRenderer._stackingValues
          .add(_StackedValues(startValues, endValues));
    seriesRenderer._minimumY = startValues.reduce(min);
    seriesRenderer._maximumY = endValues.reduce(max);

    if (seriesRenderer._minimumY > endValues.reduce(min)) {
      seriesRenderer._minimumY = isStacked100 ? -100 : endValues.reduce(min);
    }
    if (seriesRenderer._maximumY < startValues.reduce(max)) {
      seriesRenderer._maximumY = 0;
    }
  }

  /// To find the percentage of stacked series
  void _calculateStackingPercentage(
      List<CartesianSeriesRenderer> seriesRendererCollection) {
    List<_StackingInfo> percentageValues;
    CartesianSeriesRenderer seriesRenderer;
    String groupName;
    _StackingInfo stackingInfo;
    int length;
    num lastValue, value;
    CartesianChartPoint<dynamic> point;
    for (int i = 0; i < seriesRendererCollection.length; i++) {
      seriesRenderer = seriesRendererCollection[i];
      seriesRenderer._yAxis._isStack100 = true;
      if (seriesRenderer is _StackedSeriesRenderer &&
          seriesRenderer._series is _StackedSeriesBase) {
        final _StackedSeriesBase<dynamic, dynamic> stackedSeriesBase =
            seriesRenderer._series;
        if (seriesRenderer._dataPoints.isNotEmpty) {
          groupName = (seriesRenderer._seriesType == 'stackedarea100')
              ? 'stackedareagroup'
              : (stackedSeriesBase.groupName ?? 'series ' + i.toString());

          if (percentageValues == null) {
            percentageValues = <_StackingInfo>[];
            stackingInfo = _StackingInfo(groupName, <double>[]);
          }
          for (int j = 0; j < seriesRenderer._dataPoints.length; j++) {
            point = seriesRenderer._dataPoints[j];
            value = point.y;
            if (percentageValues.isNotEmpty) {
              for (int k = 0; k < percentageValues.length; k++) {
                if (groupName == percentageValues[k].groupName) {
                  stackingInfo = percentageValues[k];
                  break;
                } else if (k == percentageValues.length - 1) {
                  stackingInfo = _StackingInfo(groupName, <double>[]);
                  percentageValues.add(stackingInfo);
                }
              }
            }
            if (stackingInfo._stackingValues != null) {
              length = stackingInfo._stackingValues.length;
              if (length == 0 || j > length - 1) {
                stackingInfo._stackingValues.add(0);
              }
            }
            if (value >= 0) {
              lastValue = stackingInfo._stackingValues[j];
              stackingInfo._stackingValues[j] = lastValue + value;
            } else {
              lastValue = stackingInfo._stackingValues[j];
              stackingInfo._stackingValues[j] = lastValue - value;
            }
            if (j == seriesRenderer._dataPoints.length - 1)
              percentageValues.add(stackingInfo);
          }
        }
        if (percentageValues != null) {
          for (int i = 0; i < percentageValues.length; i++) {
            if (seriesRenderer._seriesType == 'stackedarea100') {
              seriesRenderer._percentageValues =
                  percentageValues[i]._stackingValues;
            } else {
              if (stackedSeriesBase.groupName == percentageValues[i].groupName)
                seriesRenderer._percentageValues =
                    percentageValues[i]._stackingValues;
            }
          }
        }
      }
    }
  }

  /// Calculate area type
  void _findAreaType(List<CartesianSeriesRenderer> seriesRendererList) {
    if (visibleSeriesRenderers.isNotEmpty) {
      int index = -1;
      for (CartesianSeriesRenderer series in seriesRendererList) {
        _setSeriesType(series, index += 1);
      }
    }
  }

  /// To find and set the series type
  void _setSeriesType(CartesianSeriesRenderer seriesRenderer, int index) {
    if (seriesRenderer._series.color == null) {
      seriesRenderer._seriesColor =
          chart.palette[paletteIndex % chart.palette.length];
      paletteIndex++;
    } else {
      seriesRenderer._seriesColor = seriesRenderer._series.color;
    }
    if (seriesRenderer is AreaSeriesRenderer)
      seriesRenderer._seriesType = 'area';
    else if (seriesRenderer is BarSeriesRenderer)
      seriesRenderer._seriesType = 'bar';
    else if (seriesRenderer is BubbleSeriesRenderer)
      seriesRenderer._seriesType = 'bubble';
    else if (seriesRenderer is ColumnSeriesRenderer)
      seriesRenderer._seriesType = 'column';
    else if (seriesRenderer is FastLineSeriesRenderer)
      seriesRenderer._seriesType = 'fastline';
    else if (seriesRenderer is LineSeriesRenderer)
      seriesRenderer._seriesType = 'line';
    else if (seriesRenderer is ScatterSeriesRenderer)
      seriesRenderer._seriesType = 'scatter';
    else if (seriesRenderer is SplineSeriesRenderer)
      seriesRenderer._seriesType = 'spline';
    else if (seriesRenderer is StepLineSeriesRenderer)
      seriesRenderer._seriesType = 'stepline';
    else if (seriesRenderer is StackedColumnSeriesRenderer)
      seriesRenderer._seriesType = 'stackedcolumn';
    else if (seriesRenderer is StackedBarSeriesRenderer)
      seriesRenderer._seriesType = 'stackedbar';
    else if (seriesRenderer is StackedAreaSeriesRenderer)
      seriesRenderer._seriesType = 'stackedarea';
    else if (seriesRenderer is StackedArea100SeriesRenderer)
      seriesRenderer._seriesType = 'stackedarea100';
    else if (seriesRenderer is StackedLineSeriesRenderer)
      seriesRenderer._seriesType = 'stackedline';
    else if (seriesRenderer is StackedLine100SeriesRenderer)
      seriesRenderer._seriesType = 'stackedline100';
    else if (seriesRenderer is RangeColumnSeriesRenderer)
      seriesRenderer._seriesType = 'rangecolumn';
    else if (seriesRenderer is RangeAreaSeriesRenderer)
      seriesRenderer._seriesType = 'rangearea';
    else if (seriesRenderer is StackedColumn100SeriesRenderer)
      seriesRenderer._seriesType = 'stackedcolumn100';
    else if (seriesRenderer is StackedBar100SeriesRenderer)
      seriesRenderer._seriesType = 'stackedbar100';
    else if (seriesRenderer is SplineAreaSeriesRenderer)
      seriesRenderer._seriesType = 'splinearea';
    else if (seriesRenderer is StepAreaSeriesRenderer) {
      seriesRenderer._seriesType = 'steparea';
    } else if (seriesRenderer is HiloSeriesRenderer) {
      seriesRenderer._seriesType = 'hilo';
    } else if (seriesRenderer is HiloOpenCloseSeriesRenderer) {
      seriesRenderer._seriesType = 'hiloopenclose';
    } else if (seriesRenderer is CandleSeriesRenderer) {
      seriesRenderer._seriesType = 'candle';
    } else if (seriesRenderer is HistogramSeriesRenderer) {
      seriesRenderer._seriesType = 'histogram';
    } else if (seriesRenderer is SplineRangeAreaSeriesRenderer) {
      seriesRenderer._seriesType = 'splinerangearea';
    }
    if (index == 0)
      chart._requireInvertedAxis = (!chart.isTransposed &&
              seriesRenderer._seriesType.toLowerCase().contains('bar')) ||
          (chart.isTransposed &&
              !seriesRenderer._seriesType.toLowerCase().contains('bar'));
  }

  ///below method is for indicator rendering
  void _calculateIndicators() {
    if (chart.indicators != null && chart.indicators.isNotEmpty) {
      dynamic indicator;
      bool existField;
      Map<String, int> _map;
      if (!chart.legend.isVisible) {
        final List<String> textCollection = <String>[];
        for (int i = 0; i < chart.indicators.length; i++) {
          final dynamic indicator = chart.indicators[i];
          _setIndicatorType(indicator);
          textCollection.add(indicator._indicatorType);
        }
        //ignore: prefer_collection_literals
        _map = Map<String, int>();
        //ignore: avoid_function_literals_in_foreach_calls
        textCollection.forEach((dynamic str) =>
            _map[str] = !_map.containsKey(str) ? (1) : (_map[str] + 1));
      }

      final List<String> indicatorTextCollection = <String>[];
      for (int i = 0; i < chart.indicators.length; i++) {
        indicator = chart.indicators[i];
        indicator._dataPoints = <CartesianChartPoint<dynamic>>[];
        indicator._index = i;
        if (!chart.legend.isVisible) {
          final int count =
              indicatorTextCollection.contains(indicator._indicatorType)
                  ? _getIndicatorId(
                      indicatorTextCollection, indicator._indicatorType)
                  : 0;
          indicatorTextCollection.add(indicator._indicatorType);
          indicator._name = indicator.name ??
              (indicator._indicatorType +
                  (_map[indicator._indicatorType] == 1
                      ? ''
                      : ' ' + count.toString()));
        }
        if (indicator != null &&
            indicator.isVisible &&
            (indicator.dataSource != null || indicator.seriesName != null)) {
          if (indicator.dataSource != null && indicator.dataSource.isNotEmpty) {
            existField = indicator._indicatorType == 'SMA' ||
                indicator._indicatorType == 'TMA' ||
                indicator._indicatorType == 'EMA';
            final String valueField =
                existField ? _getFieldType(indicator).toLowerCase() : '';
            CartesianChartPoint<dynamic> currentPoint;
            for (int pointIndex = 0;
                pointIndex < indicator.dataSource.length;
                pointIndex++) {
              if (indicator.xValueMapper != null) {
                final dynamic xVal = indicator.xValueMapper(pointIndex);
                num highValue, lowValue, openValue, closeValue, volumeValue;
                indicator._dataPoints
                    .add(CartesianChartPoint<dynamic>(xVal, null));
                currentPoint =
                    indicator._dataPoints[indicator._dataPoints.length - 1];
                if (indicator.highValueMapper != null) {
                  highValue = indicator.highValueMapper(pointIndex);
                  indicator._dataPoints[indicator._dataPoints.length - 1].high =
                      highValue;
                }
                if (indicator.lowValueMapper != null) {
                  lowValue = indicator.lowValueMapper(pointIndex);
                  indicator._dataPoints[indicator._dataPoints.length - 1].low =
                      lowValue;
                }

                ///changing high,low value
                if (currentPoint.high != null && currentPoint.low != null) {
                  final num high = currentPoint.high;
                  final num low = currentPoint.low;
                  currentPoint.high = math.max<num>(high, low);
                  currentPoint.low = math.min<num>(high, low);
                }
                if (indicator.openValueMapper != null) {
                  openValue = indicator.openValueMapper(pointIndex);
                  indicator._dataPoints[indicator._dataPoints.length - 1].open =
                      openValue;
                }
                if (indicator.closeValueMapper != null) {
                  closeValue = indicator.closeValueMapper(pointIndex);
                  indicator._dataPoints[indicator._dataPoints.length - 1]
                      .close = closeValue;
                }
                if (indicator is AccumulationDistributionIndicator &&
                    indicator.volumeValueMapper != null) {
                  volumeValue = indicator.volumeValueMapper(pointIndex);
                  indicator._dataPoints[indicator._dataPoints.length - 1]
                      .volume = volumeValue;
                }

                if ((closeValue == null &&
                        (!existField || valueField == 'close')) ||
                    (highValue == null &&
                        (valueField == 'high' ||
                            indicator._indicatorType == 'AD' ||
                            indicator._indicatorType == 'ATR' ||
                            indicator._indicatorType == 'RSI' ||
                            indicator._indicatorType == 'Stochastic')) ||
                    (lowValue == null &&
                        (valueField == 'low' ||
                            indicator._indicatorType == 'AD' ||
                            indicator._indicatorType == 'ATR' ||
                            indicator._indicatorType == 'RSI' ||
                            indicator._indicatorType == 'Stochastic')) ||
                    (openValue == null && valueField == 'open') ||
                    (volumeValue == null && indicator._indicatorType == 'AD')) {
                  indicator._dataPoints
                      .removeAt(indicator._dataPoints.length - 1);
                }
              }
            }
          } else if (indicator.seriesName != null) {
            dynamic seriesRenderer;
            for (int i = 0;
                i < chart._chartSeries.visibleSeriesRenderers.length;
                i++) {
              if (indicator.seriesName ==
                  chart._chartSeries.visibleSeriesRenderers[i]._series.name) {
                seriesRenderer = chart._chartSeries.visibleSeriesRenderers[i];
                break;
              }
            }
            indicator._dataPoints = (seriesRenderer != null &&
                    (seriesRenderer._seriesType == 'hiloopenclose' ||
                        seriesRenderer._seriesType == 'candle'))
                ? seriesRenderer._dataPoints
                : null;
          }
          if (indicator._dataPoints != null &&
              indicator._dataPoints.isNotEmpty) {
            indicator._initSeriesCollection(indicator, chart);
            indicator._initDataSource(indicator);
            if (indicator._renderPoints.isNotEmpty)
              chart._chartSeries.visibleSeriesRenderers
                  .addAll(indicator._targetSeriesRenderers);
          }
        }
      }
    }
  }

  /// To get the field type of an indicator
  String _getFieldType(TechnicalIndicators<dynamic, dynamic> indicator) {
    String valueField;
    if (indicator is EmaIndicator)
      valueField = indicator.valueField;
    else if (indicator is TmaIndicator)
      valueField = indicator.valueField;
    else if (indicator is SmaIndicator) {
      valueField = indicator.valueField;
    }
    return valueField;
  }

  /// To return the indicator id
  int _getIndicatorId(List<String> list, String str) {
    int count = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i] == str) {
        count++;
      }
    }
    return count;
  }

  /// Setting indicator type
  void _setIndicatorType(TechnicalIndicators<dynamic, dynamic> indicator) {
    if (indicator is AtrIndicator)
      indicator._indicatorType = 'ATR';
    else if (indicator is AccumulationDistributionIndicator)
      indicator._indicatorType = 'AD';
    else if (indicator is BollingerBandIndicator)
      indicator._indicatorType = 'Bollinger';
    else if (indicator is EmaIndicator)
      indicator._indicatorType = 'EMA';
    else if (indicator is MacdIndicator)
      indicator._indicatorType = 'MACD';
    else if (indicator is MomentumIndicator)
      indicator._indicatorType = 'Momentum';
    else if (indicator is RsiIndicator)
      indicator._indicatorType = 'RSI';
    else if (indicator is SmaIndicator)
      indicator._indicatorType = 'SMA';
    else if (indicator is StochasticIndicator)
      indicator._indicatorType = 'Stochastic';
    else if (indicator is TmaIndicator) {
      indicator._indicatorType = 'TMA';
    }
  }
}
