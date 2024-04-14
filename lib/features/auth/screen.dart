import 'package:sportion/features/auth/login.dart';
import 'package:sportion/features/auth/register.dart';
import 'package:sportion/library.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static final PageController pageController = PageController();

  static void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: AuthScreen.pageController,
        children: <Widget>[
          LoginScreen(
            emailController: emailController,
            passwordController: passwordController,
          ),
          RegisterScreen(
            emailController: emailController,
            passwordController: passwordController,
            nameController: nameController,
          ),
        ],
      ),
    );
  }
}
