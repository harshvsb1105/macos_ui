import 'package:flutter/foundation.dart';

import '../../macos_ui.dart';

/// Styling specifications for a [MacosTheme].
///
/// All constructor parameters can be null, in which case a
/// [CupertinoColors.activeBlue] based default macOS theme styling is used.
///
/// See also:
///
///  * [MacosTheme], in which this [MacosThemeData] is inserted.
class MacosThemeData with Diagnosticable {
  /// Creates a [MacosTheme] styling specification.
  ///
  /// Unspecified parameters default to a reasonable macOS default style.
  factory MacosThemeData({
    Brightness? brightness,
    Color? primaryColor,
    Color? accentColor,
    Curve? animationCurve,
    Duration? mediumAnimationDuration,
    Typography? typography,
  }) {
    final Brightness _brightness = brightness ?? Brightness.light;
    final bool isDark = _brightness == Brightness.dark;
    primaryColor ??= isDark
        ? CupertinoColors.activeBlue.darkColor
        : CupertinoColors.activeBlue.color;
    accentColor ??= isDark
        ? CupertinoColors.activeBlue.darkColor
        : CupertinoColors.activeBlue.color;
    animationCurve = Curves.easeInOut;
    mediumAnimationDuration = Duration(milliseconds: 300);
    typography = Typography.defaultTypography(brightness: _brightness)
        .copyWith(typography);

    return MacosThemeData._raw(
      brightness: _brightness,
      primaryColor: primaryColor,
      accentColor: accentColor,
      animationCurve: animationCurve,
      mediumAnimationDuration: mediumAnimationDuration,
      typography: typography,
    );
  }

  const MacosThemeData._raw({
    required this.brightness,
    required this.primaryColor,
    required this.accentColor,
    required this.animationCurve,
    required this.mediumAnimationDuration,
    required this.typography,
  });

  // todo: documentation
  factory MacosThemeData.light() =>
      MacosThemeData(brightness: Brightness.light);

  // todo: documentation
  factory MacosThemeData.dark() => MacosThemeData(brightness: Brightness.dark);

  // todo: documentation
  factory MacosThemeData.fallback() => MacosThemeData.light();

  /// The brightness override for macOS descendants.
  final Brightness? brightness;

  /// A color used on interactive elements of the theme.
  ///
  /// Defaults to [CupertinoColors.activeBlue].
  final Color? primaryColor;

  // todo: documentation
  final Color? accentColor;

  // todo: documentation
  final Curve? animationCurve;

  // todo: documentation
  final Duration? mediumAnimationDuration;

  // todo: documentation
  final Typography? typography;

  MacosThemeData resolveFrom(BuildContext context) {
    /*Color? convertColor(Color? color) =>
        CupertinoDynamicColor.maybeResolve(color, context);*/

    return MacosThemeData._raw(
      brightness: brightness,
      primaryColor: primaryColor,
      accentColor: accentColor,
      animationCurve: animationCurve,
      mediumAnimationDuration: mediumAnimationDuration,
      typography: typography,
    );
  }
}