import 'package:sportion/library.dart';

/// A widget that displays an image from a network or memory source.
class CustomImage extends ConsumerWidget {
  /// Constructs a [CustomImage] widget with smart image loading.
  const CustomImage({
    required this.source,
    super.key,
    this.width,
    this.height,
    this.fallbackIcon,
    this.fit,
  });

  /// The source of the image.
  final String source;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// The fallback icon to display if the image fails to load.
  final IconData? fallbackIcon;

  /// The fit of the image within its container.
  final BoxFit? fit;

  @override
  Widget build(BuildContext context, ref) {
    return buildSmartImage();
  }

  /// Builds a network image widget.
  Widget buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: source,
      progressIndicatorBuilder: (context, url, progress) {
        return const Center(child: CustomPopups.loadingIndicator());
      },
      errorWidget: (context, url, error) => buildErrorImage(),
      fadeInDuration: SimpleConstants.slowAnimationDuration,
      fadeOutDuration: SimpleConstants.slowAnimationDuration,
      filterQuality: FilterQuality.medium,
      width: width,
      height: height,
      fit: fit,
    );
  }

  /// Builds a memory image widget.
  Widget buildMemoryImage() {
    return Image(
      image: MemoryImage(base64Decode(source)),
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) => buildErrorImage(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CustomPopups.loadingDialog());
      },
      filterQuality: FilterQuality.medium,
      fit: fit,
    );
  }

  Widget buildAssetImage() {
    return Image.asset(
      source,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) => buildErrorImage(),
      filterQuality: FilterQuality.medium,
      fit: fit,
    );
  }

  Widget buildErrorImage() {
    return Icon(
      fallbackIcon,
      color: RoutingRepository.context.theme.colorScheme.error,
      size: 50,
    );
  }

  /// Builds a smart image widget based on the source.
  Widget buildSmartImage() {
    if (source.startsWith('http')) {
      return buildNetworkImage();
    } else if (source.startsWith('null')) {
      return buildErrorImage();
    } else if (source.startsWith('assets')) {
      return buildAssetImage();
    } else {
      return buildMemoryImage();
    }
  }
}
