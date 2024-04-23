import 'package:sportion/library.dart';

class NutritionScreen extends ConsumerStatefulWidget {
  const NutritionScreen({super.key});

  @override
  ConsumerState<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends ConsumerState<NutritionScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Nutrition'),
        centerTitle: true,
        toolbarHeight: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                Future.delayed(SimpleConstants.verySlowAnimationDuration)
                    .then((value) => setState(() => query = _controller.text));
              },
              decoration: InputDecoration(
                hintText: 'Search for food ex: 1kg chicken , fish, etc.',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    setState(() {
                      query = '';
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List>(
        future: NutritionRepository.getNutritionList(query),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                final nutritionList = snapshot.data!;
                return ListView.separated(
                  padding: const EdgeInsets.all(20),
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.deepPurpleAccent,
                  ),
                  itemCount: nutritionList.length,
                  itemBuilder: (context, index) {
                    String toKg(double value) {
                      if (value == 100) {
                        return '100g';
                      } else if (value == 1000) {
                        return '1 kg';
                      }
                      return '${(value / 1000).toStringAsFixed(2)} kg';
                    }

                    final nutrition = nutritionList[index];
                    final name = nutrition['name'];
                    final calories = nutrition['calories'];
                    final serving = nutrition['serving_size_g'];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: context.theme.cardColor,
                      style: ListTileStyle.drawer,
                      leading: CustomText(
                        text: name.toString(),
                        size: 20,
                      ),
                      title: CustomText(
                        text: '$calories cal per ${toKg(serving)}',
                        isSeccoundary: true,
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
