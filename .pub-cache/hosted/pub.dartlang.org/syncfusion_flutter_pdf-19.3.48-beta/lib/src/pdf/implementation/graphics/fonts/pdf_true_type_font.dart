part of pdf;

/// Represents TrueType font.
///
/// ```dart
/// //Create a new PDF document.
/// PdfDocument document = PdfDocument();
/// //Create a new PDF true type font instance and draw string to PDF page.
/// document.pages.add().graphics.drawString(
///     'Hello World!',
///     PdfTrueTypeFont(fontStream, 12),
///     brush: PdfBrushes.black,
///     bounds: Rect.fromLTWH(0, 0, 100, 50));
/// //Saves the document.
/// List<int> bytes = document.save();
/// //Dispose the document.
/// document.dispose();
/// ```
class PdfTrueTypeFont extends PdfFont {
  /// Initializes a new instance of the [PdfTrueTypeFont] class.
  ///
  /// fontData represents the font sream formated as list of bytes.
  /// size represents the font size to draw the text.
  /// style and multistyle are used to set font styles.
  ///
  /// ```dart
  /// //Create a new PDF document.
  /// PdfDocument document = PdfDocument();
  /// //Create a new PDF true type font instance and draw string to PDF page.
  /// document.pages.add().graphics.drawString(
  ///     'Hello World!',
  ///     PdfTrueTypeFont(fontStream, 12),
  ///     brush: PdfBrushes.black,
  ///     bounds: Rect.fromLTWH(0, 0, 100, 50));
  /// //Saves the document.
  /// List<int> bytes = document.save();
  /// //Dispose the document.
  /// document.dispose();
  /// ```
  PdfTrueTypeFont(List<int> fontData, double size,
      {PdfFontStyle? style, List<PdfFontStyle>? multiStyle}) {
    _initializeFont(fontData, size, style, multiStyle);
  }

  /// Initializes a new instance of the [PdfTrueTypeFont] class.
  ///
  /// fontdata represents the font stream as base64 string format.
  /// size represents the font size to draw the text.
  /// style and multistyle are used to set font styles.
  ///
  /// ```dart
  /// //Create a new PDF document.
  /// PdfDocument document = PdfDocument();
  /// //Font stream in base64 string format
  /// String base64 = 'AAEAAAATAQAABAAwRFNJRzlPG+EAASMQAAAdgKMbEAAAAAy/k2Tw==';
  /// //Create a new PDF true type font instance with font data as base64 string.
  /// PdfFont font = PdfTrueTypeFont(base64, 12);
  /// //Draw string to PDF page.
  /// document.pages.add().graphics.drawString(
  ///     'Hello World!',
  ///     font,
  ///     brush: PdfBrushes.black,
  ///     bounds: Rect.fromLTWH(0, 0, 100, 50));
  /// //Saves the document.
  /// List<int> bytes = doc.save();
  /// //Dispose the document.
  /// doc.dispose();
  /// ```
  PdfTrueTypeFont.fromBase64String(String fontData, double size,
      {PdfFontStyle? style, List<PdfFontStyle>? multiStyle}) {
    if (fontData.isEmpty) {
      throw ArgumentError.value(fontData, 'fontData', 'Invalid font data');
    }
    _initializeFont(base64.decode(fontData), size, style, multiStyle);
  }

  //Fields
  bool? _unicode;
  late _UnicodeTrueTypeFont _fontInternal;

  //Implementation
  void _initializeFont(List<int> fontData, double size, PdfFontStyle? style,
      List<PdfFontStyle>? multiStyle) {
    _initialize(size, style: style, multiStyle: multiStyle);
    _unicode = true;
    _createFontInternals(fontData);
  }

  void _createFontInternals(List<int> fontData) {
    _fontInternal = _UnicodeTrueTypeFont(fontData, _size);
    _calculateStyle(style);
    _initializeInternals();
  }

  void _calculateStyle(PdfFontStyle style) {
    int? iStyle = _fontInternal._ttfMetrics!.macStyle;
    if (_isUnderline) {
      iStyle = iStyle! | PdfFont._getPdfFontStyle(PdfFontStyle.underline);
    }
    if (_isStrikeout) {
      iStyle = iStyle! | PdfFont._getPdfFontStyle(PdfFontStyle.strikethrough);
    }
    _fontStyle = iStyle!;
  }

  void _initializeInternals() {
    _fontInternal._createInternals();
    final _IPdfPrimitive? internals = _fontInternal._fontDictionary;
    _metrics = _fontInternal._metrics;
    if (internals == null) {
      throw ArgumentError.value(internals, 'font internal cannot be null');
    }
    _fontInternals = internals;
  }

  void _setSymbols(String text, List<String>? internalUsedChars) {
    _fontInternal._setSymbols(text, internalUsedChars);
  }

  double _getCharWidth(String charCode, PdfStringFormat? format) {
    double codeWidth = _fontInternal._getCharWidth(charCode);
    codeWidth *= 0.001 * _metrics!._getSize(format)!;
    return codeWidth;
  }

  //_IPdfWrapper elements
  @override
  _IPdfPrimitive? get _element => _fontInternals;

  @override
  //ignore: unused_element
  set _element(_IPdfPrimitive? value) {
    _fontInternals = value;
  }

  @override
  double _getLineWidth(String line, PdfStringFormat? format) {
    double width = 0;
    String text = line;
    if (format != null && format.textDirection != PdfTextDirection.none) {
      final _ArabicShapeRenderer renderer = _ArabicShapeRenderer();
      text = renderer.shape(line.split(''), 0);
    }
    width = _fontInternal._getLineWidth(text);
    final double size = _metrics!._getSize(format)!;
    width *= 0.001 * size;
    width = _applyFormatSettings(text, format, width);
    return width;
  }
}
