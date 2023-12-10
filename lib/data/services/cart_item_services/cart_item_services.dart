import 'dart:convert';

import 'package:coffee_app/models/cart_item_model.dart';
import 'package:http/http.dart' as http;

class CartServices {
  Future<List<CartItemModel>> fetchCartForUser(String userId) async {
    try {
      var url =
          "http://192.168.1.71:3000/api/cart/$userId"; // Replace with your actual API base URL
      final http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);

        return responseData
            .map((json) => CartItemModel.fromJson(json))
            .toList();
      } else {
        throw Exception(
            "Failed to fetch cart for user. Status code: ${response.statusCode}");
      }
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartItemModel>> addToCart(
      CartItemModel cartItemModel, String userId) async {
    try {
      Map<String, dynamic> data = cartItemModel.toJson();
      data["user"] = userId;
      var url =
          "http://192.168.1.71:3000/api/cart"; // Replace with your actual API base URL
      final http.Response response =
          await http.post(Uri.parse(url), body: jsonEncode(data));

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);

        return responseData
            .map((json) => CartItemModel.fromJson(json))
            .toList();
      } else {
        throw Exception(
            "Failed to fetch cart for user. Status code: ${response.statusCode}");
      }
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartItemModel>> removeFromCart(
      String productId, String userId) async {
    try {
      Map<String, dynamic> data = {"product": productId, "user": userId};
      var url =
          "http://192.168.1.71:3000/api/cart"; // Replace with your actual API base URL
      final http.Response response = await http.delete(
        Uri.parse(url),
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);

        return responseData
            .map((json) => CartItemModel.fromJson(json))
            .toList();
      } else {
        throw Exception(
            "Failed to fetch cart for user. Status code: ${response.statusCode}");
      }
    } catch (ex) {
      rethrow;
    }
  }
}
// Future<CartItemModel> fetchCartForUser(String user_id) async {
//   var url = "http://192.168.1.71:3000/api/cart/$user_id";
//   final response = await http.get(Uri.parse(url));
//   if (response.statusCode == 200) {
//     return cartModelFromJson(response.body);
//   } else {
//     throw Exception("Failed to get product");
//   }
// }
//
// Future<CartItemModel> addToCart(
//     CartItemModel cartItemModel, String userId) async {
//   try {
//     Map<String, dynamic> data = cartItemModel.toJson();
//     data["user"] = userId;
//     var url = "http://192.168.1.71:3000/api/cart";
//     final response = await http.post(
//       Uri.parse(url),
//       body: jsonEncode(data),
//     );
//     if (response.statusCode == 200) {
//       return productModelFromJson(response.body);
//     } else {
//       throw Exception("Failed to get product");
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }
//
// Future<CartItemModel> removeFromCart(String productId, String userId) async {
//   try {
//     Map<String, dynamic> data = {"product": productId, "user": userId};
//     var url = "http://192.168.1.71:3000/api/cart";
//     final response = await http.delete(
//       Uri.parse(url),
//       body: jsonEncode(data),
//     );
//     if (response.statusCode == 200) {
//       return productModelFromJson(response.body);
//     } else {
//       throw Exception("Failed to get product");
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }
