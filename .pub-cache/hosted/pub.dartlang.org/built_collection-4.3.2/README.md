# Built Collections for Dart
[![Build Status](https://travis-ci.org/google/built_collection.dart.svg?branch=master)](https://travis-ci.org/google/built_collection.dart)
## Introduction

Built Collections are immutable collections using the
[builder pattern](http://en.wikipedia.org/wiki/Builder_pattern).

Each of the core SDK collections is split in two: a mutable builder class
and an immutable "built" class. Builders are for computation,
"built" classes are for safely sharing with no need to copy defensively.

Immutable collections work particularly well with immutable values. See
[built_value](https://github.com/google/built_value.dart#built-values-for-dart).

You can read more about built_collection
[on medium](https://medium.com/@davidmorgan_14314/darts-built-collection-for-immutable-collections-db662f705eff).

## Design

Built Collections:

* are immutable, if the elements/keys/values used are immutable;
* are comparable;
* are hashable;
* reject nulls;
* require generic type parameters;
* reject wrong-type elements;
* use copy-on-write to avoid copying unnecessarily.

See below for details on each of these points.


## A note about strong mode

Please note that from version `1.1.0` built_collection must be used in
conjunction with
[strong mode](https://github.com/dart-lang/dev_compiler/blob/master/STRONG_MODE.md)
to get all the type guarantees. That is, your project must have no warnings or
errors when analyzed with the strong mode analyzer. This allows some runtime
checks to be skipped because the equivalent check can be done statically.


## Recommended Style

A project can benefit greatly from using Built Collections throughout.
Methods that will not mutate a collection can accept the "built" version,
making it clear that no mutation will happen and completely avoiding
the need for defensive copying.

For code that is public to other projects or teams not using
Built Collections, prefer to accept `Iterable` where possible. That way
your code is compatible with SDK collections, Built Collections and any
other collection implementation that builds on `Iterable`.

It's okay to accept `List`, `Set` or `Map` if needed. Built Collections
provide efficient conversion to their SDK counterparts via
`BuiltList.toList`, `BuiltListMultimap.toMap`, `BuiltSet.toSet`,
`BuiltMap.toMap` and `BuiltSetMultimap.toMap`.


## Built Collections are Immutable

Built Collections do not offer any methods that modify the collection. In
order to make changes, first call `toBuilder` to get a mutable builder.

In particular, Built Collections do not implement or extend their mutable
counterparts. `BuiltList` implements `Iterable`, but not `List`. `BuiltSet`
implements `Iterable`, but not `Set`. `BuiltMap`, `BuiltListMultimap` and
`BuiltSetMultimap` share no interface with the SDK collections.

Built Collections can contain mutable elements. However, this use is not
recommended, as mutations to the elements will break comparison and
hashing.


## Built Collections are Comparable

Core SDK collections do not offer equality checks by default.

Built Collections do a deep comparison against other Built Collections
of the same type, only. Hashing is used to make repeated comparisons fast.


## Built Collections are Hashable

Core SDK collections do not compute a deep hashCode.

Built Collections do compute, and cache, a deep hashCode. That means they
can be stored inside collections that need hashing, such as hash sets and
hash maps. They also use the cached hash code to speed up repeated
comparisons.


## Built Collections Reject Nulls

A `null` in a collection is usually a bug, so Built Collections and their
builders throw if given a `null` element, key or value.


## Built Collections Require Generic Type Parameters

A `List<dynamic>` is error-prone because it can be assigned to a `List` of
any type without warning. So, all Built Collections must be created with
explicit element, key or value types.


## Built Collections Reject Wrong-type Elements, Keys and Values

Collections that happen to contain elements, keys or values that are not of
the right type can lead to difficult-to-find bugs. So, all Built
Collections and their builders are aggressive about validating types, even
with checked mode disabled.


## Built Collections Avoid Copying Unnecessarily

Built Collections and their builder and helper types collaborate to avoid
copying unless it's necessary.

In particular, `BuiltList.toList`, `BuiltListMultimap.toMap`,
`BuiltSet.toSet`, `BuiltMap.toMap` and `BuiltSetMultimap.toMap` do not make
a copy, but return a copy-on-write wrapper. So, Built Collections can be
efficiently and easily used with code that needs core SDK collections but
does not mutate them.

When you want to provide a collection that explicitly _throws_ when a
mutation is attempted, use `BuiltList.asList`,
`BuiltListMultimap.asMap`, `BuiltSet.asSet`, `BuiltSetMultimap.asMap`
and `BuiltMap.asMap`.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/google/built-collection-dart/issues
