// import 'dart:convert';
// import 'dart:ffi';
// import 'dart:io';
//
// import 'package:coffee_app/data/app_exceptions.dart';
// import 'package:coffee_app/global/Utils/utils.dart';
// import 'package:coffee_app/global/app_url.dart';
// import 'package:coffee_app/models/auth_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// class AuthController extends GetxController {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   RxBool loading = false.obs;
//
//   Future<void> signUp() async {
//     final String url = AppUrl.signUpApi;
//     print(url);
//     try {
//       final response = await http
//           .post(
//             Uri.parse(url),
//             headers: {'Content-Type': 'application/json'},
//             body: jsonEncode({
//               'email': emailController.text,
//               'password': passwordController.text,
//             }),
//           )
//           .timeout(Duration(seconds: 10));
//       print(response.body);
//       print(response.statusCode);
//
//       if (response.statusCode == 200) {
//         return Utils.snackBar(
//             "Account Created", 'Account is successfully created');
//       } else {
//         return Utils.snackBar(
//             "Account Not Created", 'Account is not successfully created');
//       }
//     } on SocketException {
//       throw InternetException("");
//     } on RequestTimeOut {
//       throw RequestTimeOut("");
//     }
//   }
//
//   Future<void> login() async {
//     loading.value = true;
//     try {
//       final String url = AppUrl.loginApi;
//       final response = await http
//           .post(
//             Uri.parse(url),
//             headers: {'Content-Type': 'application/json'},
//             body: jsonEncode({
//               "email": emailController.text,
//               "password": passwordController.text,
//             }),
//           )
//           .timeout(Duration(seconds: 10));
//
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       print('Response headers: ${response.headers}');
//
//       print(response.statusCode);
//
//       if (response.statusCode == 200) {
//         loading.value = false;
//         // var jsonResponse = jsonDecode(response.body);
//
//         Utils.snackBar("LoggedIn", "Logged in successfully");
//         print("Logged in");
//         // if (jsonResponse['status']) {
//         //   print("success");
//         // }
//       } else {
//         loading.value = true;
//         Utils.snackBar("LoggedIn Failed", "Check your username and password");
//         print('Error: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: ${e}');
//     }
//   }
// }

import 'dart:convert';

import 'package:coffee_app/global/Utils/utils.dart';
import 'package:coffee_app/global/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool loading = false.obs;

  Future<void> signUp() async {
    loading.value = true;
    final String url = AppUrl.signUpApi;
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": emailController.text,
            "password": passwordController.text.toString(),
          }));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);

        if (data["status"] == true) {
          loading.value = false;
          Utils.snackBar("Account Created", "Congratulations");
          print("Created Account Successfully");
        } else {
          loading.value = false;
          Utils.snackBar("Account already created", "Create a new account");
        }
      } else {
        loading.value = false;
        Utils.snackBar("Acoount Not Created", "Unable to create a new account");
        print(response.body);
      }
    } catch (e) {
      print("Error");
    }
  }

  Future<void> login(BuildContext context) async {
    loading.value = true;
    final String url = AppUrl.loginApi;
    final http.Response response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text.toString(),
          "password": passwordController.text.toString(),
        }));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (data["status"] == false) {
        loading.value = false;
        print("Unable to log in");
        Utils.snackBar("Login Failed", "Please check image or password");
      } else {
        loading.value = false;
        Utils.snackBar("Login Success", "Congratulations");
        Navigator.of(context).pushNamed('/fillUp');
        print("Logged in successfully");
      }
    } else {
      loading.value = false;

      Get.snackbar("Login Failed", data["error"]);
    }
  }
}
