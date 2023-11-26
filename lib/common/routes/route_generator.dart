import 'package:coffee_app/features/screens/auth/login_screen/login_screen.dart';
import 'package:coffee_app/features/screens/auth/signup_screen/signUp_screen.dart';
import 'package:coffee_app/features/screens/bio_screen/fill_up_details.dart';
import 'package:coffee_app/features/screens/bio_screen/set_location.dart';
import 'package:coffee_app/features/screens/bio_screen/upload_image.dart';
import 'package:coffee_app/features/screens/view/dashboard/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return GetPageRoute(
          page: () => const LoginScreen(),
          transition: Transition.cupertino,
        );
      case '/signUp':
        return GetPageRoute(
          page: () => const SignUpScreen(),
          transition: Transition.cupertino,
        );
      case '/fillUp':
        return GetPageRoute(
          page: () => const FillUpScreen(),
          transition: Transition.cupertino,
        );
      case '/upload':
        return GetPageRoute(
          page: () => const UploadImageScreen(),
          transition: Transition.cupertino,
        );
      case '/location':
        return GetPageRoute(
          page: () => const LocationScreen(),
          transition: Transition.cupertino,
        );
      case '/dashboard':
        return GetPageRoute(
          page: () => const Dashboard(),
          transition: Transition.cupertino,
        );
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return GetPageRoute(
      page: () => const Scaffold(
        body: Center(child: Text("error")),
      ),
      transition: Transition.cupertino,
    );
  }
}
