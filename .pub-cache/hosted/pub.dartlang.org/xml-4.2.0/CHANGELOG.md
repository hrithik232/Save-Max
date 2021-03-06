# Changelog

## 4.2.0

* Deprecate standalone `XmlDocument parse(String input)` method, and introduce factory methods in the respective nodes `XmlDocument.parse(String input)` and `XmlDocumentFragment.parse(String input)`.
* Introduce getters and setters for `XmlNode.innerText` (in most cases an alias to `XmlNode.text`), `XmlNode.innerXml` and `XmlNode.outerXml`.
* Improved support for `XmlDocumentFragment` across the library.
* Remove the `XmlDocument.text` override, which returned `null`.
* Add `XmlNode.replace(XmlNode other)` to make it easier to replace nodes in an existing tree.
* Add `XmlNode.getElement(String name)` as a shortcut to find the first child element with a given name.
* Add `XmlNode.firstElementChild` and `XmlNode.lastElementChild` to easy access the first/last child element.
* Add support to selectively disable whitespace normalization while pretty-printing, for example `document.toXmlString(pretty: true, preserveWhitespace: (node) => node is XmlElement && node.name.local == 'pre')` would keep everything within `<pre>` tags as-is.

## 4.1.0

* Improve the pretty printing and the customization of the pretty printing:
  * `XmlWriter` and `XmlPrettyWriter` are now initialized with optional arguments.
  * Pretty printing now also supports to customize the newline support.
  * Example is updated to also syntax highlight / colorize the output.
* Add full namespace support to attribute accessors `setAttribute` and `removeAttribute`.
* Improved documentation, particularly started a section on `xml_events` package.

## 4.0.0

* Cleanup the node hierarchy. Specifically removed `XmlOwned` and `XmlParent` that added a lot of complexity and confusion. Instead introduced dedicated mixins for nodes with attributes (`XmlHasAttributes`), children (`XmlHasChildren`), names (`XmlHasName`) or parents (`XmlHasParent`).
* Introduce `XmlDeclaration` nodes, events and builder to make accessing XML version and encoding simpler.

## 3.7.0

* Update to PetitParser 3.0.0.
* Dart 2.7 compatibility and requirement.

## 3.6.0

* Entity decoding and encoding is now configurable with an `XmlEntityMapping`. All operations that 
  read or write XML can now (optionally) be configured with an entity mapper.
* The default entity mapping used only maps XML entities, as opposed to all HTML entities as in 
  previous versions. To get the old behavior use `XmlDefaultEntityMapping.html5`.
* Made `XmlParserError` a `FormatException` to follow typical Dart exception style. 
* Add an example demonstrating the interaction with HTTP APIs.

## 3.5.0

* Dart 2.3 compatibility and requirement.
* Turn various abstract classes into proper mixins.
* Numerous documentation improvements and code optimizations.
* Add an event parser example.

## 3.4.0

* Dart 2.2 compatibility and requirement.
* Take advantage of PetitParser fast-parse mode:
  * 15-30% faster DOM parsing, and
  * 15-50% faster event parsing.
* Improve error messages and reporting.

## 3.3.0

* New event based parsing in `xml_events`:
  * Lazy event parsing from a XML string into an `Iterable` of `XmlEvent`.
  * Async converters between streams of XML, `XmlEvent` and `XmlNode`.
* Clean up package structure by moving internal packages into the `src/` subtree.
* Remove the experimental SAX parser, the event parser allows more flexible streaming XML consumption.

## 3.2.4

* Remove unnecessary whitespace when printing self-closing tags.
* Remember if an element is self-closing for stable printing.

## 3.2.0

* Migrated to PetitParser 2.0

## 3.1.0

* Drop Dart 1.0 compatibility
* Cleanup, optimization and improved documentation
* Add experimental support for SAX parsing

## 3.0.0

* Mutable DOM
* Cleaned up documentation
* Dart 2.0 strong mode compatibility
* Reformatted using dartfmt

## 2.6.0

* Fix CDATA encoding
* Migrate to micro libraries
* Fixed linter issues

## 2.5.0

* Generic Method syntax with Dart 1.21

## 2.4.5

* Do no longer use ArgumentErrors, but instead use proper exceptions.

## 2.4.4

* Fixed attribute escaping
* Preserve single and double quotes

## 2.4.3

* Improved documentation

## 2.4.2

* Use enum as the node type

## 2.4.1

* Fixed attribute escaping

## 2.4.0

* Fixed linter issues
* Cleanup node hierarchy

## 2.3.2

* Improved documentation

## 2.3.1

* Improved test coverage

## 2.3.0

* Improved comments
* Optimize namespaces

## 2.2.2

* Formatted source

## 2.2.1

* Cleanup pretty printing

## 2.2.0

* Improved comments
