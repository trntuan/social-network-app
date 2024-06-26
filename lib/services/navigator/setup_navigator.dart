import 'package:go_router/go_router.dart';

import '../../const/const_router.dart';
import '../../models/params/param_open_chat.dart';
import '../../screens/auth/forgot_password_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/register_screen.dart';
import '../../screens/chat/chat_view.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/home/post_new_letter.dart';
import '../../screens/messages/messages_screen.dart';
import '../../screens/my_page/my_page_screen.dart';
import '../../screens/post_detail/post_detail_screen.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/user/user_page_screen.dart';
import 'config_navigator.dart';

class SetupRouter {
  late final GoRouter appRouter = GoRouter(
    initialLocation: '/${ConstRouter.splash}',
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
      // UserPageScreen
      GoRoute(
        name: ConstRouter.userDetail,
        path: '/${ConstRouter.userDetail}',
        builder: (context, state) {
          final params = state.extra as String;
          return UserPageScreen(userId: params);
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
      ),

      GoRoute(
        name: ConstRouter.myPage,
        path: '/${ConstRouter.myPage}',
        builder: (context, state) {
          return const MyPageScreen();
        },
      ),
      GoRoute(
        name: ConstRouter.chat,
        path: '/${ConstRouter.chat}',
        builder: (context, state) {
          final message = state.extra as ParamOpenChat;
          return ChatView(message: message);
        },
      ),

      GoRoute(
        name: ConstRouter.messages,
        path: '/${ConstRouter.messages}',
        builder: (context, state) {
          return const MessageScreen();
        },
      ),
      //
      GoRoute(
        name: ConstRouter.postNewletter,
        path: '/${ConstRouter.postNewletter}',
        builder: (context, state) {
          return const PostNewLetter();
        },
      ),
      GoRoute(
        name: ConstRouter.postDetail,
        path: '/${ConstRouter.postDetail}',
        builder: (context, state) {
          final prams = state.extra as int?;
          return PostDetailScreen(
            postId: prams,
          );
        },
      ),
    ],
  );
}
