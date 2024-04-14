import 'package:sportion/features/bmr/repository.dart';
import 'package:sportion/library.dart';

class BMRScreen extends StatefulWidget {
  const BMRScreen({super.key});

  @override
  State<BMRScreen> createState() => _BMRScreenState();
}

class _BMRScreenState extends State<BMRScreen> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    heightController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  double weight = 0.0;
  double height = 0.0;
  int age = 0;
  String selectedGender = "";
  double activityMultiplier = 1.2; // Sedentary by default

  // List of activity levels with corresponding multipliers
  final List<DropdownMenuItem<double>> activityLevels = [
    const DropdownMenuItem(
        value: 1.2, child: Text('Sedentary (Little or no exercise)')),
    const DropdownMenuItem(
        value: 1.375,
        child: Text('Lightly Active (Light exercise/sports 1-3 days/week)')),
    const DropdownMenuItem(
        value: 1.55,
        child:
            Text('Moderately Active (Moderate exercise/sports 3-5 days/week)')),
    const DropdownMenuItem(
        value: 1.725,
        child: Text('Very Active (Hard exercise/sports 6-7 days/week)')),
    const DropdownMenuItem(
        value: 1.9,
        child: Text(
            'Extremely Active (Very hard exercise/sports & physical job)')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'BMR Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // Text field for weight
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  // Text field for height
                  CustomTextField(
                    textInputAction: TextInputAction.next,
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    hintText: 'Height (cm)',
                    onChanged: (value) =>
                        setState(() => height = double.parse(value)),
                  ),
                  const CustomGap(),
                  // Text field for age
                  CustomTextField(
                    textInputAction: TextInputAction.go,
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    hintText: 'Age (years)',
                    onChanged: (value) =>
                        setState(() => age = int.parse(value)),
                  ),
                ],
              ),
            ),

            const CustomGap(),
            // Radio buttons for gender
            CustomGlassMorphismContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const CustomText(text: 'Gender:'),
                  Row(
                    children: [
                      const CustomText(
                        text: "Male",
                        isSeccoundary: true,
                      ),
                      Radio(
                        value: "Male",
                        groupValue: selectedGender,
                        onChanged: (value) =>
                            setState(() => selectedGender = value!),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: "Female",
                        isSeccoundary: true,
                      ),
                      Radio(
                        value: "Female",
                        groupValue: selectedGender,
                        onChanged: (value) =>
                            setState(() => selectedGender = value!),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CustomGap(),
            // Dropdown for activity level
            FittedBox(
              child: DropdownButton<double>(
                value: activityMultiplier,
                items: activityLevels,
                onChanged: (value) =>
                    setState(() => activityMultiplier = value!),
                hint: const Text('Select Activity Level'),
              ),
            ),
            const CustomGap(),
            // Calculate button
            Consumer(
              builder: (_, WidgetRef ref, __) {
                return CustomButton.raised(
                  width: double.infinity,
                  height: 50,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      //  Calculate BMR here
                      double bmr = await BMRRepository.instance.calculateBMR(
                        weight: weight,
                        height: height,
                        age: age,
                        gender: selectedGender,
                        activityMultiplier: activityMultiplier,
                      );
                      // Show BMR result in a dialog or display below the button
                      CustomPopups.show(CustomPopups.dialog(
                        title: 'BMR Result',
                        content: 'Your BMR is $bmr calories/day.',
                      ));
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
                  child: const Text('Calculate BMR'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
