import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../const/const_value.dart';
import '../../services/auth/auth_validators.dart';
import '../../services/get_it/get_instance.dart';
import '../../theme/theme_color.dart';
import '../../theme/theme_text.dart';
import '../../widgets/custom_appbar/button_appbar.dart';
import '../../widgets/custom_appbar/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dynamic_input_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int? gender = ConstValue.nam;
  // Define Form key
  final _formKey = GlobalKey<FormState>();

  late final AuthBloc bloc = GetIt.instance.get<AuthBloc>();

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
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: CustomAppbar(
        title: 'Register',
        iconLeft: IconAppbar.back,
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
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
                        controller: usernameController,
                        obscureText: false,
                        focusNode: usernameFocusNode,
                        toggleObscureText: null,
                        validator: null,
                        prefIcon: const Icon(Icons.person),
                        labelText: 'Enter Username(Optional)',
                        textInputAction: TextInputAction.next,
                        isNonPasswordField: true,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      DynamicInputWidget(
                        controller: passwordController,
                        labelText: 'Enter Password',
                        obscureText: obscureText,
                        focusNode: passwordFocusNode,
                        toggleObscureText: toggleObscureText,
                        validator: authValidator.passwordVlidator,
                        prefIcon: const Icon(Icons.password),
                        textInputAction: TextInputAction.next,
                        isNonPasswordField: false,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      DynamicInputWidget(
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

                      const SizedBox(
                        height: 20,
                      ),

                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Column(
                            children: [
                              const Text('giới tính'),
                              Row(
                                children: [
                                  Text(
                                    'nam',
                                    style: ThemeText.size40Black,
                                  ),
                                  Radio<int>(
                                    splashRadius: 25.0,
                                    // activeColor: ThemeColors.burgundy,
                                    value: ConstValue.nam,
                                    groupValue: gender,
                                    onChanged: (int? value) {
                                      setState(() {
                                        gender = value;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'nữ',
                                    style: ThemeText.size40Black,
                                  ),
                                  Radio<int>(
                                    splashRadius: 25.0,
                                    // activeColor: ThemeColors.burgundy,
                                    value: ConstValue.nam,
                                    groupValue: gender,
                                    onChanged: (int? value) {
                                      setState(() {
                                        gender = value;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          );
                        },
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
                          title: 'Register',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              bloc.add(
                                AuthEventRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  firstName: usernameController.text,
                                  lastName: confirmPasswordController.text,
                                ),
                              );
                            }
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already Have an account?'),
                          TextButton(
                              onPressed: () {
                                GetInstance.navigator.pop();
                              },
                              child: const Text(
                                'Log in',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
