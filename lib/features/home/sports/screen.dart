import 'package:sportion/library.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomImage(
          source: 'https://i.gifer.com/P4id.gif',
          width: 300,
          height: 300,
          fallbackIcon: Icons.error,
        ),
      ),
    );
  }
}
