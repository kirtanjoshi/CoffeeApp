import 'package:coffee_app/features/screens/auth/login_screen/login_screen.dart';
import 'package:coffee_app/features/screens/auth/signup_screen/signUp_screen.dart';
import 'package:coffee_app/features/screens/bio_screen/view/fill_up_details.dart';
import 'package:coffee_app/features/screens/bio_screen/view/set_location.dart';
import 'package:coffee_app/features/screens/bio_screen/view/upload_image.dart';
import 'package:coffee_app/features/screens/view/bottom_navgation_bar.dart';
import 'package:coffee_app/features/screens/view/dashboard/home_page.dart';
import 'package:coffee_app/features/screens/view/products_details/product_details.dart';
import 'package:coffee_app/models/auth_model.dart';
import 'package:coffee_app/models/product_model.dart';
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
      // case '/signUp':
      //   return GetPageRoute(
      //     page: () => const SignUpScreen(),
      //     transition: Transition.cupertino,
      //   );
      case '/fillUp':
        return GetPageRoute(
          page: () => FillUpScreen(),
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
      case '/logout':
        return GetPageRoute(
          page: () => const LoginScreen(),
          transition: Transition.cupertino,
        );
      case '/productDetails':
        return GetPageRoute(
          page: () => ProductDetailsScreen(datum: settings.arguments as Datum),
          transition: Transition.cupertino,
        );
      case '/tabs':
        return GetPageRoute(
          page: () => Tabs(),
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
