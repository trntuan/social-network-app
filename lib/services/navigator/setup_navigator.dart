import 'package:go_router/go_router.dart';

import '../../const/const_router.dart';
import '../../screens/auth/forgot_password_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/register_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/splash/splash_screen.dart';
import 'config_navigator.dart';

class SetupRouter {
  late final GoRouter appRouter = GoRouter(
    initialLocation: '/${ConstRouter.home}',
    navigatorKey: ConfigNavigator.navigatorKey,
    routes: [
      GoRoute(
        name: ConstRouter.splash,
        path: '/${ConstRouter.splash}',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: ConstRouter.login,
        path: '/${ConstRouter.login}',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: ConstRouter.register,
        path: '/${ConstRouter.register}',
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        name: ConstRouter.forgotPassword,
        path: '/${ConstRouter.forgotPassword}',
        builder: (context, state) {
          return const ForgotPasswordScreen();
        },
      ),
      GoRoute(
        name: ConstRouter.home,
        path: '/${ConstRouter.home}',
        builder: (context, state) {
          return const HomeScreen();
        },
      )
    ],
  );
}
