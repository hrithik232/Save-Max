library sanitizer_dart;

import 'package:test/test.dart';
import 'package:validators/sanitizers.dart' as s;

main() {
  test('toString', () {
    ({
      1: '1',
      1.5: '1.5',
      {1: 2}: '{1: 2}',
      null: ''
    })
        .forEach((k, v) => expect(s.toString(k), v));
  });

  test('toDate', () {
    ({'2012-02-27 13:27:00': DateTime.parse('2012-02-27 13:27:00'), 'abc': null})
        .forEach((k, v) => expect(s.toDate(k), v));
  });

  test('toFloat', () {
    ({'1': 1.0, '2.': 2.0, '-1.4': -1.4, 'foo': isNaN}).forEach((k, v) => expect(s.toFloat(k), v));
  });

  test('toInt', () {
    ({'1.4': 1, '2.': 2, 'foo': isNaN}).forEach((k, v) => expect(s.toInt(k), v));
  });

  test('toBoolean', () {
    ({'0': false, '': false, '1': true, 'true': true, 'foobar': true, '   ': true})
        .forEach((k, v) => expect(s.toBoolean(k), v));
  });

  test('toBoolean strict', () {
    ({'0': false, '': false, '1': true, 'true': true, 'foobar': false, '   ': false})
        .forEach((k, v) => expect(s.toBoolean(k, true), v));
  });

  test('trim', () {
    expect(s.trim('  \r\n\tfoo  \r\n\t   '), 'foo');
  });

  test('trim 01', () {
    expect(s.trim('010100201000', '01'), '2');
  });

  test('ltrim', () {
    expect(s.ltrim('  \r\n\tfoo  \r\n\t   '), 'foo  \r\n\t   ');
  });

  test('ltrim 01', () {
    expect(s.ltrim('010100201000', '01'), '201000');
  });

  test('rtrim', () {
    ({'  \r\n\tfoo  \r\n\t   ': '  \r\n\tfoo'}).forEach((k, v) => expect(s.rtrim(k), v));
  });

  test('rtrim 01', () {
    expect(s.rtrim('010100201000', '01'), '0101002');
  });

  test('whitelist', () {
    ({'abcdef': 'abc', 'aaaaaaaaaabbbbbbbbbb': 'aaaaaaaaaabbbbbbbbbb', 'a1b2c3': 'abc', '   ': ''})
        .forEach((k, v) => expect(s.whitelist(k, 'abc'), v));
  });

  test('blacklist', () {
    ({'abcdef': 'def', 'aaaaaaaaaabbbbbbbbbb': '', 'a1b2c3': '123', '   ': '   '})
        .forEach((k, v) => expect(s.blacklist(k, 'abc'), v));
  });

  test('stripLow keep new lines', () {
    ({"foo\x0A\x0D": "foo\x0A\x0D", "\x03foo\x0A\x0D": "foo\x0A\x0D"})
        .forEach((k, v) => expect(s.stripLow(k, true), v));
  });

  test('stripLow', () {
    ({
      "foo\x00": "foo",
      "\x7Ffoo\x02": "foo",
      "\x01\x09": "",
      "foo\x0A\x0D": "foo",
      "perch\u00e9": "perch\u00e9",
      "\u20ac": "\u20ac",
      "\u2206\x0A": "\u2206"
    })
        .forEach((k, v) => expect(s.stripLow(k), v));
  });

  test('escape', () {
    ({
      '<img alt="foo&bar">': '&lt;img alt=&quot;foo&amp;bar&quot;&gt;',
      "<img alt='foo&bar'>": '&lt;img alt=&#x27;foo&amp;bar&#x27;&gt;'
    })
        .forEach((k, v) => expect(s.escape(k), v));
  });

  test('normalizeEmail', () {
    ({
      'test@me.com': 'test@me.com',
      'some.name@gmail.com': 'somename@gmail.com',
      'some.name@googleMail.com': 'somename@gmail.com',
      'some.name+extension@gmail.com': 'somename@gmail.com',
      'some.Name+extension@GoogleMail.com': 'somename@gmail.com',
      'some.name.middleName+extension@gmail.com': 'somenamemiddlename@gmail.com',
      'some.name.middleName+extension@GoogleMail.com': 'somenamemiddlename@gmail.com',
      'some.name.midd.leNa.me.+extension@gmail.com': 'somenamemiddlename@gmail.com',
      'some.name.midd.leNa.me.+extension@GoogleMail.com': 'somenamemiddlename@gmail.com',
      'some.name+extension@unknown.com': 'some.name+extension@unknown.com',
      'hans@m端ller.com': 'hans@m端ller.com',
      'an invalid email address': '',
      '': ''
    })
        .forEach((k, v) => expect(s.normalizeEmail(k), v));
  });

  test('normalizeEmail no lowercase', () {
    ({
      'test@me.com': 'test@me.com',
      'hans@m端ller.com': 'hans@m端ller.com',
      'test@ME.COM': 'test@me.com',
      'TEST@me.com': 'TEST@me.com',
      'TEST@ME.COM': 'TEST@me.com',
      'blAH@x.com': 'blAH@x.com',
      'SOME.name@GMAIL.com': 'somename@gmail.com',
      'SOME.name.middleName+extension@GoogleMail.com': 'somenamemiddlename@gmail.com',
      'SOME.name.midd.leNa.me.+extension@gmail.com': 'somenamemiddlename@gmail.com'
    })
        .forEach((k, v) => expect(s.normalizeEmail(k, {'lowercase': false}), v));
  });
}
