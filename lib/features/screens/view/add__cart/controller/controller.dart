// import 'package:coffee_app/data/services/cart_item_services/cart_item_services.dart';
// import 'package:coffee_app/features/screens/auth/controller/auth_contoller.dart';
// import 'package:coffee_app/models/cart_item_model.dart';
// import 'package:get/get.dart';
//
// class CartController extends GetxController {
//   final _cartRepository = CartServices();
//   final userController = Get.find<AuthController>();
//
//   RxList<CartItemModel> items = <CartItemModel>[].obs;
//
//   @override
//   void onInit() async {
//     try {
//       await _cartRepository.fetchCartForUser(userId);
//     } catch (e) {}
//     super.onInit();
//   }
// }
