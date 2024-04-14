import 'package:sportion/features/water/repository.dart';
import 'package:sportion/library.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController weightController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  double weight = 0.0;
  int age = 0;
  String selectedGender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Water Intake Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputAction: TextInputAction.next,
                controller: weightController,
                keyboardType: TextInputType.number,
                hintText: 'Weight (kg)',
                onChanged: (value) =>
                    setState(() => weight = double.parse(value)),
              ),
              const CustomGap(),
              CustomTextField(
                textInputAction: TextInputAction.go,
                controller: ageController,
                keyboardType: TextInputType.number,
                hintText: 'Age (years)',
                onChanged: (value) => setState(() => age = int.parse(value)),
              ),
              const CustomGap(),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  return CustomButton.raised(
                    width: double.infinity,
                    height: 50,
                    child: const CustomText(text: 'Calculate'),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        double waterIntake =
                            await WaterRepository.instance.calculateWaterIntake(
                          age: age,
                          weight: weight,
                        );

                        CustomPopups.show(
                          CustomPopups.dialog(
                            title: "Water Intake",
                            content:
                                "Your daily water intake is $waterIntake L",
                          ),
                        );
                        ref
                          ..invalidate(userProvider)
                          ..read(userProvider);
                      } else {
                        CustomPopups.show(const CustomPopups.dialog(
                          title: 'Error',
                          content: 'Please fill in all fields.',
                          dialogType: DialogType.error,
                        ));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
