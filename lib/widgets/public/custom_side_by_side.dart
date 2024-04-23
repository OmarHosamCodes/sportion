import 'package:sportion/library.dart';

class CustomSideBySide extends ConsumerWidget {
  const CustomSideBySide(
      {super.key, required this.input, this.ratio = const (1, 3)});
  final (String, String) input;
  final (int, int) ratio;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        Expanded(
          flex: ratio.$1,
          child: CustomGlassMorphismContainer(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: CustomText(
              text: input.$1,
            ),
          ),
        ),
        Expanded(
          flex: ratio.$2,
          child: CustomGlassMorphismContainer(
            blur: 10.0,
            color: RoutingRepository.context.theme.colorScheme.secondary,
            opacity: 1,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: CustomText(
              text: input.$2,
            ),
          ),
        ),
      ],
    );
  }
}
