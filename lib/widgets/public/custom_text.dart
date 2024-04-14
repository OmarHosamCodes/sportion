import 'package:sportion/library.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    super.key,
    this.isSeccoundary = false,
    this.isHeadline = false,
    this.size,
  });

  final String text;

  final bool isSeccoundary;

  final bool isHeadline;

  final double? size;

  TextOverflow get overFlow => TextOverflow.ellipsis;

  double get fontSize {
    if (size != null) {
      return size!;
    } else if (isSeccoundary) {
      return 16;
    } else if (isHeadline) {
      return 20;
    } else {
      return style.fontSize!;
    }
  }

  TextStyle get style {
    if (isSeccoundary) {
      return Theme.of(RoutingRepository.context).textTheme.titleMedium!;
    } else if (isHeadline) {
      return Theme.of(RoutingRepository.context).textTheme.displayMedium!;
    } else {
      return Theme.of(RoutingRepository.context).textTheme.titleMedium!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        overflow: overFlow,
        fontSize: fontSize,
      ),
    );
  }
}
