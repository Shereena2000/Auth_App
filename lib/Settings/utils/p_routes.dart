import 'package:flutter/material.dart';
import 'package:nxl/Features/home/view/ui.dart';

import '../../Features/authentication/login/view/ui.dart';
import '../../Features/authentication/sign_up/view/ui.dart';
import '../../Features/splash/view/splash_screen.dart';
import 'p_pages.dart';

class Routes {
  static Route<dynamic>? genericRoute(RouteSettings settings) {
    switch (settings.name) {
      case PPages.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());


                  case PPages.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
                          case PPages.signup:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
                     case PPages.homePageUi:
        return MaterialPageRoute(builder: (context) => HomeScreen());                
      default:
        return null;
    }
  }
}
