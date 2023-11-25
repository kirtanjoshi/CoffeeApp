import 'package:coffee_app/common/routes/route_generator.dart';
import 'package:coffee_app/features/screens/auth/login_screen/login_screen.dart';
import 'package:coffee_app/features/screens/bio_screen/fill_up_details.dart';
import 'package:coffee_app/features/screens/bio_screen/set_location.dart';
import 'package:coffee_app/features/screens/bio_screen/upload_image.dart';
import 'package:coffee_app/features/screens/onBoarding_screen/onBoarding_screen.dart';
import 'package:coffee_app/features/screens/view/bottom_navgation_bar.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Tabs(),
    );
  }
}
