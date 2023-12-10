
import 'package:coffee_app/data/services/product_services.dart';
import 'package:coffee_app/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = ProductModel().obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var products = await ProductServices().getAllproducts();
      productList.value = products;
        } finally {
      isLoading(false);
    }
  }
}
