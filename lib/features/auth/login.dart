import 'package:sportion/library.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen(
      {super.key,
      required this.emailController,
      required this.passwordController});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(text: 'Login'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: LoginScreen.formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: widget.emailController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }

                    return null;
                  },
                ),
                const CustomGap(),
                CustomTextField(
                  controller: widget.passwordController,
                  textInputAction: TextInputAction.done,
                  hintText: 'Enter your password',
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const CustomGap(),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton.raised(
                    onPressed: () {
                      if (LoginScreen.formKey.currentState!.validate()) {
                        AuthRepository.instants.signInWithEmailAndPassword(
                          email: widget.emailController.text,
                          password: widget.passwordController.text,
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
                const CustomGap(
                  height: 5,
                ),
                CustomButton.flat(
                  onPressed: () => AuthScreen.changePage(1),
                  child: const Text('Not A Member? Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum UserType {
  volunteer,
  recruiter,
  csrOrFunder,
}
