import 'package:sportion/library.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Sports'),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(20),
        itemCount: SportModel.sports.length,
        itemBuilder: (context, index) {
          final sport = SportModel.sports[index];

          return InkWell(
            onTap: () => RoutingRepository.pushNamed(
              sport.title.toLowerCase(),
            ),
            child: Card.filled(
              color: context.theme.primaryColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: context.width,
                    height: context.height,
                    color:
                        context.theme.scaffoldBackgroundColor.withOpacity(.5),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: CustomText(
                      text: sport.title,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ).animate().fade(
                  delay: Duration(milliseconds: 100 * index),
                  duration: const Duration(milliseconds: 500),
                ),
          );
        },
      ),
    );
  }
}
