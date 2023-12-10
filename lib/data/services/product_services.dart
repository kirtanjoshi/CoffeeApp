
import 'package:coffee_app/models/product_model.dart';
import 'package:coffee_app/repository/url/app_url.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  Future<ProductModel> getAllproducts() async {
    var url = AppUrl.fetchProducts;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception("Failed to get product");
    }
  }
}
//
// class ProductServices {
//   Future<List<ProductModel>> getAllproducts() async {
//     var url = AppUrl.fetchProducts;
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       List<dynamic> jsonList = jsonDecode(response.body);
//
//       // Convert the list of JSON objects into a list of ProductModel
//       List<ProductModel> productList =
//           jsonList.map((json) => productModelFromJson(json)).toList();
//     } else {
//       throw Exception("Failed to get product");
//     }
//   }
// }
