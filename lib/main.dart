import 'package:coffee_app/common/routes/route_generator.dart';
import 'package:coffee_app/features/screens/auth/login_screen/login_screen.dart';
import 'package:coffee_app/features/screens/bio_screen/view/fill_up_details.dart';
import 'package:coffee_app/features/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

void main() async {
  FlutterSecureStorage.setMockInitialValues({});
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: SplashScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
