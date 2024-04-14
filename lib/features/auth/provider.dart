import 'package:sportion/library.dart';

final authRepo = Provider<AuthRepository>((ref) {
  return AuthRepository.instants;
});

final userProvider = FutureProvider<UserModel?>((ref) async {
  final user = await ref.read(authRepo).getUserData();
  return user;
});
