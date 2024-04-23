import 'package:sportion/library.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: Sportion()));
}

class Sportion extends ConsumerWidget {
  const Sportion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeRepository.theme,
      routerConfig: RoutingRepository.router,
    );
  }
}
