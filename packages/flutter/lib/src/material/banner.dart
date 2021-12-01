// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'banner_theme.dart';
import 'divider.dart';
import 'scaffold.dart';
import 'theme.dart';

const Duration _materialBannerTransitionDuration = Duration(milliseconds: 250);
const Curve _materialBannerHeightCurve = Curves.fastOutSlowIn;
const Curve _materialBannerFadeOutCurve = Interval(0.72, 1.0, curve: Curves.fastOutSlowIn);

/// Specify how a [MaterialBanner] was closed.
///
/// The [ScaffoldMessengerState.showMaterialBanner] function returns a
/// [ScaffoldFeatureController]. The value of the controller's closed property
/// is a Future that resolves to a MaterialBannerClosedReason. Applications that need
/// to know how a material banner was closed can use this value.
///
/// Example:
///
/// ```dart
/// ScaffoldMessenger.of(context).showMaterialBanner(
///   MaterialBanner( ... )
/// ).closed.then((MaterialBannerClosedReason reason) {
///    ...
/// });
/// ```
enum MaterialBannerClosedReason {
  /// The material banner was closed through a [SemanticsAction.dismiss].
  dismiss,

  /// The material banner was closed by a user's swipe.
  swipe,

  /// The material banner was closed by the [ScaffoldFeatureController] close callback
  /// or by calling [ScaffoldMessengerState.hideCurrentMaterialBanner] directly.
  hide,

  /// The material banner was closed by a call to [ScaffoldMessengerState.removeCurrentMaterialBanner].
  remove,
}

/// A Material Design banner.
///
/// A banner displays an important, succinct message, and provides actions for
/// users to address (or dismiss the banner). A user action is required for it
/// to be dismissed.
///
/// Banners should be displayed at the top of the screen, below a top app bar.
/// They are persistent and non-modal, allowing the user to either ignore them or
/// interact with them at any time.
///
/// {@tool dartpad --template=stateless_widget_material}
///
/// Banners placed directly into the widget tree are static.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Scaffold(
///     appBar: AppBar(
///       title: const Text('The MaterialBanner is below'),
///     ),
///     body: const MaterialBanner(
///       padding: EdgeInsets.all(20),
///       content: Text('Hello, I am a Material Banner'),
///       leading: Icon(Icons.agriculture_outlined),
///       backgroundColor: Color(0xFFE0E0E0),
///       actions: <Widget>[
///         TextButton(
///           child: Text('OPEN'),
///           onPressed: null,
///         ),
///         TextButton(
///           child: Text('DISMISS'),
///           onPressed: null,
///         ),
///       ],
///     ),
///   );
/// }
/// ```
/// {@end-tool}
///
/// {@tool dartpad --template=stateless_widget_material}
///
/// MaterialBanner's can also be presented through a [ScaffoldMessenger].
/// Here is an example where ScaffoldMessengerState.showMaterialBanner() is used to show the MaterialBanner.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Scaffold(
///     appBar: AppBar(
///       title: const Text('The MaterialBanner is below'),
///     ),
///     body: Center(
///       child: ElevatedButton(
///         child: const Text('Show MaterialBanner'),
///         onPressed: () => ScaffoldMessenger.of(context).showMaterialBanner(
///           const MaterialBanner(
///             padding: EdgeInsets.all(20),
///             content: Text('Hello, I am a Material Banner'),
///             leading: Icon(Icons.agriculture_outlined),
///             backgroundColor: Colors.green,
///             actions: <Widget>[
///               TextButton(
///                 child: Text('DISMISS'),
///                 onPressed: null,
///               ),
///             ],
///           ),
///         ),
///       ),
///     ),
///   );
/// }
/// ```
/// {@end-tool}
///
/// The [actions] will be placed beside the [content] if there is only one.
/// Otherwise, the [actions] will be placed below the [content]. Use
/// [forceActionsBelow] to override this behavior.
///
/// If the [actions] placed below the [content], they will be laid out in a row.
/// If there isn't sufficient room to display everything, they are laid out
/// in a column instead.
///
/// The [actions] and [content] must be provided. An optional leading widget
/// (typically an [Image]) can also be provided. The [contentTextStyle] and
/// [backgroundColor] can be provided to customize the banner.
///
/// This widget is unrelated to the widgets library [Banner] widget.
class MaterialBanner extends StatefulWidget {
  /// Creates a [MaterialBanner].
  ///
  /// The [actions], [content], and [forceActionsBelow] must be non-null.
  /// The [actions].length must be greater than 0.
  const MaterialBanner({
    Key? key,
    required this.content,
    this.contentTextStyle,
    required this.actions,
    this.leading,
    this.backgroundColor,
    this.padding,
    this.leadingPadding,
    this.forceActionsBelow = false,
    this.overflowAlignment = OverflowBarAlignment.end,
    this.animation,
    this.onVisible
  }) : assert(content != null),
       assert(actions != null),
       assert(forceActionsBelow != null),
       super(key: key);

  /// The content of the [MaterialBanner].
  ///
  /// Typically a [Text] widget.
  final Widget content;

  /// Style for the text in the [content] of the [MaterialBanner].
  ///
  /// If `null`, [MaterialBannerThemeData.contentTextStyle] is used. If that is
  /// also `null`, [TextTheme.bodyText2] of [ThemeData.textTheme] is used.
  final TextStyle? contentTextStyle;

  /// The set of actions that are displayed at the bottom or trailing side of
  /// the [MaterialBanner].
  ///
  /// Typically this is a list of [TextButton] widgets.
  final List<Widget> actions;

  /// The (optional) leading widget of the [MaterialBanner].
  ///
  /// Typically an [Icon] widget.
  final Widget? leading;

  /// The color of the surface of this [MaterialBanner].
  ///
  /// If `null`, [MaterialBannerThemeData.backgroundColor] is used. If that is
  /// also `null`, [ColorScheme.surface] of [ThemeData.colorScheme] is used.
  final Color? backgroundColor;

  /// The amount of space by which to inset the [content].
  ///
  /// If the [actions] are below the [content], this defaults to
  /// `EdgeInsetsDirectional.only(start: 16.0, top: 24.0, end: 16.0, bottom: 4.0)`.
  ///
  /// If the [actions] are trailing the [content], this defaults to
  /// `EdgeInsetsDirectional.only(start: 16.0, top: 2.0)`.
  final EdgeInsetsGeometry? padding;

  /// The amount of space by which to inset the [leading] widget.
  ///
  /// This defaults to `EdgeInsetsDirectional.only(end: 16.0)`.
  final EdgeInsetsGeometry? leadingPadding;

  /// An override to force the [actions] to be below the [content] regardless of
  /// how many there are.
  ///
  /// If this is true, the [actions] will be placed below the [content]. If
  /// this is false, the [actions] will be placed on the trailing side of the
  /// [content] if [actions]'s length is 1 and below the [content] if greater
  /// than 1.
  ///
  /// Defaults to false.
  final bool forceActionsBelow;

  /// The horizontal alignment of the [actions] when the [actions] laid out in a column.
  ///
  /// Defaults to [OverflowBarAlignment.end].
  final OverflowBarAlignment overflowAlignment;

  /// The animation driving the entrance and exit of the material banner when presented by the [ScaffoldMessenger].
  final Animation<double>? animation;

  /// Called the first time that the material banner is visible within a [Scaffold] when presented by the [ScaffoldMessenger].
  final VoidCallback? onVisible;

  // API for ScaffoldMessengerState.showMaterialBanner():

  /// Creates an animation controller useful for driving a material banner's entrance and exit animation.
  static AnimationController createAnimationController({ required TickerProvider vsync }) {
    return AnimationController(
      duration: _materialBannerTransitionDuration,
      debugLabel: 'MaterialBanner',
      vsync: vsync,
    );
  }

  /// Creates a copy of this material banner but with the animation replaced with the given animation.
  ///
  /// If the original material banner lacks a key, the newly created material banner will
  /// use the given fallback key.
  MaterialBanner withAnimation(Animation<double> newAnimation, { Key? fallbackKey }) {
    return MaterialBanner(
      key: key ?? fallbackKey,
      content: content,
      contentTextStyle: contentTextStyle,
      actions: actions,
      leading: leading,
      backgroundColor: backgroundColor,
      padding: padding,
      leadingPadding: leadingPadding,
      forceActionsBelow: forceActionsBelow,
      overflowAlignment: overflowAlignment,
      animation: newAnimation,
      onVisible: onVisible,
    );
  }

  @override
  State<MaterialBanner> createState() => _MaterialBannerState();
}

class _MaterialBannerState extends State<MaterialBanner> {
  bool _wasVisible = false;

  @override
  void initState() {
    super.initState();
    widget.animation?.addStatusListener(_onAnimationStatusChanged);
  }

  @override
  void didUpdateWidget(MaterialBanner oldWidget) {
    if (widget.animation != oldWidget.animation) {
      oldWidget.animation?.removeStatusListener(_onAnimationStatusChanged);
      widget.animation?.addStatusListener(_onAnimationStatusChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.animation?.removeStatusListener(_onAnimationStatusChanged);
    super.dispose();
  }

  void _onAnimationStatusChanged(AnimationStatus animationStatus) {
    switch (animationStatus) {
      case AnimationStatus.dismissed:
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        break;
      case AnimationStatus.completed:
        if (widget.onVisible != null && !_wasVisible) {
          widget.onVisible!();
        }
        _wasVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    assert(widget.actions.isNotEmpty);

    final ThemeData theme = Theme.of(context);
    final MaterialBannerThemeData bannerTheme = MaterialBannerTheme.of(context);

    final bool isSingleRow = widget.actions.length == 1 && !widget.forceActionsBelow;
    final EdgeInsetsGeometry padding = widget.padding ?? bannerTheme.padding ?? (isSingleRow
        ? const EdgeInsetsDirectional.only(start: 16.0, top: 2.0)
        : const EdgeInsetsDirectional.only(start: 16.0, top: 24.0, end: 16.0, bottom: 4.0));
    final EdgeInsetsGeometry leadingPadding = widget.leadingPadding
        ?? bannerTheme.leadingPadding
        ?? const EdgeInsetsDirectional.only(end: 16.0);

    final Widget buttonBar = Container(
      alignment: AlignmentDirectional.centerEnd,
      constraints: const BoxConstraints(minHeight: 52.0),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OverflowBar(
        overflowAlignment: widget.overflowAlignment,
        spacing: 8,
        children: widget.actions,
      ),
    );

    final Color backgroundColor = widget.backgroundColor
        ?? bannerTheme.backgroundColor
        ?? theme.colorScheme.surface;
    final TextStyle? textStyle = widget.contentTextStyle
        ?? bannerTheme.contentTextStyle
        ?? theme.textTheme.bodyText2;

    Widget materialBanner = Container(
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: padding,
            child: Row(
              children: <Widget>[
                if (widget.leading != null)
                  Padding(
                    padding: leadingPadding,
                    child: widget.leading,
                  ),
                Expanded(
                  child: DefaultTextStyle(
                    style: textStyle!,
                    child: widget.content,
                  ),
                ),
                if (isSingleRow)
                  buttonBar,
              ],
            ),
          ),
          if (!isSingleRow)
            buttonBar,
          const Divider(height: 0),
        ],
      ),
    );

    // This provides a static banner for backwards compatibility.
    if (widget.animation == null)
      return materialBanner;

    final CurvedAnimation heightAnimation = CurvedAnimation(parent: widget.animation!, curve: _materialBannerHeightCurve);
    final CurvedAnimation fadeOutAnimation = CurvedAnimation(
      parent: widget.animation!,
      curve: _materialBannerFadeOutCurve,
      reverseCurve: const Threshold(0.0),
    );

    materialBanner = Semantics(
      container: true,
      liveRegion: true,
      onDismiss: () {
        ScaffoldMessenger.of(context).removeCurrentMaterialBanner(reason: MaterialBannerClosedReason.dismiss);
      },
      child: mediaQueryData.accessibleNavigation
          ? materialBanner
          : FadeTransition(
        opacity: fadeOutAnimation,
        child: materialBanner,
      ),
    );

    final Widget materialBannerTransition;
    if (mediaQueryData.accessibleNavigation) {
      materialBannerTransition = materialBanner;
    } else {
      materialBannerTransition = AnimatedBuilder(
        animation: heightAnimation,
        builder: (BuildContext context, Widget? child) {
          return Align(
            alignment: AlignmentDirectional.bottomStart,
            heightFactor: heightAnimation.value,
            child: child,
          );
        },
        child: materialBanner,
      );
    }

    return Hero(
      child: ClipRect(child: materialBannerTransition),
      tag: '<MaterialBanner Hero tag - ${widget.content}>',
    );
  }
}
