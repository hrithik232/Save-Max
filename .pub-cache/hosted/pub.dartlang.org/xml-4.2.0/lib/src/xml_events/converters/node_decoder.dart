library xml_events.converters.node_decoder;

import 'dart:convert' show Converter, ChunkedConversionSink;

import 'package:convert/convert.dart' show AccumulatorSink;

import '../../../xml.dart'
    show
        XmlAttribute,
        XmlCDATA,
        XmlComment,
        XmlDeclaration,
        XmlDoctype,
        XmlElement,
        XmlName,
        XmlNode,
        XmlProcessing,
        XmlTagException,
        XmlText;
import '../event.dart';
import '../events/cdata_event.dart';
import '../events/comment_event.dart';
import '../events/declaration_event.dart';
import '../events/doctype_event.dart';
import '../events/end_element_event.dart';
import '../events/event_attribute.dart';
import '../events/processing_event.dart';
import '../events/start_element_event.dart';
import '../events/text_event.dart';
import '../visitor.dart';

/// A converter that decodes a sequence of [XmlEvent] objects to a forest of
/// [XmlNode] objects.
class XmlNodeDecoder extends Converter<List<XmlEvent>, List<XmlNode>> {
  const XmlNodeDecoder();

  @override
  List<XmlNode> convert(List<XmlEvent> input) {
    final accumulator = AccumulatorSink<List<XmlNode>>();
    final converter = startChunkedConversion(accumulator);
    converter.add(input);
    converter.close();
    return accumulator.events.expand((list) => list).toList(growable: false);
  }

  @override
  ChunkedConversionSink<List<XmlEvent>> startChunkedConversion(
          Sink<List<XmlNode>> sink) =>
      _XmlNodeDecoderSink(sink);
}

class _XmlNodeDecoderSink extends ChunkedConversionSink<List<XmlEvent>>
    with XmlEventVisitor {
  _XmlNodeDecoderSink(this.sink);

  final Sink<List<XmlNode>> sink;
  XmlElement parent;

  @override
  void add(List<XmlEvent> chunk) => chunk.forEach(visit);

  @override
  void visitCDATAEvent(XmlCDATAEvent event) => commit(XmlCDATA(event.text));

  @override
  void visitCommentEvent(XmlCommentEvent event) =>
      commit(XmlComment(event.text));

  @override
  void visitDeclarationEvent(XmlDeclarationEvent event) =>
      commit(XmlDeclaration(convertAttributes(event.attributes)));

  @override
  void visitDoctypeEvent(XmlDoctypeEvent event) =>
      commit(XmlDoctype(event.text));

  @override
  void visitEndElementEvent(XmlEndElementEvent event) {
    if (parent == null) {
      throw XmlTagException('Unexpected </${event.name}>.');
    }
    if (parent.name.qualified != event.name) {
      throw XmlTagException(
          'Expected </${parent.name.qualified}>, but found </${event.name}>.');
    }
    if (!parent.hasParent) {
      sink.add([parent]);
    }
    parent = parent.parent;
  }

  @override
  void visitProcessingEvent(XmlProcessingEvent event) =>
      commit(XmlProcessing(event.target, event.text));

  @override
  void visitStartElementEvent(XmlStartElementEvent event) {
    final element = XmlElement(
      XmlName.fromString(event.name),
      convertAttributes(event.attributes),
      [],
      event.isSelfClosing,
    );
    if (event.isSelfClosing) {
      commit(element);
    } else {
      if (parent != null) {
        parent.children.add(element);
      }
      parent = element;
    }
  }

  @override
  void visitTextEvent(XmlTextEvent event) => commit(XmlText(event.text));

  @override
  void close() {
    if (parent != null) {
      throw XmlTagException('Missing closing </${parent.name.qualified}>');
    }
    sink.close();
  }

  void commit(XmlNode node) {
    if (parent == null) {
      sink.add(<XmlNode>[node]);
    } else {
      parent.children.add(node);
    }
  }

  Iterable<XmlAttribute> convertAttributes(
          Iterable<XmlEventAttribute> attributes) =>
      attributes.map((attribute) => XmlAttribute(
          XmlName.fromString(attribute.name),
          attribute.value,
          attribute.attributeType));
}
