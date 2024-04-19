import 'package:flutter/material.dart';

import '../../services/auth/auth_validators.dart';
import '../../widgets/dynamic_input_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Define Form key
  final _formKey = GlobalKey<FormState>();

  // Instantiate validator
  final AuthValidators authValidator = AuthValidators();

// controllers
  late TextEditingController emailController;

// create focus nodes
  late FocusNode emailFocusNode;

  // to obscure text default value is false
  bool obscureText = true;
  // This will require toggling between register and sign-in mode
  bool registerAuthMode = false;

// Instantiate all the *text editing controllers* and focus nodes on *initState* function
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  // These all need to be disposed of once done so let's do that as well.
  @override
  void dispose() {
    super.dispose();

    emailController.dispose();

    emailFocusNode.dispose();
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
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Account'),
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

                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: registerAuthMode ? 1 : 0,
                  child: const SizedBox(
                    height: 20,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              msgPopUp('Form is valid, Submitting data'));
                        }
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(8.0),
                      ),
                      child: Text(registerAuthMode ? 'Register' : 'Sign In'),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(registerAuthMode
                        ? 'Already Have an account?'
                        : "Don't have an account yet?"),
                    TextButton(
                      onPressed: () =>
                          setState(() => registerAuthMode = !registerAuthMode),
                      child: Text(registerAuthMode ? 'Sign In' : 'Regsiter'),
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
