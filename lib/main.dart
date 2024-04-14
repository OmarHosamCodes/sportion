import 'package:sportion/library.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  (await SharedPreferences.getInstance()).remove('nutritionList');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sportion',
      themeMode: ThemeRepository.themeMode,
      darkTheme: ThemeRepository.theme,
      routerConfig: RoutingRepository.router,
    );
  }
}
