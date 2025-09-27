import 'package:bookia/feature/auth/presentation/login/page/login_screen.dart';
import 'package:bookia/feature/auth/presentation/register/page/register_screen.dart';
import 'package:bookia/feature/splash/splash_screen.dart';
import 'package:bookia/feature/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashScreen = '/';
  static const String welcome = '/welcomeScreen';
  static const String login = '/login';
  static const String register = '/register';

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: splashScreen, builder: (context, state) => SplashScreen()),

      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),

      GoRoute(path: login, builder: (context, state) => LoginScreen()),
      GoRoute(path: register, builder: (context, state) => RegisterScreen()),
    ],
  );
}
