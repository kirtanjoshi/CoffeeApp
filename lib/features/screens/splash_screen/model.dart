import 'dart:async';

import 'package:coffee_app/data/secure%20storage/secure_storage.dart';
import 'package:coffee_app/features/screens/auth/login_screen/login_screen.dart';
import 'package:coffee_app/features/screens/view/bottom_navgation_bar.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) async {
    var email = await SecureStorage().getStringValuesSF("email");
    print(email);
    if (email != null) {
      Timer(Duration(seconds: 2),
          () => Navigator.of(context).pushNamed("/fillUp"));
      print("I  am here");
    } else {
      Timer(
          Duration(seconds: 2),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }
}
