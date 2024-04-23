import 'package:sportion/library.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.nameController});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(text: 'Register'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: RegisterScreen.formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: widget.nameController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter your name',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }

                    return null;
                  },
                ),
                const CustomGap(),
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
                const CustomGap(),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton.raised(
                    onPressed: () {
                      if (RegisterScreen.formKey.currentState!.validate()) {
                        final UserModel user = UserModel(
                          name: widget.nameController.text,
                          id: UniqueKey().toString(),
                          email: widget.emailController.text,
                          password: widget.passwordController.text,
                          imageUrl: '',
                          waterIntake: 0,
                          bmr: 0,
                          createdAt: Timestamp.now(),
                        );
                        AuthRepository.instants.signUpWithEmailAndPassword(
                          user: user,
                          password: widget.passwordController.text,
                        );
                      }
                    },
                    child: const Text('Register'),
                  ),
                ),
                const CustomGap(),
                CustomButton.flat(
                  onPressed: () {
                    AuthScreen.changePage(0);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
