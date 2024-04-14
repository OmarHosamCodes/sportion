/// A class that contains simple constants used in the application.
class SimpleConstants {
  //The radius of circual border
  static const double radius = 10;

  static const double vertiacalSpace = 15;
  static const double horizontalSpace = 20;

  /// The duration for fast animations, in milliseconds.
  static const Duration fastAnimationDuration = Duration(milliseconds: 250);

  /// The duration for slow animations, in milliseconds.
  static const Duration slowAnimationDuration = Duration(milliseconds: 350);

  /// The duration for very slow animations, in milliseconds.
  static const Duration verySlowAnimationDuration = Duration(milliseconds: 500);

  /// The duration for disabled animations, which is zero.
  static const Duration disabledDuration = Duration.zero;
}
