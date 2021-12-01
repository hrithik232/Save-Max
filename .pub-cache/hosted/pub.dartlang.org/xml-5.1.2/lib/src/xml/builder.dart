import 'dart:collection';

import 'entities/entity_mapping.dart';
import 'nodes/attribute.dart';
import 'nodes/cdata.dart';
import 'nodes/comment.dart';
import 'nodes/data.dart';
import 'nodes/declaration.dart';
import 'nodes/document.dart';
import 'nodes/document_fragment.dart';
import 'nodes/element.dart';
import 'nodes/node.dart';
import 'nodes/processing.dart';
import 'nodes/text.dart';
import 'utils/attribute_type.dart';
import 'utils/exceptions.dart';
import 'utils/name.dart';
import 'utils/namespace.dart' as ns;

/// A builder to create XML trees with code.
class XmlBuilder {
  /// If [optimizeNamespaces] is true, the builder will perform some
  /// namespace optimization.
  ///
  /// This means that
  ///  - namespaces that are defined in an element but are never used in this
  ///    element or its children will not be included in the document;
  ///  - namespaces that are defined in an element but are already defined in
  ///    one of the ancestors of the element will not be included again.
  final bool optimizeNamespaces;

  /// The current node stack of this builder.
  final Queue<NodeBuilder> _stack = ListQueue();

  /// Construct a new [XmlBuilder].
  ///
  /// For the meaning of the [optimizeNamespaces] parameter, read the
  /// documentation of the [optimizeNamespaces] property.
  XmlBuilder({this.optimizeNamespaces = false}) {
    _reset();
  }

  /// Adds a [XmlText] node with the provided [text].
  ///
  /// For example, to generate the text _Hello World_ one would write:
  ///
  ///     builder.text('Hello World');
  ///
  void text(Object text) {
    final children = _stack.last.children;
    if (children.isNotEmpty && children.last is XmlText) {
      // Merge consecutive text nodes into one
      final previous = children.removeLast();
      children.add(XmlText('${previous.text}${text.toString()}'));
    } else {
      children.add(XmlText(text.toString()));
    }
  }

  /// Adds a [XmlCDATA] node with the provided [text].
  ///
  /// For example, to generate a CDATA element with the text _Hello World_
  /// one would write:
  ///
  ///     builder.cdata('Hello World');
  ///
  void cdata(Object text) {
    _stack.last.children.add(XmlCDATA(text.toString()));
  }

  /// Adds a [XmlDeclaration] node.
  ///
  /// For example, to generate a XML declaration with the default version _1.0_
  /// and _UTF-8_ encoding one would write:
  ///
  ///      builder.declaration(encoding: 'UTF-8');
  ///
  void declaration(
      {String version = '1.0',
      String? encoding,
      Map<String, String> attributes = const {}}) {
    final declaration = XmlDeclaration()
      ..version = version
      ..encoding = encoding;
    attributes.forEach(declaration.setAttribute);
    _stack.last.children.add(declaration);
  }

  /// Adds a [XmlProcessing] node with the provided [target] and [text].
  ///
  /// For example, to generate a processing element with the _xml-stylesheet_
  /// and the attributes _href="/style.css" type="text/css" title="default
  /// stylesheet"_ one would write:
  ///
  ///     builder.processing(
  ///         'xml-stylesheet',
  ///         'href="/style.css" type="text/css" title="default stylesheet"');
  ///
  void processing(String target, Object text) {
    _stack.last.children.add(XmlProcessing(target, text.toString()));
  }

  /// Adds a [XmlComment] node with the provided [text].
  ///
  /// For example, to generate a comment with the text _Hello World_ one
  /// would write:
  ///
  ///     builder.comment('Hello World');
  ///
  void comment(Object text) {
    _stack.last.children.add(XmlComment(text.toString()));
  }

  /// Adds a [XmlElement] node with the provided tag [name].
  ///
  /// If a [namespace] URI is provided, the prefix is looked up, verified and
  /// combined with the given tag [name].
  ///
  /// If a map of [namespaces] is provided the uri-prefix pairs are added to the
  /// element declaration, see also [XmlBuilder.namespace].
  ///
  /// If a map of [attributes] is provided the name-value pairs are added to the
  /// element declaration, see also [XmlBuilder.attribute].
  ///
  /// Finally, [nest] is used to further customize the element and to add its
  /// children. Typically this is a [Function] that defines elements using the
  /// same builder object. For convenience `nest` can also be a valid [XmlNode],
  /// a string or another common object that will be converted to a string and
  /// added as a text node.
  ///
  /// For example, to generate an element with the tag _message_ and the
  /// contained text _Hello World_ one would write:
  ///
  ///     builder.element('message', nest: 'Hello World');
  ///
  /// To add multiple child elements one would use:
  ///
  ///     builder.element('message', nest: () {
  ///       builder..text('Hello World')
  ///              ..element('break');
  ///     });
  ///
  void element(String name,
      {String? namespace,
      Map<String, String> namespaces = const {},
      Map<String, String> attributes = const {},
      bool isSelfClosing = true,
      Object? nest}) {
    final element = NodeBuilder();
    _stack.addLast(element);
    namespaces.forEach(this.namespace);
    attributes.forEach(attribute);
    if (nest != null) {
      _insert(nest);
    }
    element.name = _buildName(name, namespace);
    element.isSelfClosing = isSelfClosing;
    if (optimizeNamespaces) {
      // Remove unused namespaces: The reason we first add them and then remove
      // them again is to keep the order in which they have been added.
      element.namespaces.forEach((uri, meta) {
        if (!meta.used) {
          final name = meta.name;
          final attribute = element.attributes
              .firstWhere((attribute) => attribute.name == name);
          element.attributes.remove(attribute);
        }
      });
    }
    _stack.removeLast();
    _stack.last.children.add(element.buildElement());
  }

  /// Adds a [XmlAttribute] node with the provided [name] and [value].
  ///
  /// If a [namespace] URI is provided, the prefix is looked up, verified
  /// and combined with the given attribute [name].
  ///
  /// To generate an element with the tag _message_ and the
  /// attribute _lang="en"_ one would write:
  ///
  ///     builder.element('message', nest: () {
  ///        builder.attribute('lang', 'en');
  ///     });
  ///
  void attribute(String name, Object value,
      {String? namespace, XmlAttributeType? attributeType}) {
    final attribute = XmlAttribute(_buildName(name, namespace),
        value.toString(), attributeType ?? XmlAttributeType.DOUBLE_QUOTE);
    _stack.last.attributes.add(attribute);
  }

  /// Adds a raw XML string. The string will be parsed as [XmlDocumentFragment]
  /// and throws an [XmlParserException] if the input is invalid.
  ///
  /// To generate a bookshelf element with two predefined book elements, one
  /// would write:
  ///
  ///     builder.element('bookshelf', nest: () {
  ///       builder.xml('<book><title>Growing a Language</title></book>');
  ///       builder.xml('<book><title>Learning XML</title></book>');
  ///     });
  ///
  void xml(String input, {XmlEntityMapping? entityMapping}) {
    final fragment =
        XmlDocumentFragment.parse(input, entityMapping: entityMapping);
    _stack.last.children.add(fragment);
  }

  /// Binds a namespace [prefix] to the provided [uri]. The [prefix] can be
  /// omitted to declare a default namespace. Throws an [ArgumentError] if
  /// the [prefix] is invalid or conflicts with an existing declaration.
  void namespace(String uri, [String? prefix]) {
    if (prefix == ns.xmlns || prefix == ns.xml) {
      throw ArgumentError('The "$prefix" prefix cannot be bound.');
    }
    if (optimizeNamespaces &&
        _stack.any((builder) =>
            builder.namespaces.containsKey(uri) &&
            builder.namespaces[uri]!.prefix == prefix)) {
      // Namespace prefix already correctly specified in an ancestor.
      return;
    }
    if (_stack.last.namespaces.values.any((meta) => meta.prefix == prefix)) {
      throw ArgumentError(
          'The "$prefix" prefix conflicts with existing binding.');
    }
    final meta = NamespaceData(prefix, false);
    _stack.last.attributes
        .add(XmlAttribute(meta.name, uri, XmlAttributeType.DOUBLE_QUOTE));
    _stack.last.namespaces[uri] = meta;
  }

  /// Return the resulting [XmlNode].
  @Deprecated('Use buildDocument() or buildFragment() instead')
  XmlNode build() => buildDocument();

  /// Builds the resulting [XmlDocument].
  XmlDocument buildDocument() => _build((builder) => builder.buildDocument());

  /// Builds the resulting [XmlDocumentFragment].
  XmlDocumentFragment buildFragment() =>
      _build((builder) => builder.buildFragment());

  // Internal method to finalize the result and reset the builder.
  T _build<T extends XmlNode>(T Function(NodeBuilder builder) builder) {
    if (_stack.length != 1) {
      throw StateError('Unable to build an incomplete DOM element.');
    }
    try {
      return builder(_stack.last);
    } finally {
      _reset();
    }
  }

  // Internal method to reset the node stack.
  void _reset() {
    _stack.clear();
    final node = NodeBuilder();
    node.namespaces[ns.xmlUri] = NamespaceData.xmlData;
    _stack.addLast(node);
  }

  // Internal method to build a name.
  XmlName _buildName(String name, String? uri) {
    if (uri != null && uri.isNotEmpty) {
      final meta = _lookup(uri);
      meta.used = true;
      return XmlName(name, meta.prefix);
    } else {
      return XmlName.fromString(name);
    }
  }

  // Internal method to lookup an namespace prefix.
  NamespaceData _lookup(String uri) {
    final builder = _stack.lastWhere(
        (builder) => builder.namespaces.containsKey(uri),
        orElse: () => throw ArgumentError('Undefined namespace: $uri'));
    return builder.namespaces[uri]!;
  }

  // Internal method to add children to the current element.
  void _insert(Object? value) {
    if (value is Function) {
      value();
    } else if (value is Iterable) {
      value.forEach(_insert);
    } else if (value is XmlNode) {
      if (value is XmlText) {
        // Text nodes need to be unwrapped for merging.
        text(value.text);
      } else if (value is XmlAttribute) {
        // Attributes must be copied and added to the attributes list.
        _stack.last.attributes.add(value.copy());
      } else if (value is XmlElement || value is XmlData) {
        // Children nodes must be copied and added to the children list.
        _stack.last.children.add(value.copy());
      } else if (value is XmlDocumentFragment) {
        // Document fragments must be copied and unwrapped.
        value.children.map((element) => element.copy()).forEach(_insert);
      } else {
        throw ArgumentError('Unable to add element of type ${value.nodeType}');
      }
    } else {
      text(value.toString());
    }
  }
}

class NamespaceData {
  final String? prefix;
  bool used;

  static final NamespaceData xmlData = NamespaceData(ns.xml, true);

  NamespaceData(this.prefix, [this.used = false]);

  XmlName get name => prefix == null || prefix!.isEmpty
      ? XmlName(ns.xmlns)
      : XmlName(prefix!, ns.xmlns);
}

class NodeBuilder {
  final Map<String, NamespaceData> namespaces = {};

  final List<XmlAttribute> attributes = [];

  final List<XmlNode> children = [];

  bool isSelfClosing = true;

  late final XmlName name;

  XmlElement buildElement() =>
      XmlElement(name, attributes, children, isSelfClosing);

  XmlDocument buildDocument() => XmlDocument(children);

  XmlDocumentFragment buildFragment() => XmlDocumentFragment(children);
}
