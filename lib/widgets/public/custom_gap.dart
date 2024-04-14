import 'package:sportion/library.dart';

class CustomGap extends StatelessWidget {
  const CustomGap({super.key, this.height = 15, this.width = 25});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(width, height),
    );
  }
}
