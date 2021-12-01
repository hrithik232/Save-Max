Dart XML
========

[![Pub Package](https://img.shields.io/pub/v/xml.svg)](https://pub.dev/packages/xml)
[![Build Status](https://travis-ci.org/renggli/dart-xml.svg)](https://travis-ci.org/renggli/dart-xml)
[![Coverage Status](https://coveralls.io/repos/renggli/dart-xml/badge.svg)](https://coveralls.io/r/renggli/dart-xml)
[![GitHub Issues](https://img.shields.io/github/issues/renggli/dart-xml.svg)](https://github.com/renggli/dart-xml/issues)
[![GitHub Forks](https://img.shields.io/github/forks/renggli/dart-xml.svg)](https://github.com/renggli/dart-xml/network)
[![GitHub Stars](https://img.shields.io/github/stars/renggli/dart-xml.svg)](https://github.com/renggli/dart-xml/stargazers)
[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/renggli/dart-xml/master/LICENSE)

Dart XML is a lightweight library for parsing, traversing, querying, transforming and building XML documents.

This library is open source, stable and well tested. Development happens on [GitHub](http://github.com/renggli/dart-xml). Feel free to report issues or create a pull-request there. General questions are best asked on [StackOverflow](http://stackoverflow.com/questions/tagged/xml+dart).

The package is hosted on [dart packages](https://pub.dev/packages/xml). Up-to-date [class documentation](https://pub.dev/documentation/xml/latest/) is created with every release.


Tutorial
--------

### Installation

Follow the installation instructions on [dart packages](https://pub.dev/packages/xml#-installing-tab-).

Import the library into your Dart code using:

```dart
import 'package:xml/xml.dart';
```

### Reading and Writing

To read XML input use the factory method `XmlDocument.parse(String input)`:

```dart
final bookshelfXml = '''<?xml version="1.0"?>
    <bookshelf>
      <book>
        <title lang="english">Growing a Language</title>
        <price>29.99</price>
      </book>
      <book>
        <title lang="english">Learning XML</title>
        <price>39.95</price>
      </book>
      <price>132.00</price>
    </bookshelf>''';
final document = XmlDocument.parse(bookshelfXml);
```

The resulting object is an instance of `XmlDocument`. In case the document cannot be parsed, a `XmlParserException` is thrown.

To write back the parsed XML document, simply call `toString()` or `toXmlString(...)` if you need more control:

```dart
print(document.toString());
print(document.toXmlString(pretty: true, indent: '\t'));
```

### Traversing and Querying

Accessors allow to access nodes in the XML tree:

- `attributes` returns a list over the attributes of the current node.
- `children` returns a list over the children of the current node.

Both lists are mutable and support all common `List` methods, such as `add(XmlNode)`, `addAll(Iterable<XmlNode>)`, `insert(int, XmlNode)`, and `insertAll(int, Iterable<XmlNode>)`. Trying to add a `null` value or an unsupported node type throws an `XmlNodeTypeError` error. Nodes that are already part of a tree _are not_ automatically moved, you need to first create a copy as otherwise an `XmlParentError` is thrown. `XmlDocumentFragment` nodes are automatically expanded and copies of their children are added.

There are various methods to traverse the XML tree along its axes:

- `preceding` returns an iterable over nodes preceding the opening tag of the current node in document order.
- `descendants` returns an iterable over the descendants of the current node in document order. This includes the attributes of the current node, its children, the grandchildren, and so on.
- `following` the nodes following the closing tag of the current node in document order.
- `ancestors` returns an iterable over the ancestor nodes of the current node, that is the parent, the grandparent, and so on. Note that this is the only iterable that traverses nodes in reverse document order.

For example, the `descendants` iterator could be used to extract all textual contents from an XML tree:

```dart
final textual = document.descendants
    .where((node) => node is XmlText && !node.text.trim().isEmpty)
    .join('\n');
print(textual);
```

Additionally, there are helpers to find elements with a specific tag:

- `getElement(String name)` finds the first direct child with the provided tag `name`, or `null`.
- `findElements(String name)` finds direct children of the current node with the provided tag `name`.
- `findAllElements(String name)` finds direct and indirect children of the current node with the provided tag `name`.

For example, to find all the nodes with the _&lt;title&gt;_ tag you could write:

```dart
final titles = document.findAllElements('title');
```

The above code returns a lazy iterator that recursively walks the XML document and yields all the element nodes with the requested tag name. To extract the textual contents call `text`:

```dart
titles
    .map((node) => node.text)
    .forEach(print);
```

This prints _Growing a Language_ and _Learning XML_.

Similarly, to compute the total price of all the books one could write the following expression:

```dart
final total = document.findAllElements('book')
    .map((node) => double.parse(node.findElements('price').single.text))
    .reduce((a, b) => a + b);
print(total);
```

Note that this first finds all the books, and then extracts the price to avoid counting the price tag that is included in the bookshelf.

### Building

While it is possible to instantiate and compose `XmlDocument`, `XmlElement` and `XmlText` nodes manually, the `XmlBuilder` provides a simple fluent API to build complete XML trees. To create the above bookshelf example one would write:

```dart
final builder = XmlBuilder();
builder.processing('xml', 'version="1.0"');
builder.element('bookshelf', nest: () {
  builder.element('book', nest: () {
    builder.element('title', nest: () {
      builder.attribute('lang', 'english');
      builder.text('Growing a Language');
    });
    builder.element('price', nest: 29.99);
  });
  builder.element('book', nest: () {
    builder.element('title', nest: () {
      builder.attribute('lang', 'english');
      builder.text('Learning XML');
    });
    builder.element('price', nest: 39.95);
  });
  builder.element('price', nest: 132.00);
});
final bookshelfXml = builder.build();
```

Note the `element` method. It is quite sophisticated and supports many different optional named arguments:

- The most common is the `nest:` argument which is used to insert contents into the element. In most cases this will be a function that calls more methods on the builder to define attributes, declare namespaces and add child elements. However, the argument can also be a string or an arbitrary Dart object that is converted to a string and added as a text node.
- While attributes can be defined from within the element, for simplicity there is also an argument `attributes:` that takes a map to define simple name-value pairs.
- Furthermore we can provide an URI as the namespace of the element using `namespace:` and declare new namespace prefixes using `namespaces:`. For details see the documentation of the method.

The builder pattern allows you to easily extract repeated parts into specific methods. In the example above, one could put the part that writes a book into a separate method as follows:

```dart
buildBook(XmlBuilder builder, String title, String language, num price) {
  builder.element('book', nest: () {
    builder.element('title', nest: () {
      builder.attribute('lang', 'english');
      builder.text(title);
    });
    builder.element('price', nest: price);
  });
}
```

### Streaming

Reading large XML files and instantiating their DOM into the memory can be expensive. As an alternative this library provides the possibility to read and transform XML documents as a sequence of events using [Dart Streams](https://dart.dev/tutorials/language/streams). This approach is comparable to event-driven SAX parsing known from other libraries.

```dart
import 'package:xml/xml_events.dart';
```

In the most simple case you can get a `Iterable<XmlEvent>` over the input string using the following code. This parses the input lazily, and only parses input when requested:

```dart
parseEvents(bookshelfXml)
    .whereType<XmlTextEvent>()
    .map((event) => event.text.trim())
    .where((text) => text.isNotEmpty)
    .forEach(print);
```

To asynchronously parse and process events directly from a file or HTTP stream use the provided codecs, encoders and decoders:

1. `XmlEventCodec` converts between `String` and `XmlEvent` sequences:
    - `XmlEventDecoder` decodes a `String` to a sequence of `XmlEvent` objects.
    - `XmlEventEncoder` encodes a sequence of `XmlEvent` objects to a `String`.
2. `XmlNodeCodec` converts between `XmlEvent` sequences and `XmlNode` trees.
    - `XmlNodeDecoder` decodes a sequence of `XmlEvent` objects to a forest of `XmlNode` objects.
    - `XmlNodeEncoder` decodes a forest of `XmlNode` objects to a sequence of `XmlEvent` objects.
3. `XmlNormalizer` normalizes a sequence of `XmlEvent`, namely combines adjacent and removes empty text events.

For example the following snippet downloads data from the Internet, converts the UTF-8 input to a Dart `String`, decodes the stream of characters to `XmlEvent`s, and finally normalizes and prints the events:

```dart
final url = Uri.parse('http://ip-api.com/xml/');
final request = await httpClient.getUrl(url);
final response = await request.close();
final stream = response
    .transform(utf8.decoder)
    .transform(const XmlEventDecoder())
    .transform(const XmlNormalizer())
    .expand((events) => events)
    .forEach((event) => print(event));
```

Misc
----

### Examples

There are numerous packages depending on this package:

- [image](https://github.com/brendan-duncan/image) decodes, encodes and processes image formats.
- [StageXL](http://www.stagexl.org/) is a 2D rendering engine.
- [Extensible Resource Descriptors](https://github.com/stevenroose/dart-xrd) is a library to read Extensible Resource Descriptors.
- [xml2json](https://github.com/shamblett/xml2json) is an XML to JSON conversion package.
- [spreadsheet_decoder](https://github.com/sestegra/spreadsheet_decoder) is a library for decoding and updating spreadsheets for ODS and XLSX files.
- [and many more](https://pub.dev/packages?q=dependency%3Axml) ...

### Supports

- Standard well-formed XML (and HTML).
- Reading documents using an event based API (SAX).
- Decodes and encodes commonly used character entities.
- Querying, traversing, and mutating API using Dart principles.
- Building XML trees using a builder API.

### Limitations

- Doesn't validate namespace declarations.
- Doesn't validate schema declarations.
- Doesn't parse and enforce DTD.

### Standards

- [Extensible Markup Language (XML) 1.0](https://www.w3.org/TR/xml/)
- [Namespaces in XML 1.0](https://www.w3.org/TR/xml-names/)
- [W3C DOM4](https://www.w3.org/TR/domcore/)

### History

This library started as an example of the [PetitParser](https://github.com/renggli/PetitParserDart) library. To my own surprise various people started to use it to read XML files. In April 2014 I was asked to replace the original [dart-xml](https://github.com/prujohn/dart-xml) library from John Evans.

### License

The MIT License, see [LICENSE](https://github.com/renggli/dart-xml/raw/master/LICENSE).
