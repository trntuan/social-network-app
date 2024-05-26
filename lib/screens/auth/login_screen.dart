import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../const/const_router.dart';
import '../../helpers/helper_decode.dart';
import '../../services/auth/auth_validators.dart';
import '../../services/get_it/get_instance.dart';
import '../../theme/theme_color.dart';
import '../../theme/theme_text.dart';
import '../../widgets/custom_appbar/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dynamic_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthBloc bloc = GetIt.instance.get<AuthBloc>();
  // Define Form key
  final _formKey = GlobalKey<FormState>();

  // Instantiate validator
  final AuthValidators authValidator = AuthValidators();

// controllers
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

// create focus nodes
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  // to obscure text default value is false
  bool obscureText = true;
  // This will require toggling between register and sign-in mode

// Instantiate all the *text editing controllers* and focus nodes on *initState* function
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  // These all need to be disposed of once done so let's do that as well.
  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
      backgroundColor: ThemeColors.background,
      appBar: CustomAppbar(
        paddingLeft: EdgeInsets.only(left: 50.sp),
        title: 'Đăng nhập',
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
                  labelText: 'Nhâp địa chỉ email',
                  textInputAction: TextInputAction.next,
                  isNonPasswordField: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Username

                DynamicInputWidget(
                  controller: passwordController,
                  labelText: 'Nhập mât khẩu',
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

                Padding(
                  padding: EdgeInsets.only(
                    left: 55.sp,
                    right: 55.sp,
                  ),
                  child: buttonInkwell(
                    marginBtn: EdgeInsets.zero,
                    paddingBtn: EdgeInsets.zero,
                    title: 'Đăng nhập',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        bloc.add(AuthEventLogin(
                          email: emailController.text,
                          password: HelperDecode.encryptPassword(
                              passwordController.text),
                        ));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    GetStores.navigator.pushNamed(ConstRouter.forgotPassword);
                  },
                  child: Text(
                    'Quên mật khẩu?',
                    style: ThemeText.size40BlackBold,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Bạn chưa có tài khoản?"),
                    TextButton(
                      onPressed: () {
                        GetStores.navigator.pushNamed(ConstRouter.register);
                      },
                      child: const Text('Đăng ký'),
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
