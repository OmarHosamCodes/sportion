import 'package:sportion/library.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.extra});
  final dynamic extra;
  @override
  Widget build(BuildContext context) {
    final category = extra as String;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: '${category.capitalize()} Exercises'),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: FutureBuilder<List<Exercise>>(
        future: SportsRepository.instance.fetchExercises(category),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                final exercises = snapshot.data!;
                return ListView.separated(
                  separatorBuilder: (context, index) => const CustomGap(),
                  padding: const EdgeInsets.all(20),
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return Card.filled(
                      color: const Color(0xFF1C1B1F),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: CustomImage(
                              source: exercise.gifUrl,
                              height: 400,
                              width: context.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSideBySide(
                                  input: ('Name', exercise.name),
                                  ratio: (1, 4),
                                ),
                                const CustomGap(),
                                CustomSideBySide(
                                    input: ("Target", exercise.target)),
                                const CustomGap(),
                                CustomSideBySide(
                                  input: ("Equipment", exercise.equipment),
                                  ratio: (2, 3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CustomText(text: 'No data'));
              }
            default:
              return const Center(child: CustomText(text: 'No data'));
          }
        },
      ),
    );
  }
}
