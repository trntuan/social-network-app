import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/const_router.dart';
import '../../services/auth/auth_validators.dart';
import '../../services/get_it/get_instance.dart';
import '../../theme/theme_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dynamic_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Define Form key
  final _formKey = GlobalKey<FormState>();

  // Instantiate validator
  final AuthValidators authValidator = AuthValidators();

// controllers
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

// create focus nodes
  late FocusNode emailFocusNode;
  late FocusNode usernameFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  // to obscure text default value is false
  bool obscureText = true;
  // This will require toggling between register and sign-in mode

// Instantiate all the *text editing controllers* and focus nodes on *initState* function
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    emailFocusNode = FocusNode();
    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  // These all need to be disposed of once done so let's do that as well.
  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

// Create a function that'll toggle the password's visibility on the relevant icon tap.
  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

// Let's create a snack bar to pop info on various circumstances.
// Create a scaffold messanger
  SnackBar msgPopUp(msg) {
    return SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Email
                DynamicInputWidget(
                  controller: emailController,
                  obscureText: false,
                  focusNode: emailFocusNode,
                  toggleObscureText: null,
                  validator: authValidator.emailValidator,
                  prefIcon: const Icon(Icons.mail),
                  labelText: 'Enter Email Address',
                  textInputAction: TextInputAction.next,
                  isNonPasswordField: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Username

                DynamicInputWidget(
                  controller: passwordController,
                  labelText: 'Enter Password',
                  obscureText: obscureText,
                  focusNode: passwordFocusNode,
                  toggleObscureText: toggleObscureText,
                  validator: authValidator.passwordVlidator,
                  prefIcon: const Icon(Icons.password),
                  textInputAction: TextInputAction.done,
                  isNonPasswordField: false,
                ),

                const SizedBox(
                  height: 20,
                ),

                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 0,
                    child: DynamicInputWidget(
                      controller: confirmPasswordController,
                      focusNode: confirmPasswordFocusNode,
                      isNonPasswordField: false,
                      labelText: 'Confirm Password',
                      obscureText: obscureText,
                      prefIcon: const Icon(Icons.password),
                      textInputAction: TextInputAction.done,
                      toggleObscureText: toggleObscureText,
                      validator: (val) =>
                          authValidator.confirmPasswordValidator(
                              val, passwordController.text),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: 55.sp,
                    right: 55.sp,
                  ),
                  child: buttonInkwell(
                    marginBtn: EdgeInsets.zero,
                    paddingBtn: EdgeInsets.zero,
                    title: 'Log in',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            msgPopUp('Form is valid, Submitting data'));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'forgot password?',
                    style: ThemeText.size40BlackBold,
                  ),
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //           msgPopUp('Form is valid, Submitting data'));
                //     }
                //   },
                //   style: ButtonStyle(
                //     elevation: MaterialStateProperty.all(8.0),
                //   ),
                //   child: Text(registerAuthMode ? 'Register' : 'Sign In'),
                // ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account yet?"),
                    TextButton(
                      onPressed: () {
                        GetInstance.navigator.pushNamed(ConstRouter.register);
                      },
                      child: const Text('Regsiter'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
