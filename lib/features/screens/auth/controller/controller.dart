import 'dart:convert';
import 'dart:io';

import 'package:coffee_app/data/app_exceptions.dart';
import 'package:coffee_app/data/secure%20storage/secure_storage.dart';
import 'package:coffee_app/global/Utils/utils.dart';
import 'package:coffee_app/models/auth_model.dart';
import 'package:coffee_app/repository/url/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool loading = false.obs;

  Future<void> signUp() async {
    loading.value = true;
    const String url = AppUrl.signUpApi;
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": emailController.text.toString(),
            "password": passwordController.text.toString(),
          }));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);

        if (data["status"] == true) {
          loading.value = false;
          return Utils.snackBar("Account Created", "Congratulations");
          print("Created Account Successfully");
        } else {
          loading.value = false;
          return Utils.snackBar(
              "Account already created", "Create a new account");
        }
      } else {
        loading.value = false;
        return Utils.snackBar(
            "Acoount Not Created", "Unable to create a new account");
        print(response.body);
      }
    } on SocketException {
      loading.value = false;
      throw InternetException("No Internet connection");
    } on RequestTimeOut {
      loading.value = false;
      throw RequestTimeOut("Request Timed Out");
    } catch (e) {
      loading.value = false;
      throw ServerException("Internal server error");
    }
  }

  // Future<Data> login(Data userModel, BuildContext context) async {
  //   loading.value = true;
  //   const String url = AppUrl.loginApi;
  //   try {
  //     final http.Response response = await http.post(Uri.parse(url),
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode(userModel.toString()));
  //
  //     var data = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (data["status"] == false) {
  //         loading.value = false;
  //         print("Unable to log in");
  //         return Utils.snackBar(
  //             "Login Failed", "Please check image or password");
  //       } else {
  //         loading.value = false;
  //         return Utils.snackBar("Login Success", "Congratulations");
  //         Navigator.of(context).pushNamed('/fillUp');
  //         print("Logged in successfully");
  //       }
  //     } else {
  //       // loading.value = false;
  //       return Utils.snackBar("Login fail", "Congratulations");
  //     }
  //
  //     await SecureStorage().addStringToSF("email", emailController.text);
  //   } on SocketException {
  //     loading.value = false;
  //     throw InternetException("No Internet connection");
  //   } on RequestTimeOut {
  //     loading.value = false;
  //     throw RequestTimeOut("Request Timed Out");
  //   } catch (e) {
  //     loading.value = false;
  //     throw ServerException("Internal server error");
  //   }
  // }

  Future<Data> login(Data userModel, BuildContext context) async {
    loading.value = true;
    const String url = AppUrl.loginApi;

    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(userModel.toJson()));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == false) {
          loading.value = false;
          print("Unable to log in");
          // await SecureStorage().addStringToSF("email", emailController.text);
          Utils.snackBar("Login Failed", "Please check image or password");
          return Future.error("Login Failed");
          // Handle error case
        } else {
          print(data["status"]);
          loading.value = false;
          Utils.snackBar("Login Success", "Congratulations");
          Navigator.of(context).pushNamed('/fillUp');
          print("Logged in successfully");
          return Future.value(userModel);
        } // Return the user model or any other data you want to pass
        // final Map<String, dynamic> responseData = jsonDecode(response.body);
        // final Data updatedUserData = Data.fromJson(responseData);
        // return updatedUserData;
      } else {
        loading.value = false;
        Utils.snackBar("Login fail", "Congratulations");
        return Future.error("Login Failed"); // Handle error case
      }
    } on SocketException {
      loading.value = false;
      throw InternetException("No Internet connection");
    } on RequestTimeOut {
      loading.value = false;
      throw RequestTimeOut("Request Timed Out");
    } catch (e) {
      loading.value = false;
      throw ServerException("Internal server error");
    }
  }
}
