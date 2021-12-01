library flutter_localized_locales;

import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localized_locales/locales.dart';
import 'package:flutter_localized_locales/native_locale_names.dart';

class LocaleNames {
  static LocaleNames of(BuildContext context) {
    return Localizations.of<LocaleNames>(context, LocaleNames);
  }

  final String locale;
  final Map<String, String> data;
  LocaleNames(this.locale, this.data);

  String nameOf(String code) => data[code];

  List<MapEntry<String, String>> get sortedByCode {
    return data.entries.toList()..sort((a, b) => a.key.compareTo(b.key));
  }

  List<MapEntry<String, String>> get sortedByName {
    return data.entries.toList()..sort((a, b) => a.value.compareTo(b.value));
  }
}

class LocaleNamesLocalizationsDelegate
    extends LocalizationsDelegate<LocaleNames> {
  final AssetBundle bundle;
  const LocaleNamesLocalizationsDelegate({this.bundle});

  /// Returns a [Set] of all available locale codes.
  static Set<String> get locales => Set<String>.from(all_locales);

  /// Returns a [Map] of locale codes to their native locale name.
  static Map<String, String> get nativeLocaleNames => all_native_names;

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<LocaleNames> load(Locale locale) async {
    final String canonicalLocale = Intl.canonicalizedLocale(locale.toString());

    var availableLocale = Intl.verifiedLocale(
        canonicalLocale, (l) => locales.contains(l),
        onFailure: (_) => 'en');
    if (availableLocale == null) {
      return null;
    }

    final data = Map<String, String>.from(
        await _loadJSON('data/$availableLocale.json') as Map<dynamic, dynamic>);
    return LocaleNames(availableLocale, data);
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocaleNames> old) {
    return false;
  }

  Future<dynamic> _loadJSON(key) {
    Future<dynamic> parser(String data) async => jsonDecode(data);
    final bundle = this.bundle ?? rootBundle;
    return bundle.loadStructuredData(
        'packages/flutter_localized_locales/' + key, parser);
  }
}
