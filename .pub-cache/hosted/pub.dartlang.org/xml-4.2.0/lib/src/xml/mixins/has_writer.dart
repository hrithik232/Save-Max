library xml.mixins.has_writer;

import '../entities/entity_mapping.dart';
import '../nodes/node.dart';
import '../utils/predicate.dart';
import '../visitors/pretty_writer.dart';
import '../visitors/writer.dart';
import 'has_visitor.dart';

/// Mixin to serialize XML to a [StringBuffer].
mixin XmlHasWriter implements XmlHasVisitor {
  /// Return a default XML string of this object.
  /// Return an XML string of this object.
  ///
  /// If [pretty] is set to `true` the output is nicely reformatted, otherwise
  /// the tree is emitted verbatim.
  ///
  /// The [entityMapping] defines how character entities are encoded into the
  /// resulting output.
  ///
  /// All other options are used for pretty printing only:
  /// - The option [indent] defines the indention of nodes, by default nodes
  ///   are indented with 2 spaces.
  /// - The option [newLine] defines the printing of new lines, by default
  ///   the standard new-line `'\n'` character is used.
  /// - The option [level] customizes the initial indention level, by default
  ///   this is `0`.
  /// - If the predicate [preserveWhitespace] returns `true`, the whitespace
  ///   characters within the node are preserved. By default all whitespace
  ///   is normalized.
  String toXmlString({
    bool pretty = false,
    XmlEntityMapping entityMapping,
    int level,
    String indent,
    String newLine,
    Predicate<XmlNode> preserveWhitespace,
  }) {
    final buffer = StringBuffer();
    final writer = pretty
        ? XmlPrettyWriter(buffer,
            entityMapping: entityMapping,
            level: level,
            indent: indent,
            newLine: newLine,
            preserveWhitespace: preserveWhitespace)
        : XmlWriter(buffer, entityMapping: entityMapping);
    writer.visit(this);
    return buffer.toString();
  }

  @override
  String toString() => toXmlString();
}
