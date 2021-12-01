part of excel;

///Self correct the spanning of rows and columns by checking their cross-sectional relationship between if exists.
_selfCorrectSpanMap(Excel _excel) {
  _excel._mergeChangeLook.forEach((key) {
    if (_isContain(_excel._sheetMap['$key']) &&
        _excel._sheetMap['$key']._spanList != null &&
        _excel._sheetMap['$key']._spanList.isNotEmpty) {
      List<_Span> spanList =
          List<_Span>.from(_excel._sheetMap['$key']._spanList);

      for (int i = 0; i < spanList.length; i++) {
        if (spanList[i] != null) {
          _Span checkerPos = spanList[i];
          int startRow = checkerPos.rowSpanStart,
              startColumn = checkerPos.columnSpanStart,
              endRow = checkerPos.rowSpanEnd,
              endColumn = checkerPos.columnSpanEnd;

          for (int j = i + 1; j < spanList.length; j++) {
            if (spanList[j] != null) {
              _Span spanObj = spanList[j];

              Map<String, List<int>> gotMap = _isLocationChangeRequired(
                  startColumn, startRow, endColumn, endRow, spanObj);
              List<int> gotPosition = gotMap["gotPosition"];
              int changeValue = gotMap["changeValue"][0];

              if (changeValue == 1) {
                startColumn = gotPosition[0];
                startRow = gotPosition[1];
                endColumn = gotPosition[2];
                endRow = gotPosition[3];
                spanList[j] = null;
              } else {
                Map<String, List<int>> gotMap2 = _isLocationChangeRequired(
                    spanObj.columnSpanStart,
                    spanObj.rowSpanStart,
                    spanObj.columnSpanEnd,
                    spanObj.rowSpanEnd,
                    checkerPos);
                List<int> gotPosition2 = gotMap2["gotPosition"];
                int changeValue2 = gotMap2["changeValue"][0];

                if (changeValue2 == 1) {
                  startColumn = gotPosition2[0];
                  startRow = gotPosition2[1];
                  endColumn = gotPosition2[2];
                  endRow = gotPosition2[3];
                  spanList[j] = null;
                }
              }
            }
          }
          _Span spanObj1 = _Span();
          spanObj1._start = [startRow, startColumn];
          spanObj1._end = [endRow, endColumn];
          spanList[i] = spanObj1;
        }
      }
      _excel._sheetMap['$key']._spanList = List<_Span>.from(spanList);
      _excel._sheetMap['$key']._cleanUpSpanMap();
    }
  });

  _excel._mergeChangeLook.forEach((key) {
    if (_isContain(_excel._sheetMap['$key'])) {
      _excel._sheetMap['$key'].spannedItems;
    }
  });
}
