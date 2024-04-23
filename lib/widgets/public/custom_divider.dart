import 'package:sportion/library.dart';

class CustomDivider extends ConsumerWidget {
  final int length;
  final DividerType type;

  const CustomDivider.horizontal({super.key, this.length = 0})
      : type = DividerType.horizontal;
  const CustomDivider.vertical({super.key, this.length = 0})
      : type = DividerType.vertical;

  @override
  Widget build(BuildContext context, ref) {
    return switch (type) {
      DividerType.horizontal => SizedBox(
          width: length.toDouble(),
          child: Divider(
            color: context.theme.primaryColor.withOpacity(.5),
          ),
        ),
      DividerType.vertical => SizedBox(
          height: length.toDouble(),
          child: VerticalDivider(
            color: context.theme.primaryColor.withOpacity(.5),
          ),
        ),
    };
  }
}

enum DividerType { horizontal, vertical }
