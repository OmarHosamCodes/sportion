import 'package:sportion/library.dart';

class BMRRepository {
  static final BMRRepository instance = BMRRepository();

  FirebaseAuth get authInstants => FirebaseAuth.instance;

  FirebaseFirestore get firestoreInstants => FirebaseFirestore.instance;

  User? get currentUser => authInstants.currentUser;

  Future<double> calculateBMR({
    required double weight,
    required double height,
    required int age,
    required String gender,
    required double activityMultiplier,
  }) async {
    var bmr = 0.0;

    bmr += weight * 10;

    bmr += height * 6.25;

    bmr -= age * 5;

    if (gender == "Male") {
      bmr += 5;
    } else {
      bmr -= 161;
    }
    bmr * activityMultiplier;
    try {
      firestoreInstants.collection("users").doc(currentUser!.uid).update({
        "bmr": bmr,
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

    return bmr;
  }
}
