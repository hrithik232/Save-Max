library xml.visitors.pretty_writer;

import '../entities/entity_mapping.dart';
import '../nodes/document.dart';
import '../nodes/element.dart';
import '../nodes/node.dart';
import '../nodes/text.dart';
import '../utils/predicate.dart';
import '../utils/token.dart';
import 'writer.dart';

/// A visitor that writes XML nodes correctly indented and with whitespaces
/// adapted.
class XmlPrettyWriter extends XmlWriter {
  int level;
  final String indent;
  final String newLine;
  final Predicate<XmlNode> preserveWhitespace;

  XmlPrettyWriter(
    StringSink buffer, {
    XmlEntityMapping entityMapping,
    int level,
    String indent,
    String newLine,
    Predicate<XmlNode> preserveWhitespace,
  })  : level = level ?? 0,
        indent = indent ?? '  ',
        newLine = newLine ?? '\n',
        preserveWhitespace = preserveWhitespace ?? _defaultPreserveWhitespace,
        super(buffer, entityMapping: entityMapping);

  @override
  void visitDocument(XmlDocument node) {
    buffer.write(indent * level);
    writeIterable(normalizeText(node.children), newLine + indent * level);
  }

  @override
  void visitElement(XmlElement node) {
    buffer.write(XmlToken.openElement);
    visit(node.name);
    writeAttributes(node);
    if (node.children.isEmpty && node.isSelfClosing) {
      buffer.write(XmlToken.closeEndElement);
    } else {
      buffer.write(XmlToken.closeElement);
      if (node.children.isNotEmpty) {
        if (preserveWhitespace(node)) {
          final writer = XmlWriter(buffer, entityMapping: entityMapping);
          node.children.forEach(writer.visit);
        } else if (node.children.every((each) => each is XmlText)) {
          writeIterable(normalizeText(node.children));
        } else {
          level++;
          buffer.write(newLine);
          buffer.write(indent * level);
          writeIterable(normalizeText(node.children), newLine + indent * level);
          level--;
          buffer.write(newLine);
          buffer.write(indent * level);
        }
      }
      buffer.write(XmlToken.openEndElement);
      visit(node.name);
      buffer.write(XmlToken.closeElement);
    }
  }
}

// Normalizes the text nodes within a sequence of nodes. Trims leading and
// trailing whitespaces, replaces all whitespaces with a clean space, removes
// duplicated whitespaces, drops empty nodes, and combines consecutive nodes.
List<XmlNode> normalizeText(List<XmlNode> nodes) {
  final result = <XmlNode>[];
  for (final node in nodes) {
    if (node is XmlText) {
      final text =
          node.text.trim().replaceAll(_whitespaceOrLineTerminators, ' ');
      if (text.isNotEmpty) {
        if (result.isNotEmpty && result.last is XmlText) {
          result.last = XmlText(result.last.text + XmlToken.whitespace + text);
        } else if (node.text != text) {
          result.add(XmlText(text));
        } else {
          result.add(node);
        }
      }
    } else {
      result.add(node);
    }
  }
  return result;
}

final _whitespaceOrLineTerminators = RegExp(r'\s+');

bool _defaultPreserveWhitespace(XmlNode node) => false;
