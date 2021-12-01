// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'binding.dart';
import 'keyboard_key.dart';
import 'raw_keyboard.dart';

/// Represents a lock mode of a keyboard, such as [KeyboardLockMode.capsLock].
///
/// A lock mode locks some of a keyboard's keys into a distinct mode of operation,
/// depending on the lock settings selected. The status of the mode is toggled
/// with each key down of its corresponding logical key. A [KeyboardLockMode]
/// object is used to query whether this mode is enabled on the keyboard.
///
/// Only a limited number of modes are supported, which are enumerated as
/// static members of this class. Manual constructing of this class is
/// prohibited.
@immutable
class KeyboardLockMode {
  // KeyboardLockMode has a fixed pool of supported keys, enumerated as static
  // members of this class, therefore constructing is prohibited.
  const KeyboardLockMode._(this.logicalKey);

  /// The logical key that triggers this lock mode.
  final LogicalKeyboardKey logicalKey;

  /// Represents the number lock mode on the keyboard.
  ///
  /// On supporting systems, enabling number lock mode usually allows key
  /// presses of the number pad to input numbers, instead of acting as up, down,
  /// left, right, page up, end, etc.
  static const KeyboardLockMode numLock = KeyboardLockMode._(LogicalKeyboardKey.numLock);

  /// Represents the scrolling lock mode on the keyboard.
  ///
  /// On supporting systems and applications (such as a spreadsheet), enabling
  /// scrolling lock mode usually allows key presses of the cursor keys to
  /// scroll the document instead of the cursor.
  static const KeyboardLockMode scrollLock = KeyboardLockMode._(LogicalKeyboardKey.scrollLock);

  /// Represents the capital letters lock mode on the keyboard.
  ///
  /// On supporting systems, enabling capital lock mode allows key presses of
  /// the letter keys to input uppercase letters instead of lowercase.
  static const KeyboardLockMode capsLock = KeyboardLockMode._(LogicalKeyboardKey.capsLock);

  static final Map<int, KeyboardLockMode> _knownLockModes = <int, KeyboardLockMode>{
    numLock.logicalKey.keyId: numLock,
    scrollLock.logicalKey.keyId: scrollLock,
    capsLock.logicalKey.keyId: capsLock,
  };

  /// Returns the [KeyboardLockMode] constant from the logical key, or
  /// null, if not found.
  static KeyboardLockMode? findLockByLogicalKey(LogicalKeyboardKey logicalKey) => _knownLockModes[logicalKey.keyId];
}

/// Defines the interface for keyboard key events.
///
/// The [KeyEvent] provides a universal model for key event information from a
/// hardware keyboard across platforms.
///
/// See also:
///
///  * [HardwareKeyboard] for full introduction to key event model and handling.
///  * [KeyDownEvent], a subclass for events representing the user pressing a
///    key.
///  * [KeyRepeatEvent], a subclass for events representing the user holding a
///    key, causing repeated events.
///  * [KeyUpEvent], a subclass for events representing the user releasing a
///    key.
@immutable
abstract class KeyEvent with Diagnosticable {
  /// Create a const KeyEvent by providing each field.
  const KeyEvent({
    required this.physicalKey,
    required this.logicalKey,
    this.character,
    required this.timeStamp,
    this.synthesized = false,
  });

  /// Returns an object representing the physical location of this key.
  ///
  /// A [PhysicalKeyboardKey] represents a USB HID code sent from the keyboard,
  /// ignoring the key map, modifier keys (like SHIFT), and the label on the key.
  ///
  /// [PhysicalKeyboardKey]s are used to describe and test for keys in a
  /// particular location. A [PhysicalKeyboardKey] may have a name, but the name
  /// is a mnemonic ("keyA" is easier to remember than 0x70004), derived from the
  /// key's effect on a QWERTY keyboard. The name does not represent the key's
  /// effect whatsoever (a physical "keyA" can be the Q key on an AZERTY
  /// keyboard.)
  ///
  /// For instance, if you wanted to make a game where the key to the right of
  /// the CAPS LOCK key made the player move left, you would be comparing a
  /// physical key with [PhysicalKeyboardKey.keyA], since that is the key next to
  /// the CAPS LOCK key on a QWERTY keyboard. This would return the same thing
  /// even on an AZERTY keyboard where the key next to the CAPS LOCK produces a
  /// "Q" when pressed.
  ///
  /// If you want to make your app respond to a key with a particular character
  /// on it regardless of location of the key, use [KeyEvent.logicalKey] instead.
  ///
  /// Also, even though physical keys are defined with USB HID codes, their
  /// values are not necessarily the same HID codes produced by the hardware and
  /// presented to the driver, because on most platforms Flutter has to map the
  /// platform representation back to an HID code since the original HID
  /// code is not provided. USB HID is simply a conveniently well-defined
  /// standard to list possible keys that a Flutter app can encounter.
  ///
  /// See also:
  ///
  ///  * [logicalKey] for the non-location specific key generated by this event.
  ///  * [character] for the character generated by this keypress (if any).
  final PhysicalKeyboardKey physicalKey;

  /// Returns an object representing the logical key that was pressed.
  ///
  /// {@template flutter.services.KeyEvent.logicalKey}
  /// This method takes into account the key map and modifier keys (like SHIFT)
  /// to determine which logical key to return.
  ///
  /// If you are looking for the character produced by a key event, use
  /// [KeyEvent.character] instead.
  ///
  /// If you are collecting text strings, use the [TextField] or
  /// [CupertinoTextField] widgets, since those automatically handle many of the
  /// complexities of managing keyboard input, like showing a soft keyboard or
  /// interacting with an input method editor (IME).
  /// {@endtemplate}
  final LogicalKeyboardKey logicalKey;

  /// Returns the Unicode character (grapheme cluster) completed by this
  /// keystroke, if any.
  ///
  /// This will only return a character if this keystroke, combined with any
  /// preceding keystroke(s), generats a character, and only on a "key down"
  /// event. It will return null if no character has been generated by the
  /// keystroke (e.g. a "dead" or "combining" key), or if the corresponding key
  /// is a key without a visual representation, such as a modifier key or a
  /// control key. It will also return null if this is a "key up" event.
  ///
  /// This can return multiple Unicode code points, since some characters (more
  /// accurately referred to as grapheme clusters) are made up of more than one
  /// code point.
  ///
  /// The [character] doesn't take into account edits by an input method editor
  /// (IME), or manage the visibility of the soft keyboard on touch devices. For
  /// composing text, use the [TextField] or [CupertinoTextField] widgets, since
  /// those automatically handle many of the complexities of managing keyboard
  /// input.
  ///
  /// The [character] is not available on [KeyUpEvent]s.
  final String? character;

  /// Time of event, relative to an arbitrary start point.
  ///
  /// All events share the same timeStamp origin.
  final Duration timeStamp;

  /// Whether this event is synthesized by Flutter to synchronize key states.
  ///
  /// An non-[synthesized] event is converted from a native event, and a native
  /// event can only be converted to one non-[synthesized] event. Some properties
  /// might be changed during the conversion (for example, a native repeat event
  /// might be converted to a Flutter down event when necessary.)
  ///
  /// A [synthesized] event is created without a source native event in order to
  /// synthronize key states. For example, if the native platform shows that a
  /// shift key that was previously held has been released somehow without the
  /// key up event dispatched (probably due to loss of focus), a synthesized key
  /// up event will be added to regularized the event stream.
  ///
  /// For detailed introduction to the regularized event model, see
  /// [HardwareKeyboard].
  ///
  /// Defaults to false.
  final bool synthesized;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<PhysicalKeyboardKey>('physicalKey', physicalKey));
    properties.add(DiagnosticsProperty<LogicalKeyboardKey>('logicalKey', logicalKey));
    properties.add(StringProperty('character', character));
    properties.add(DiagnosticsProperty<Duration>('timeStamp', timeStamp));
    properties.add(FlagProperty('synthesized', value: synthesized, ifTrue: 'synthesized'));
  }
}

/// An event indicating that the user has pressed a key down on the keyboard.
///
/// See also:
///
///  * [KeyRepeatEvent], a key event representing the user
///    holding a key, causing repeated events.
///  * [KeyUpEvent], a key event representing the user
///    releasing a key.
///  * [HardwareKeyboard], which produces this event.
class KeyDownEvent extends KeyEvent {
  /// Creates a key event that represents the user pressing a key.
  const KeyDownEvent({
    required PhysicalKeyboardKey physicalKey,
    required LogicalKeyboardKey logicalKey,
    String? character,
    required Duration timeStamp,
    bool synthesized = false,
  }) : super(
         physicalKey: physicalKey,
         logicalKey: logicalKey,
         character: character,
         timeStamp: timeStamp,
         synthesized: synthesized,
       );
}

/// An event indicating that the user has released a key on the keyboard.
///
/// See also:
///
///  * [KeyDownEvent], a key event representing the user
///    pressing a key.
///  * [KeyRepeatEvent], a key event representing the user
///    holding a key, causing repeated events.
///  * [HardwareKeyboard], which produces this event.
class KeyUpEvent extends KeyEvent {
  /// Creates a key event that represents the user pressing a key.
  const KeyUpEvent({
    required PhysicalKeyboardKey physicalKey,
    required LogicalKeyboardKey logicalKey,
    required Duration timeStamp,
    bool synthesized = false,
  }) : super(
         physicalKey: physicalKey,
         logicalKey: logicalKey,
         timeStamp: timeStamp,
         synthesized: synthesized,
       );
}

/// An event indicating that the user has been holding a key on the keyboard
/// and causing repeated events.
///
/// See also:
///
///  * [KeyDownEvent], a key event representing the user
///    pressing a key.
///  * [KeyUpEvent], a key event representing the user
///    releasing a key.
///  * [HardwareKeyboard], which produces this event.
class KeyRepeatEvent extends KeyEvent {
  /// Creates a key event that represents the user pressing a key.
  const KeyRepeatEvent({
    required PhysicalKeyboardKey physicalKey,
    required LogicalKeyboardKey logicalKey,
    String? character,
    required Duration timeStamp,
  }) : super(
         physicalKey: physicalKey,
         logicalKey: logicalKey,
         character: character,
         timeStamp: timeStamp,
       );
}

/// The signature for [HardwareKeyboard.addHandler], a callback to to decide whether
/// the entire framework handles a key event.
typedef KeyEventCallback = bool Function(KeyEvent event);

/// Manages key events from hardware keyboards.
///
/// [HardwareKeyboard] manages all key events of the Flutter application from
/// hardware keyboards (in contrast to on-screen keyboards). It receives key
/// data from the native platform, dispatches key events to registered
/// handlers, and records the keyboard state.
///
/// To stay notified whenever keys are pressed, held, or released, add a
/// handler with [addHandler]. To only be notified when a specific part of the
/// app is focused, use a [Focus] widget's `onFocusChanged` attribute instead
/// of [addHandler]. Handlers should be removed with [removeHandler] when
/// notification is no longer necessary, or when the handler is being disposed.
///
/// To query whether a key is being held, or a lock mode is enabled, use
/// [physicalKeysPressed], [logicalKeysPressed], or [lockModesEnabled].
/// These states will have been updated with the event when used during a key
/// event handler.
///
/// The singleton [HardwareKeyboard] instance is held by the [ServicesBinding]
/// as [ServicesBinding.keyboard], and can be conveniently accessed using the
/// [HardwareKeyboard.instance] static accessor.
///
/// ## Event model
///
/// Flutter uses a universal event model ([KeyEvent]) and key options
/// ([LogicalKeyboardKey] and [PhysicalKeyboardKey]) regardless of the native
/// platform, while preserving platform-specific features as much as
/// possible.
///
/// [HardwareKeyboard] guarantees that the key model is "regularized": The key
/// event stream consists of "key tap sequences", where a key tap sequence is
/// defined as one [KeyDownEvent], zero or more [KeyRepeatEvent]s, and one
/// [KeyUpEvent] in order, all with the same physical key and logical key.
///
/// Example:
///
///  * Tap and hold key A, US layout:
///     * KeyDownEvent(physicalKey: keyA, logicalKey: keyA, character: "a")
///     * KeyRepeatEvent(physicalKey: keyA, logicalKey: keyA, character: "a")
///     * KeyUpEvent(physicalKey: keyA, logicalKey: keyA)
///  * Press ShiftLeft, tap key A, then release ShiftLeft, US layout:
///     * KeyDownEvent(physicalKey: shiftLeft, logicalKey: shiftLeft)
///     * KeyDownEvent(physicalKey: keyA, logicalKey: keyA, character: "A")
///     * KeyRepeatEvent(physicalKey: keyA, logicalKey: keyA, character: "A")
///     * KeyUpEvent(physicalKey: keyA, logicalKey: keyA)
///     * KeyUpEvent(physicalKey: shiftLeft, logicalKey: shiftLeft)
///  * Tap key Q, French layout:
///     * KeyDownEvent(physicalKey: keyA, logicalKey: keyQ, character: "q")
///     * KeyUpEvent(physicalKey: keyA, logicalKey: keyQ)
///  * Tap CapsLock:
///     * KeyDownEvent(physicalKey: capsLock, logicalKey: capsLock)
///     * KeyUpEvent(physicalKey: capsLock, logicalKey: capsLock)
///
/// When the Flutter application starts, all keys are released, and all lock
/// modes are disabled. Upon key events, [HardwareKeyboard] will update its
/// states, then dispatch callbacks: [KeyDownEvent]s and [KeyUpEvent]s set
/// or reset the pressing state, while [KeyDownEvent]s also toggle lock modes.
///
/// Flutter will try to synchronize with the ground truth of keyboard states
/// using synthesized events ([KeyEvent.synthesized]), subject to the
/// availability of the platform. The desynchronization can be caused by
/// non-empty initial state or a change in the focused window or application.
/// For example, if CapsLock is enabled when the application starts, then
/// immediately before the first key event, a synthesized [KeyDownEvent] and
/// [KeyUpEvent] of CapsLock will be dispatched.
///
/// The resulting event stream does not map one-to-one to the native key event
/// stream. Some native events might be skipped, while some events might be
/// synthesized and do not correspond to native events. Synthesized events will
/// be indicated by [KeyEvent.synthesized].
///
/// Example:
///
///  * Flutter starts with CapsLock on, the first press of keyA:
///     * KeyDownEvent(physicalKey: capsLock, logicalKey: capsLock, synthesized: true)
///     * KeyUpEvent(physicalKey: capsLock, logicalKey: capsLock, synthesized: true)
///     * KeyDownEvent(physicalKey: keyA, logicalKey: keyA, character: "a")
///  * While holding ShiftLeft, lose window focus, release shiftLeft, then focus
///    back and press keyA:
///     * KeyUpEvent(physicalKey: shiftLeft, logicalKey: shiftLeft, synthesized: true)
///     * KeyDownEvent(physicalKey: keyA, logicalKey: keyA, character: "a")
///
/// Flutter does not distinguish between multiple keyboards. Flutter will
/// process all events as if they come from a single keyboard, and try to
/// resolve any conflicts and provide a regularized key event stream, which
/// can deviate from the ground truth.
///
/// ## Compared to [RawKeyboard]
///
/// [RawKeyboard] is the legacy API, and will be deprecated and removed in the
/// future.  It is recommended to always use [HardwareKeyboard] and [KeyEvent]
/// APIs (such as [FocusNode.onKeyEvent]) to handle key events.
///
/// Behavior-wise, [RawKeyboard] provides a less unified, less regular
/// event model than [HardwareKeyboard]. For example:
///
///  * Down events might not be matched with an up event, and vice versa (the
///    set of pressed keys is silently updated).
///  * The logical key of the down event might not be the same as that of the up
///    event.
///  * Down events and repeat events are not easily distinguishable (must be
///    tracked manually).
///  * Lock modes (such as CapsLock) only have their "enabled" state recorded.
///    There's no way to acquire their pressing state.
///
/// See also:
///
///  * [KeyDownEvent], [KeyRepeatEvent], and [KeyUpEvent], the classes used to
///    describe specific key events.
///  * [instance], the singleton instance of this class.
///  * [RawKeyboard], the legacy API that dispatches key events containing raw
///    system data.
class HardwareKeyboard {
  /// Provides convenient access to the current [HardwareKeyboard] singleton from
  /// the [ServicesBinding] instance.
  static HardwareKeyboard get instance => ServicesBinding.instance!.keyboard;

  final Map<PhysicalKeyboardKey, LogicalKeyboardKey> _pressedKeys = <PhysicalKeyboardKey, LogicalKeyboardKey>{};

  /// The set of [PhysicalKeyboardKey]s that are pressed.
  ///
  /// If called from a key event handler, the result will already include the effect
  /// of the event.
  ///
  /// See also:
  ///
  ///  * [logicalKeysPressed], which tells if a logical key is being pressed.
  Set<PhysicalKeyboardKey> get physicalKeysPressed => _pressedKeys.keys.toSet();

  /// The set of [LogicalKeyboardKey]s that are pressed.
  ///
  /// If called from a key event handler, the result will already include the effect
  /// of the event.
  ///
  /// See also:
  ///
  ///  * [physicalKeysPressed], which tells if a physical key is being pressed.
  Set<LogicalKeyboardKey> get logicalKeysPressed => _pressedKeys.values.toSet();

  /// Returns the logical key that corresponds to the given pressed physical key.
  ///
  /// Returns null if the physical key is not currently pressed.
  LogicalKeyboardKey? lookUpLayout(PhysicalKeyboardKey physicalKey) => _pressedKeys[physicalKey];

  final Set<KeyboardLockMode> _lockModes = <KeyboardLockMode>{};
  /// The set of [KeyboardLockMode] that are enabled.
  ///
  /// Lock keys, such as CapsLock, are logical keys that toggle their
  /// respective boolean states on key down events. Such flags are usually used
  /// as modifier to other keys or events.
  ///
  /// If called from a key event handler, the result will already include the effect
  /// of the event.
  Set<KeyboardLockMode> get lockModesEnabled => _lockModes;

  void _assertEventIsRegular(KeyEvent event) {
    assert(() {
      const String common = 'If this occurs in real application, please report this '
        'bug to Flutter. If this occurs in unit tests, please ensure that '
        "simulated events follow Flutter's event model as documented in "
        '`HardwareKeyboard`. This was the event: ';
      if (event is KeyDownEvent) {
        assert(!_pressedKeys.containsKey(event.physicalKey),
          'A ${event.runtimeType} is dispatched, but the state shows that the physical '
          'key is already pressed. $common$event');
      } else if (event is KeyRepeatEvent || event is KeyUpEvent) {
        assert(_pressedKeys.containsKey(event.physicalKey),
          'A ${event.runtimeType} is dispatched, but the state shows that the physical '
          'key is not pressed. $common$event');
        assert(_pressedKeys[event.physicalKey] == event.logicalKey,
          'A ${event.runtimeType} is dispatched, but the state shows that the physical '
          'key is pressed on a different logical key. $common$event '
          'and the recorded logical key ${_pressedKeys[event.physicalKey]}');
      } else {
        assert(false, 'Unexpected key event class ${event.runtimeType}');
      }
      return true;
    }());
  }

  List<KeyEventCallback> _handlers = <KeyEventCallback>[];
  bool _duringDispatch = false;
  List<KeyEventCallback>? _modifiedHandlers;

  /// Register a listener that is called every time a hardware key event
  /// occurs.
  ///
  /// All registered handlers will be invoked in order regardless of
  /// their return value. The return value indicates whether Flutter
  /// "handles" the event. If any handler returns true, the event
  /// will not be propagated to other native components in the add-to-app
  /// scenario.
  ///
  /// If an object added a handler, it must remove the handler before it is
  /// disposed.
  ///
  /// If used during event dispatching, the addition will not take effect
  /// until after the dispatching.
  ///
  /// See also:
  ///
  ///  * [removeHandler], which removes the handler.
  void addHandler(KeyEventCallback handler) {
    if (_duringDispatch) {
      _modifiedHandlers ??= <KeyEventCallback>[..._handlers];
      _modifiedHandlers!.add(handler);
    } else {
      _handlers.add(handler);
    }
  }

  /// Stop calling the given listener every time a hardware key event
  /// occurs.
  ///
  /// The `handler` argument must be [identical] to the one used in
  /// [addHandler]. If multiple exist, the first one will be removed.
  /// If none is found, then this method is a no-op.
  ///
  /// If used during event dispatching, the removal will not take effect
  /// until after the event has been dispatched.
  void removeHandler(KeyEventCallback handler) {
    if (_duringDispatch) {
      _modifiedHandlers ??= <KeyEventCallback>[..._handlers];
      _modifiedHandlers!.remove(handler);
    } else {
      _handlers.remove(handler);
    }
  }

  bool _dispatchKeyEvent(KeyEvent event) {
    // This dispatching could have used the same algorithm as [ChangeNotifier],
    // but since 1) it shouldn't be necessary to support reentrantly
    // dispatching, 2) there shouldn't be many handlers (most apps should use
    // only 1, this function just uses a simpler algorithm.
    assert(!_duringDispatch, 'Nested keyboard dispatching is not supported');
    _duringDispatch = true;
    bool handled = false;
    for (final KeyEventCallback handler in _handlers) {
      try {
        final bool thisResult = handler(event);
        handled = handled || thisResult;
      } catch (exception, stack) {
        FlutterError.reportError(FlutterErrorDetails(
          exception: exception,
          stack: stack,
          library: 'services library',
          context: ErrorDescription('while dispatching notifications for $runtimeType'),
          informationCollector: () sync* {
            yield DiagnosticsProperty<HardwareKeyboard>(
              'The $runtimeType sending notification was',
              this,
              style: DiagnosticsTreeStyle.errorProperty,
            );
          },
        ));
      }
    }
    _duringDispatch = false;
    if (_modifiedHandlers != null) {
      _handlers = _modifiedHandlers!;
      _modifiedHandlers = null;
    }
    return handled;
  }

  /// Process a new [KeyEvent] by recording the state changes and dispatching
  /// to handlers.
  bool handleKeyEvent(KeyEvent event) {
    _assertEventIsRegular(event);
    final PhysicalKeyboardKey physicalKey = event.physicalKey;
    final LogicalKeyboardKey logicalKey = event.logicalKey;
    if (event is KeyDownEvent) {
      _pressedKeys[physicalKey] = logicalKey;
      final KeyboardLockMode? lockMode = KeyboardLockMode.findLockByLogicalKey(event.logicalKey);
      if (lockMode != null) {
        if (_lockModes.contains(lockMode)) {
          _lockModes.remove(lockMode);
        } else {
          _lockModes.add(lockMode);
        }
      }
    } else if (event is KeyUpEvent) {
      _pressedKeys.remove(physicalKey);
    } else if (event is KeyRepeatEvent) {
      // Empty
    }

    return _dispatchKeyEvent(event);
  }

  /// Clear all keyboard states and additional handlers.
  ///
  /// All handlers are removed except for the first one, which is added by
  /// [ServicesBinding].
  ///
  /// This is used by the testing framework to make sure that tests are hermetic.
  @visibleForTesting
  void clearState() {
    _pressedKeys.clear();
    _lockModes.clear();
    _handlers.clear();
    assert(_modifiedHandlers == null);
  }
}

/// The mode in which information of key messages is delivered.
///
/// Different platforms use different methods, classes, and models to inform the
/// framework of native key events, which is called "transit mode".
///
/// The framework must determine which transit mode the current platform
/// implements and behave accordingly (such as transforming and synthesizing
/// events if necessary). Unit tests related to keyboard might also want to
/// simulate platform of each transit mode.
///
/// The transit mode of the current platform is inferred by [KeyEventManager] at
/// the start of the application.
///
/// See also:
///
///  * [KeyEventManager], which infers the transit mode of the current platform
///    and guides how key messages are dispatched.
///  * [debugKeyEventSimulatorTransitModeOverride], overrides the transit mode
///    used to simulate key events.
///  * [KeySimulatorTransitModeVariant], an easier way to set
///    [debugKeyEventSimulatorTransitModeOverride] in widget tests.
enum KeyDataTransitMode {
  /// Key event information is delivered as raw key data.
  ///
  /// Raw key data is platform's native key event information sent in JSON
  /// through a method channel, which is then interpreted as a platform subclass
  /// of [RawKeyEventData].
  ///
  /// If the current transit mode is [rawKeyData], the raw key data is converted
  /// to both [KeyMessage.events] and [KeyMessage.rawEvent].
  rawKeyData,

  /// Key event information is delivered as converted key data, followed
  /// by raw key data.
  ///
  /// Key data ([ui.KeyData]) is a standardized event stream converted from
  /// platform's native key event information, sent through the embedder
  /// API. Its event model is described in [HardwareKeyboard].
  ///
  /// Raw key data is platform's native key event information sent in JSON
  /// through a method channel. It is interpreted by subclasses of
  /// [RawKeyEventData].
  ///
  /// If the current transit mode is [rawKeyData], the key data is converted to
  /// [KeyMessage.events], and the raw key data is converted to
  /// [KeyMessage.rawEvent].
  keyDataThenRawKeyData,
}

/// The assumbled information corresponding to a native key message.
///
/// While Flutter's [KeyEvent]s are created from key messages from the native
/// platform, every native message might result in multiple [KeyEvent]s. For
/// example, this might happen in order to synthesize missed modifier key
/// presses or releases.
/// A [KeyMessage] bundles all information related to a native key message
/// together for the convenience of propagation on the [FocusNode] tree.
///
/// When dispatched to handlers or listeners, or propagated through the
/// [FocusNode] tree, all handlers or listeners belonging to a node are
/// executed regardless of their [KeyEventResult], and all results are combined
/// into the result of the node using [combineKeyEventResults].
///
/// In very rare cases, a native key message might not result in a [KeyMessage].
/// For example, key messages for Fn key are ignored on macOS for the
/// convenience of cross-platform code.
@immutable
class KeyMessage {
  /// Create a [KeyMessage] by providing all information.
  ///
  /// The [events] might be empty.
  const KeyMessage(this.events, this.rawEvent);

  /// The list of [KeyEvent]s converted from the native key message.
  ///
  /// A native key message is converted into multiple [KeyEvent]s in a regular
  /// event model.  The [events] might contain zero or any number of
  /// [KeyEvent]s.
  ///
  /// See also:
  ///
  ///  * [HardwareKeyboard], which describes the regular event model.
  ///  * [HardwareKeyboard.addHandler], [KeyboardListener], [Focus.onKeyEvent],
  ///    where [KeyEvent]s are commonly used.
  final List<KeyEvent> events;

  /// The native key message in the form of a raw key event.
  ///
  /// A native key message is sent to the framework in JSON and represented
  /// in a platform-specific form as [RawKeyEventData] and a platform-neutral
  /// form as [RawKeyEvent]. Their stream is not as regular as [KeyEvent]'s,
  /// but keeps as much native information and structure as possible.
  ///
  /// The [rawEvent] will be deprecated in the future.
  ///
  /// See also:
  ///
  ///  * [RawKeyboard.addListener], [RawKeyboardListener], [Focus.onKey],
  ///    where [RawKeyEvent]s are commonly used.
  final RawKeyEvent rawEvent;

  @override
  String toString() {
    return 'KeyMessage($events)';
  }
}

/// The signature for [KeyEventManager.keyMessageHandler].
///
/// A [KeyMessageHandler] processes a [KeyMessage] and returns whether
/// the message is considered handled. Handled messages should not be
/// propagated to other native components.
typedef KeyMessageHandler = bool Function(KeyMessage message);

/// A singleton class that processes key messages from the platform and
/// dispatches converted messages accordingly.
///
/// [KeyEventManager] receives platform key messages by [handleKeyData]
/// and [handleRawKeyMessage], sends converted events to [HardwareKeyboard]
/// and [RawKeyboard] for recording keeping, and then dispatches the [KeyMessage]
/// to [keyMessageHandler], the global message handler.
///
/// [KeyEventManager] also resolves cross-platform compatibility of keyboard
/// implementations. Legacy platforms might have not implemented the new key
/// data API and only send raw key data on each key message. [KeyEventManager]
/// recognize platform types as [KeyDataTransitMode] and dispatches events in
/// different ways accordingly.
///
/// [KeyEventManager] is typically created, owned, and invoked by
/// [ServicesBinding].
class KeyEventManager {
  /// Create an instance.
  ///
  /// This is typically only called by [ServicesBinding].
  KeyEventManager(this._hardwareKeyboard, this._rawKeyboard);

  /// The global handler for all hardware key messages of Flutter.
  ///
  /// Key messages received from the platform are first sent to [RawKeyboard]'s
  /// listeners and [HardwareKeyboard]'s handlers, then sent to
  /// [keyMessageHandler], regardless of the results of [HardwareKeyboard]'s
  /// handlers. The result from the handlers and [keyMessageHandler] are
  /// combined and returned to the platform. The handler result is explained below.
  ///
  /// This handler is normally set by the [FocusManager] so that it can control
  /// the key event propagation to focused widgets. Applications that use the
  /// focus system (see [Focus] and [FocusManager]) to receive key events
  /// do not need to set this field.
  ///
  /// ## Handler result
  ///
  /// Key messages on the platform are given to Flutter to be handled by the
  /// engine. If they are not handled, then the platform will continue to
  /// distribute the keys (i.e. propagate them) to other (possibly non-Flutter)
  /// components in the application. The return value from this handler tells
  /// the platform to either stop propagation (by returning true: "event
  /// handled"), or pass the event on to other controls (false: "event not
  /// handled"). Some platforms might trigger special alerts if the event
  /// is not handled by other controls either (such as the "bonk" noise on
  /// macOS).
  ///
  /// If you are not using the [FocusManager] to manage focus, set this
  /// attribute to a [KeyMessageHandler] that returns true if the propagation
  /// on the platform should not be continued. Otherwise, key events will be
  /// assumed to not have been handled by Flutter, and will also be sent to
  /// other (possibly non-Flutter) controls in the application.
  ///
  /// See also:
  ///
  ///  * [Focus.onKeyEvent], a [Focus] callback attribute that will be given
  ///    key events distributed by the [FocusManager] based on the current
  ///    primary focus.
  ///  * [HardwareKeyboard.addHandler], which accepts multiple handlers to
  ///    control the handler result but only accepts [KeyEvent] instead of
  ///    [KeyMessage].
  KeyMessageHandler? keyMessageHandler;

  final HardwareKeyboard _hardwareKeyboard;
  final RawKeyboard _rawKeyboard;

  // The [KeyDataTransitMode] of the current platform.
  //
  // The `_transitMode` is guaranteed to be non-null during key event callbacks.
  //
  // The `_transitMode` is null before the first event, after which it is inferred
  // and will not change throughout the lifecycle of the application.
  //
  // The `_transitMode` can be reset to null in tests using [clearState].
  KeyDataTransitMode? _transitMode;

  // The accumulated [KeyEvent]s since the last time the message is dispatched.
  //
  // If _transitMode is [KeyDataTransitMode.keyDataThenRawKeyData], then [KeyEvent]s
  // are directly received from [handleKeyData]. If _transitMode is
  // [KeyDataTransitMode.rawKeyData], then [KeyEvent]s are converted from the raw
  // key data of [handleRawKeyMessage]. Either way, the accumulated key
  // events are only dispatched along with the next [KeyMessage] when a
  // dispatchable [RawKeyEvent] is available.
  final List<KeyEvent> _keyEventsSinceLastMessage = <KeyEvent>[];

  /// Dispatch a key data to global and leaf listeners.
  ///
  /// This method is the handler to the global `onKeyData` API.
  bool handleKeyData(ui.KeyData data) {
    _transitMode ??= KeyDataTransitMode.keyDataThenRawKeyData;
    switch (_transitMode!) {
      case KeyDataTransitMode.rawKeyData:
        assert(false, 'Should never encounter KeyData when transitMode is rawKeyData.');
        return false;
      case KeyDataTransitMode.keyDataThenRawKeyData:
        assert((data.physical == 0 && data.logical == 0) ||
               (data.physical != 0 && data.logical != 0));
        // Postpone key event dispatching until the handleRawKeyMessage.
        //
        // Having 0 as the physical or logical ID indicates an empty key data,
        // transmitted to ensure that the transit mode is correctly inferred.
        if (data.physical != 0 && data.logical != 0) {
          _keyEventsSinceLastMessage.add(_eventFromData(data));
        }
        return false;
    }
  }

  /// Handles a raw key message.
  ///
  /// This method is the handler to [SystemChannels.keyEvent], processing
  /// the JSON form of the native key message and returns the responds for the
  /// channel.
  Future<Map<String, dynamic>> handleRawKeyMessage(dynamic message) async {
    if (_transitMode == null) {
      _transitMode = KeyDataTransitMode.rawKeyData;
      // Convert raw events using a listener so that conversion only occurs if
      // the raw event should be dispatched.
      _rawKeyboard.addListener(_convertRawEventAndStore);
    }
    final RawKeyEvent rawEvent = RawKeyEvent.fromMessage(message as Map<String, dynamic>);
    // The following `handleRawKeyEvent` will call `_convertRawEventAndStore`
    // unless the event is not dispatched.
    bool handled = _rawKeyboard.handleRawKeyEvent(rawEvent);

    for (final KeyEvent event in _keyEventsSinceLastMessage) {
      handled = _hardwareKeyboard.handleKeyEvent(event) || handled;
    }
    if (_transitMode == KeyDataTransitMode.rawKeyData) {
      assert(setEquals(_rawKeyboard.physicalKeysPressed, _hardwareKeyboard.physicalKeysPressed),
        'RawKeyboard reported ${_rawKeyboard.physicalKeysPressed}, '
        'while HardwareKeyboard reported ${_hardwareKeyboard.physicalKeysPressed}');
    }

    if (keyMessageHandler != null) {
      handled = keyMessageHandler!(KeyMessage(_keyEventsSinceLastMessage, rawEvent)) || handled;
    }
    _keyEventsSinceLastMessage.clear();

    return <String, dynamic>{ 'handled': handled };
  }

  // Convert the raw event to key events, including synthesizing events for
  // modifiers, and store the key events in `_keyEventsSinceLastMessage`.
  //
  // This is only called when `_transitMode` is `rawKeyEvent` and if the raw
  // event should be dispatched.
  void _convertRawEventAndStore(RawKeyEvent rawEvent) {
    final PhysicalKeyboardKey physicalKey = rawEvent.physicalKey;
    final LogicalKeyboardKey logicalKey = rawEvent.logicalKey;
    final Set<PhysicalKeyboardKey> physicalKeysPressed = _hardwareKeyboard.physicalKeysPressed;
    final KeyEvent? mainEvent;
    final LogicalKeyboardKey? recordedLogicalMain = _hardwareKeyboard.lookUpLayout(physicalKey);
    final Duration timeStamp = ServicesBinding.instance!.currentSystemFrameTimeStamp;
    final String? character = rawEvent.character == '' ? null : rawEvent.character;
    if (rawEvent is RawKeyDownEvent) {
      if (recordedLogicalMain == null) {
        mainEvent = KeyDownEvent(
          physicalKey: physicalKey,
          logicalKey: logicalKey,
          character: character,
          timeStamp: timeStamp,
        );
        physicalKeysPressed.add(physicalKey);
      } else {
        assert(physicalKeysPressed.contains(physicalKey));
        mainEvent = KeyRepeatEvent(
          physicalKey: physicalKey,
          logicalKey: recordedLogicalMain,
          character: character,
          timeStamp: timeStamp,
        );
      }
    } else {
      assert(rawEvent is RawKeyUpEvent, 'Unexpected subclass of RawKeyEvent: ${rawEvent.runtimeType}');
      if (recordedLogicalMain == null) {
        mainEvent = null;
      } else {
        mainEvent = KeyUpEvent(
          logicalKey: recordedLogicalMain,
          physicalKey: physicalKey,
          timeStamp: timeStamp,
        );
        physicalKeysPressed.remove(physicalKey);
      }
    }
    for (final PhysicalKeyboardKey key in physicalKeysPressed.difference(_rawKeyboard.physicalKeysPressed)) {
      _keyEventsSinceLastMessage.add(KeyUpEvent(
        physicalKey: key,
        logicalKey: _hardwareKeyboard.lookUpLayout(key)!,
        timeStamp: timeStamp,
        synthesized: true,
      ));
    }
    for (final PhysicalKeyboardKey key in _rawKeyboard.physicalKeysPressed.difference(physicalKeysPressed)) {
      _keyEventsSinceLastMessage.add(KeyDownEvent(
        physicalKey: key,
        logicalKey: _rawKeyboard.lookUpLayout(key)!,
        timeStamp: timeStamp,
        synthesized: true,
      ));
    }
    if (mainEvent != null)
      _keyEventsSinceLastMessage.add(mainEvent);
  }

  /// Reset the inferred platform transit mode and related states.
  ///
  /// This method is only used in unit tests. In release mode, this is a no-op.
  @visibleForTesting
  void clearState() {
    assert(() {
      _transitMode = null;
      _rawKeyboard.removeListener(_convertRawEventAndStore);
      _keyEventsSinceLastMessage.clear();
      return true;
    }());
  }

  static KeyEvent _eventFromData(ui.KeyData keyData) {
    final PhysicalKeyboardKey physicalKey =
        PhysicalKeyboardKey.findKeyByCode(keyData.physical) ??
            PhysicalKeyboardKey(keyData.physical);
    final LogicalKeyboardKey logicalKey =
        LogicalKeyboardKey.findKeyByKeyId(keyData.logical) ??
            LogicalKeyboardKey(keyData.logical);
    final Duration timeStamp = keyData.timeStamp;
    switch (keyData.type) {
      case ui.KeyEventType.down:
        return KeyDownEvent(
          physicalKey: physicalKey,
          logicalKey: logicalKey,
          timeStamp: timeStamp,
          character: keyData.character,
          synthesized: keyData.synthesized,
        );
      case ui.KeyEventType.up:
        assert(keyData.character == null);
        return KeyUpEvent(
          physicalKey: physicalKey,
          logicalKey: logicalKey,
          timeStamp: timeStamp,
          synthesized: keyData.synthesized,
        );
      case ui.KeyEventType.repeat:
        return KeyRepeatEvent(
          physicalKey: physicalKey,
          logicalKey: logicalKey,
          timeStamp: timeStamp,
          character: keyData.character,
        );
    }
  }
}
