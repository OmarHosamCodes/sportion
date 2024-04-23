import 'dart:ui';

import 'package:sportion/library.dart';

class CustomGlassMorphismContainer extends ConsumerWidget {
  final Widget child;
  final double blur;
  final BorderRadius? borderRadius;
  final Color color;
  final double opacity;
  final EdgeInsets padding;

  const CustomGlassMorphismContainer({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.borderRadius,
    this.color = Colors.deepPurple,
    this.opacity = 0.3,
    this.padding = const EdgeInsets.all(16.0),
  });

  BorderRadius get _borderRadius =>
      borderRadius ?? BorderRadius.circular(SimpleConstants.radius);

  @override
  Widget build(BuildContext context, ref) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: color.withOpacity(opacity),
          ),
          child: child,
        ),
      ),
    );
  }
}
