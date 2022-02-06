import 'package:flutter_modular/flutter_modular.dart';
import 'package:starter_kit/app/home/home.module.dart';
import 'package:starter_kit/app/search/search.view.dart';
import 'package:starter_kit/app/splash-screen/splash-screen.view.dart';

class AppModule extends Module {
  static String home = "/home";
  static String search = "/search";
  static String resetPassword = "/resetPassword";
  static String forgotPassword = "/forgotPassword";
  static String splashScreen = "/";

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home', module: HomeModule(), transition: TransitionType.rightToLeftWithFade),
    ChildRoute(splashScreen, child: (context, args) => SplashScreen()),
    ChildRoute(search, child: (context, args) => Search(), transition: TransitionType.rightToLeft),
  ];
}
