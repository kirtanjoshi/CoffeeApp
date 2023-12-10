// import 'dart:convert';
//
// import 'package:coffee_app/models/auth_model.dart';
// import 'package:coffee_app/repository/url/app_url.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// class BioController extends GetxController {
//   final fullNameController = TextEditingController().obs;
//   final addressController = TextEditingController().obs;
//   final phoneNumberController = TextEditingController().obs;
//   RxBool loading = false.obs;
//
//   Future<Data> postUserData(Data userModel) async {
//     loading.value = true;
//     final url = "${AppUrl.baseApi}/users/${userModel.id}";
//     final response = await http.put(Uri.parse(url),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "fullName": fullNameController.value.text,
//           "address": addressController.value.text,
//           "phoneNumber": phoneNumberController.value.text.toString(),
//         }));
//     print(response.statusCode);
//
//     if (response.statusCode == 200) {
//       return print("Data sent");
//     } else {
//       print("Unable to send");
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:coffee_app/data/app_exceptions.dart';
import 'package:coffee_app/global/Utils/utils.dart';
import 'package:coffee_app/models/auth_model.dart';
import 'package:coffee_app/repository/url/app_url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BioController extends GetxController {
  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  RxBool loading = false.obs;

  // Future<UserModel> postUserData(UserModel userModel) async {
  //   loading.value = true;
  //
  //   try {
  //     // final url = ;
  //
  //     final http.Response response = await http.put(
  //         Uri.parse(
  //             "http://192.168.1.71:3000/api/users/6563716c9a23a9297e7e20ba"),
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode(userModel.toJson()));
  //
  //     var data = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (data["status"] == false && data["status"] == null) {
  //         loading.value = false;
  //         print("Unable to log in");
  //         Utils.snackBar("Login Failed", "Please check image or password");
  //         return Future.error("Login Failed"); // Handle error case
  //       } else {
  //         print("data satus :${data["status"]}");
  //         loading.value = false;
  //         Utils.snackBar("Login Success", "Congratulations");
  //         print("Logged in successfully");
  //         return UserModel.fromJson(jsonDecode(response.body));
  //       } // Return the data or any other data you want to pass
  //       // final Map<String, dynamic> responseData = jsonDecode(response.body);
  //       // final Data updatedUserData = Data.fromJson(responseData);
  //       // return updatedUserData;
  //     } else {
  //       loading.value = false;
  //       Utils.snackBar("Login fail", "Congratulations");
  //       return Future.error("Login Failed"); // Handle error case
  //     }
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

  // Future<Data> updateUserData(Data userModel, BuildContext context) async {
  //   loading.value = true;
  //
  //   try {
  //     final http.Response response = await http.put(
  //         Uri.parse(
  //             "http://192.168.1.71:3000/api/users/6563716c9a23a9297e7e20ba"),
  //         headers: <String, String>{"Content-Type": "application/json"},
  //         body: jsonEncode(userModel.toJson()));
  //
  //     var data = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (data["status"] == false) {
  //         loading.value = false;
  //         print("Unable to update");
  //         Utils.snackBar("Login Failed", "Please check image or password");
  //         return Future.error("Login Failed"); // Handle error case
  //       } else {
  //         print("Data = ${data["status"]}");
  //         loading.value = false;
  //         Utils.snackBar("UpdateSuccess", "Congratulations");
  //         print("Logged in successfully");
  //         return Future.value(userModel);
  //       } // Return the data or any other data you want to pass
  //       // final Map<String, dynamic> responseData = jsonDecode(response.body);
  //       // final Data updatedUserData = Data.fromJson(responseData);
  //       // return updatedUserData;
  //     } else {
  //       loading.value = false;
  //       Utils.snackBar("Login fail", "Congratulations");
  //       return Future.error("Login Failed"); // Handle error case
  //     }
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

  Future<void> updateUserData({
    required BuildContext context,
    required Data userModel,
  }) async {
    loading.value = true;
    const String url = AppUrl.signUpApi;
    try {
      final http.Response response = await http.put(
          Uri.parse("http://192.168.1.71:3000/api/users/${userModel.id}"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "fullName": fullNameController.text,
            "address": addressController.text,
            "phoneNumber": phoneNumberController.text.toString(),
          }));
      print(http.get(
          Uri.parse("http://192.168.1.71:3000/api/users/${userModel.id}")));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);

        if (data["status"] == true) {
          loading.value = false;
          Utils.snackBar("Update Created", "Congratulations");
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
