import 'package:coffee_app/models/product_model.dart';

class CartItemModel {
  Datum? datum;
  int? quantity;
  String? sId;

  CartItemModel({this.quantity, this.sId, this.datum});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    datum = Datum.fromJson(json["product"]);
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson({bool objectMode = false}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = (objectMode == false) ? datum!.id : datum!.toJson();
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}

// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromJson(jsonString);
// import 'dart:convert';
//
// import 'package:coffee_app/models/product_model.dart';
//
// CartItemModel cartItemModelFromJson(String str) =>
//     CartItemModel.fromJson(json.decode(str));
//
// String cartItemModelToJson(CartItemModel data) => json.encode(data.toJson());
//
// class CartItemModel {
//   Datum? product;
//   int? quantity;
//   String? id;
//
//   CartItemModel({
//     this.quantity,
//     this.id,
//     required Datum product,
//   });
//
//   factory CartItemModel.fromJson(Map<String, dynamic> json) {
//     return CartItemModel(
//       product: Datum.fromJson(json["product"]),
//       quantity: json["quantity"],
//       id: json["_id"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "product": product!.toJson(), // Assuming toJson is implemented in Datum
//         "quantity": quantity,
//         "_id": id,
//       };
// }
