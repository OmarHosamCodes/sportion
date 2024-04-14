import 'package:sportion/library.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<(String, String)> _grids = [
    ('Sports', 'assets/sports_bg.png'),
    ('Nutrition', 'assets/nutrition_bg.png'),
    ('Community', 'assets/community_bg.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Welcome To Sportion!'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () =>
                        RoutingRepository.push(Routes.excerisesCategories),
                    child: Card.filled(
                      color: Colors.deepPurple,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomImage(
                              source: _grids[0].$2,
                              width: context.width,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: context.width,
                            height: 200.0,
                            color: context.theme.scaffoldBackgroundColor
                                .withOpacity(.7),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: CustomText(
                              text: _grids[0].$1,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const CustomGap(
                  width: 10,
                ),
                Flexible(
                  child: InkWell(
                    onTap: () => RoutingRepository.push(Routes.nutrition),
                    child: Card.filled(
                      color: Colors.deepPurple,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomImage(
                              source: _grids[1].$2,
                              width: context.width,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: context.width,
                            height: 200.0,
                            color: context.theme.scaffoldBackgroundColor
                                .withOpacity(.7),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: CustomText(
                              text: _grids[1].$1,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const CustomGap(),
            SizedBox(
              height: 200.0,
              width: context.width,
              child: InkWell(
                onTap: () => RoutingRepository.push(Routes.community),
                child: Card.filled(
                  color: Colors.deepPurple,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CustomImage(
                          source: _grids[2].$2,
                          width: context.width,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: context.width,
                        height: 200.0,
                        color: context.theme.scaffoldBackgroundColor
                            .withOpacity(.7),
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: CustomText(
                          text: _grids[2].$1,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
