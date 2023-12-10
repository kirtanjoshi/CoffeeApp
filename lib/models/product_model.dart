// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? status;
  List<Datum>? data;
  String? message;

  ProductModel({
    this.status,
    this.data,
    this.message,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  String? id;
  String? title;
  String? description;
  double? price;
  List<String>? image;
  DateTime? updatedOn;
  DateTime? createdOn;
  int? v;

  Datum({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
    this.updatedOn,
    this.createdOn,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        updatedOn: json["updatedOn"] == null
            ? null
            : DateTime.parse(json["updatedOn"]),
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "price": price,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "updatedOn": updatedOn?.toIso8601String(),
        "createdOn": createdOn?.toIso8601String(),
        "__v": v,
      };
}
