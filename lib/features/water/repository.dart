import 'package:sportion/library.dart';

class WaterRepository {
  static final WaterRepository instance = WaterRepository();
  FirebaseAuth get authInstants => FirebaseAuth.instance;

  FirebaseFirestore get firestoreInstants => FirebaseFirestore.instance;

  User? get currentUser => authInstants.currentUser;
  Future<double> calculateWaterIntake({
    required int age,
    required double weight,
    // required String gender,
  }) async {
    // Calculate water intake
    double waterIntake = 0;

    if (age <= 60) {
      waterIntake += weight * 30;
    } else {
      waterIntake += weight * 25;
    }

    waterIntake = double.parse((waterIntake / 1000).toStringAsFixed(2));

    try {
      firestoreInstants.collection("users").doc(currentUser!.uid).update({
        "waterIntake": waterIntake,
      });
    } catch (e) {
      CustomPopups.show(
        CustomPopups.dialog(
          content: e.toString(),
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );
    }

    return waterIntake;
  }
}
