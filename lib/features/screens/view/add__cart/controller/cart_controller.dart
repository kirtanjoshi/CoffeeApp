// import 'package:coffee_app/data/services/cart_item_services/cart_item_services.dart';
// import 'package:coffee_app/models/cart_item_model.dart';
// import 'package:coffee_app/models/product_model.dart';
// import 'package:get/get.dart';
//
// class CartController extends GetxController {
//   final _cartRepository = CartServices();
//
//   RxList<CartItemModel> items = <CartItemModel>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize your controller, if needed
//   }
//
//   void sortAndLoad() {
//     items.sort((a, b) => b.datum!.title!.compareTo(a.datum!.title!));
//   }
//
//   Future<void> initialize(String userId) async {
//     try {
//       items.assignAll(await _cartRepository.fetchCartForUser(userId));
//       sortAndLoad();
//     } catch (ex) {
//       // Handle error
//       print(ex.toString());
//     }
//   }
//
//   Future<void> addToCart(Datum productModel, int quantity) async {
//     try {
//       final newItem = CartItemModel(
//         datum: productModel,
//         quantity: quantity,
//       );
//
//       items.assignAll(await _cartRepository.addToCart(
//           newItem, userId)); // Replace userId with actual user id
//       sortAndLoad();
//     } catch (ex) {
//       // Handle error
//       print(ex.toString());
//     }
//   }
//
//   Future<void> removeFromCart(ProductModel product) async {
//     try {
//       items.assignAll(await _cartRepository.removeFromCart(
//           product.sId!, userId)); // Replace userId with actual user id
//       sortAndLoad();
//     } catch (ex) {
//       // Handle error
//       print(ex.toString());
//     }
//   }
//
//   bool cartContains(ProductModel product) {
//     final foundItem =
//         items.where((item) => item.product!.sId! == product.sId!).toList();
//     return foundItem.isNotEmpty;
//   }
//
//   double cartTotal() {
//     return Calculations.cartTotal(items);
//   }
//
//   void clearCart() {
//     items.clear();
//   }
//
//   @override
//   void onClose() {
//     // Close or dispose resources, if needed
//     super.onClose();
//   }
// }
