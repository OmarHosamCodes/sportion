// ignore_for_file: use_build_context_synchronously

import 'package:sportion/library.dart';

class AuthRepository extends ChangeNotifier {
  static AuthRepository get instants => AuthRepository();

  FirebaseAuth get authInstants => FirebaseAuth.instance;

  FirebaseFirestore get firestoreInstants => FirebaseFirestore.instance;

  User? get currentUser => authInstants.currentUser;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    CustomPopups.show(const CustomPopups.loadingDialog());
    try {
      await authInstants.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      RoutingRepository.context.pop();
    } on FirebaseAuthException catch (error) {
      RoutingRepository.context.pop();

      CustomPopups.show(
        CustomPopups.dialog(
          content: error.message,
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );

      error.message!.log();
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required UserModel user,
    required String password,
  }) async {
    CustomPopups.show(const CustomPopups.loadingDialog());
    try {
      await authInstants.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      if (currentUser != null) {
        await afterSignUp(user);
      }
      RoutingRepository.context.pop();
    } catch (error) {
      RoutingRepository.context.pop();
      CustomPopups.show(
        CustomPopups.dialog(
          content: error.toString(),
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );

      error.log();
    }
  }

  Future<void> afterSignUp(
    UserModel user,
  ) async {
    try {
      await currentUser!.updateDisplayName(user.name);

      await currentUser!.updatePhotoURL(user.imageUrl);

      await currentUser!.sendEmailVerification();

      await firestoreInstants.collection('users').doc(currentUser!.uid).set(
            user
                .copyWith(
                  id: currentUser!.uid,
                  createdAt: Timestamp.now(),
                  imageUrl: currentUser!.photoURL,
                  waterIntake: 0,
                  bmr: 0,
                )
                .toJson(),
          );
    } catch (e) {
      e.log();
    }
  }

  Future<void> signOut() async {
    try {
      RoutingRepository.go(Routes.home);
      await authInstants.signOut();
    } on FirebaseAuthException catch (error) {
      error.message.log();
    }
  }

  Future<void> resetPassword() async {
    try {
      if (currentUser == null || currentUser!.email == null) return;
      await authInstants.sendPasswordResetEmail(email: currentUser!.email!);
    } on FirebaseAuthException catch (error) {
      CustomPopups.show(
        CustomPopups.dialog(
          content: error.message,
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );
      error.message.log();
    }
  }

  Future<void> updatePassword(String password) async {
    try {
      if (currentUser == null) return;
      await currentUser!.updatePassword(password);
    } on FirebaseAuthException catch (error) {
      CustomPopups.show(
        CustomPopups.dialog(
          content: error.message,
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );
      error.message.log();
    }
  }

  Future<void> updateProfile(UserModel user) async {
    try {
      if (currentUser == null) return;
      await firestoreInstants.collection('users').doc(currentUser!.uid).update(
            user.toJson(),
          );
    } on FirebaseAuthException catch (error) {
      CustomPopups.show(
        CustomPopups.dialog(
          content: error.message,
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );
      error.message.log();
    }
  }

  Future<void> updateEmail(String email) async {
    try {
      if (currentUser == null) return;
      await currentUser!.verifyBeforeUpdateEmail(email);
    } on FirebaseAuthException catch (error) {
      CustomPopups.show(
        CustomPopups.dialog(
          content: error.message,
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );
      error.message.log();
    }
  }

  Future<void> deleteAccount() async {
    try {
      if (currentUser == null) return;
      await currentUser!.delete();
    } on FirebaseAuthException catch (error) {
      CustomPopups.show(
        CustomPopups.dialog(
          content: error.message,
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );
      error.message.log();
    }
  }

  Future<UserModel> getUserData() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> user =
          await firestoreInstants
              .collection('users')
              .doc(currentUser!.uid)
              .get();
      return UserModel.fromJson(user.data()!);
    } on FirebaseAuthException catch (error) {
      CustomPopups.show(
        CustomPopups.dialog(
          content: error.message,
          dialogType: DialogType.error,
          title: 'Error',
        ),
      );
      return UserModel.empty();
    }
  }
}
