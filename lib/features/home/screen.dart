import 'package:sportion/library.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const List<(String, String)> _grids = [
    ('assets/sports_bg.png', Routes.sports),
    ('assets/nutrition_bg.png', Routes.nutrition),
    ('assets/community_bg.png', Routes.community),
    ('assets/water_bg.png', Routes.water),
  ];

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Welcome To Sportion!'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _grids.length,
        itemBuilder: (context, index) {
          final grid = _grids[index];
          return GestureDetector(
            onTap: () {
              RoutingRepository.push(grid.$2);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomImage(
                      source: grid.$1,
                      height: context.height,
                      width: context.width,
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
