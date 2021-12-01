part of core;

//ignore: avoid_classes_with_only_static_members
/// The class for license validation.
class SyncfusionLicense {
  static const String _key = 'SyNcFuSiOn@DevPlatForm';
  static bool _shouldValidate = true;
  static const String _packageVersion = '18.2.0.44';
  static const String _platform = 'Flutter';
  static String _registeredKey;
  static String _content;

  /// <summary>
  /// Method to decrypt the license key information.
  /// </summary>
  /// <param name="encryptedKey">encryptedKey</param>
  static _KeyInfo _decrypt(String encryptedKey) {
    try {
      final Uint8List bytes = base64.decode(encryptedKey);
      encryptedKey = ascii.decode(bytes);
      final StringBuffer stringBuffer = StringBuffer();
      for (int i = 0, k = 0; i < encryptedKey.length; i++) {
        k = k < _key.length ? k++ : 0;
        final List<int> encryptedKeyValue =
            encodeUtf32(encryptedKey.substring(i, i + 1));
        final List<int> encryptedBaseKeyValue =
            encodeUtf32(_key.substring(k, k + 1));
        final int x = encryptedKeyValue[encryptedKeyValue.length - 1] ^
            encryptedBaseKeyValue[encryptedBaseKeyValue.length - 1];
        final List<int> encryptedBytes = <int>[];
        for (int j = 0; j < encryptedKeyValue.length; j++) {
          if (j == encryptedKeyValue.length - 1) {
            encryptedBytes.add(x);
          } else {
            encryptedBytes.add(encryptedKeyValue[j]);
          }
        }
        stringBuffer.write(decodeUtf32(encryptedBytes));
      }
      final String decryptedText = stringBuffer.toString();
      final String platform = decryptedText.split(';')[0];
      final String version = decryptedText.split(';')[1];
      final String dateFormat = decryptedText.split(';')[2];
      final String year = dateFormat.split(' ')[0].split('/')[2];
      final String month = dateFormat.split(' ')[0].split('/')[0];
      final String date = dateFormat.split(' ')[0].split('/')[1];
      String hours = dateFormat.split(' ')[1].split(':')[0];
      String minutes = dateFormat.split(' ')[1].split(':')[1];
      String seconds = dateFormat.split(' ')[1].split(':')[2];
      hours = hours.length == 1 ? ('0' + hours) : hours;
      minutes = minutes.length == 1 ? ('0' + minutes) : minutes;
      seconds = seconds.length == 1 ? ('0' + seconds) : seconds;
      final String exactFormat = year +
          '-' +
          (month.length == 1 ? ('0' + month) : month) +
          '-' +
          (date.length == 1 ? ('0' + date) : date) +
          ' ' +
          (dateFormat.split(' ')[2] == 'AM'
              ? (hours + ':' + minutes + ':' + seconds)
              : ((int.parse(hours) + 12).toString() +
                  ':' +
                  minutes +
                  ':' +
                  seconds));
      final DateTime expiryDate = DateTime.parse(exactFormat);
      final String mailID = decryptedText.split(';')[3];
      return _KeyInfo(
          version: version,
          platform: platform,
          expiryDate: expiryDate,
          mailID: mailID);
    } catch (e) {
      print('The Exception is : $e');
      return null;
    }
  }

  /// <summary>
  /// Method to validate the license and display popup.
  /// </summary>
  /// <param name="context">context</param>
  static String validateLicense([BuildContext context]) {
    String _licenseBeforeContent, _licenseUrl, _licenseAfterContent;
    bool _isValid = true;
    if (_shouldValidate) {
      _shouldValidate = false;
      if (_registeredKey == null) {
        _licenseBeforeContent =
            'This application was built using a trial version of Syncfusion '
            'Essential Studio. Please include a valid license to permanently '
            'remove this license validation message. You can also obtain a '
            'free 30 day evaluation license to temporarily remove this message '
            'during the evaluation period. Please refer to this help topic(';
        _licenseUrl = 'https://help.syncfusion.com/es/licensing/';
        _licenseAfterContent = ') for more information.';
      } else {
        final List<String> keyCollection = _registeredKey.split(';');
        for (int i = 0; i < keyCollection.length; i++) {
          final _KeyInfo keyInfo = _decrypt(keyCollection[i]);
          if (keyInfo == null) {
            _licenseBeforeContent =
                'The included Syncfusion license is invalid. Please refer to '
                'this help topic(';
            _licenseUrl = 'https://help.syncfusion.com/es/licensing/invalid/';
            _licenseAfterContent = ') for more information';
          } else if (_getExactVersion(keyInfo.version) ==
                  _getExactVersion(_packageVersion) &&
              keyInfo.platform.toLowerCase() == _platform.toLowerCase()) {
            final DateTime expiryDate = keyInfo.expiryDate;
            final DateTime currentDate = DateTime.now();
            _isValid = currentDate.millisecondsSinceEpoch >
                expiryDate.millisecondsSinceEpoch;
            _licenseBeforeContent =
                'Your Syncfusion trial license has expired. Please refer '
                'to this help topic(';
            _licenseUrl = 'https://help.syncfusion.com/es/licensing/expired/';
            _licenseAfterContent = ') for more information.';
          } else if (_getExactVersion(keyInfo.version) !=
                  _getExactVersion(_packageVersion) &&
              keyInfo.platform.toLowerCase() == _platform.toLowerCase()) {
            final String keyInfoVersion = keyInfo.version;
            _licenseBeforeContent =
                'The included Syncfusion license (v$keyInfoVersion) is invalid '
                'for version $_packageVersion. Please refer to this help '
                'topic(';
            _licenseUrl =
                'https://help.syncfusion.com/es/licensing/version-mismatch/';
            _licenseAfterContent = ') for more information.';
          } else if (_getExactVersion(keyInfo.version) ==
                  _getExactVersion(_packageVersion) &&
              keyInfo.platform.toLowerCase() != _platform.toLowerCase()) {
            _licenseBeforeContent =
                'The included Syncfusion license is invalid (Platform '
                'mismatch).Please refer to this help topic(';
            _licenseUrl =
                'https://help.syncfusion.com/es/licensing/platform-mismatch/';
            _licenseAfterContent = ') for more information.';
          } else {
            _isValid = false;
          }
          if (keyInfo != null && keyInfo.platform.toLowerCase() == 'flutter') {
            break;
          }
        }
      }
      _content = _isValid
          ? (_licenseBeforeContent + _licenseUrl + _licenseAfterContent)
          : null;
      // To display the pop up.
      if (context != null && _isValid) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final ThemeData themeData = Theme.of(context);
          final Brightness brightness = themeData.brightness;
          final Color backgroundColor =
              brightness == Brightness.dark ? Colors.black : Colors.white;
          final Color textColor =
              backgroundColor == Colors.white ? Colors.black : Colors.white;
          showDialog<dynamic>(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                    padding:
                        (!kIsWeb || MediaQuery.of(context).size.width < 800)
                            ? const EdgeInsets.all(0)
                            : EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.25,
                                0,
                                MediaQuery.of(context).size.width * 0.25,
                                0),
                    child: AlertDialog(
                        titleTextStyle: TextStyle(
                            color: textColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        backgroundColor: backgroundColor,
                        title: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text('Syncfusion License')),
                        content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  child: Container(
                                      child: RichText(
                                          text: TextSpan(children: <InlineSpan>[
                                TextSpan(
                                    text: _licenseBeforeContent,
                                    style: TextStyle(color: textColor)),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => _onOpen(_licenseUrl),
                                    text: _licenseUrl,
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(
                                    text: _licenseAfterContent,
                                    style: TextStyle(color: textColor)),
                              ])))),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                      child: Text('Know more about licensing',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 14.0)),
                                      onTap: () => launch(
                                          'https://help.syncfusion.com/common/essential-studio/licensing/license-key'))),
                            ]),
                        actions: <Widget>[
                          FlatButton(
                              autofocus: true,
                              color: const Color(0xFF64B5F6),
                              textColor: Colors.white,
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ]));
              });
        });
      }
    }
    return _content;
  }

  static String _getExactVersion(String version) {
    final List<String> splitVer = version.split('.');
    return splitVer[0] + '.' + splitVer[1];
  }

  static Future<void> _onOpen(String urlLink) async {
    if (await canLaunch(urlLink)) {
      await launch(urlLink);
    } else {
      throw 'Could not launch $urlLink';
    }
  }

  /// <summary>
  /// Method to register the license key.
  /// </summary>
  /// <param name="licenseKey">licenseKey</param>
  static void registerLicense(String licenseKey) {
    _registeredKey = licenseKey;
  }
}

/// Class to store the key information
class _KeyInfo {
  _KeyInfo({this.version, this.platform, this.expiryDate, this.mailID});

  /// Variable to get and set Studio Version
  final String version;

  /// Variable to get and set Platform
  final String platform;

  /// Variable to get and set Expiry Date
  final DateTime expiryDate;

  /// Variable to get and set Mail ID
  final String mailID;
}
