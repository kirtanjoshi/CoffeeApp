// import 'dart:convert';
//
// import 'package:coffee_app/data/services/base_api_network.dart';
// import 'package:coffee_app/models/auth_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
//
// class NetworkApiServices extends BaseApiServices {
//   @override
//   Future<dynamic> getApi(String url) async {
//     if (kDebugMode) {
//       print(url);
//     }
//
//     dynamic responseJson;
//     try {
//       final response =
//           await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
//       responseJson = returnResponse(response);
//     } catch (e) {
//       print(e.toString());
//     }
//     print(responseJson);
//     return responseJson;
//   }
//
//   @override
//   Future<AuthModel> postApi(String url, dynamic data) async {
//     dynamic responseJson;
//     try {
//       final response = await http.post(Uri.parse(url),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode(data));
//       responseJson = returnResponse(response);
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
//
//   dynamic returnResponse(http.Response response) {
//     if (kDebugMode) {
//       print(response.body.toString());
//     }
//
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         return responseJson;
//       case 400:
//         if (kDebugMode) {
//           print("Internet error");
//         }
//
//       default:
//         if (kDebugMode) {
//           print("Fetch error");
//         }
//     }
//   }
// }
