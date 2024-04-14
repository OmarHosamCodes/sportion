import 'package:sportion/library.dart';

class ExcerisesScreen extends StatelessWidget {
  const ExcerisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Nutrition'),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: FutureBuilder<List<String>>(
        future: SportsRepository.instance.fetchCategories(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                final categories = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.all(20),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index].capitalize();

                    return InkWell(
                      onTap: () => RoutingRepository.pushNamed(
                        Routes.excerisesDetailsRoot,
                        extra: categories[index],
                      ),
                      child: Card.filled(
                        color: context.theme.primaryColor.withOpacity(.5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: context.width,
                              height: context.height,
                              color: context.theme.scaffoldBackgroundColor
                                  .withOpacity(.7),
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: CustomText(
                                text: category,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CustomText(text: 'No data'));
              }
            default:
              return Center(child: CustomText(text: snapshot.error.toString()));
          }
        },
      ),
    );
  }
}
