// To parse this JSON data, do
//
//     final allProductsModels = allProductsModelsFromMap(jsonString);

import 'dart:convert';

List<AllProductsModels> allProductsModelsFromMap(String str) => List<AllProductsModels>.from(json.decode(str).map((x) => AllProductsModels.fromMap(x)));

String allProductsModelsToMap(List<AllProductsModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AllProductsModels {
    String? id;
    int? allProductsModelId;
    int? categoryId;
    String? categoryName;
    String? sku;
    String? name;
    String? description;
    int? weight;
    int? width;
    int? length;
    int? height;
    String? image;
    int? harga;

    AllProductsModels({
        this.id,
        this.allProductsModelId,
        this.categoryId,
        this.categoryName,
        this.sku,
        this.name,
        this.description,
        this.weight,
        this.width,
        this.length,
        this.height,
        this.image,
        this.harga,
    });

    factory AllProductsModels.fromMap(Map<String, dynamic> json) => AllProductsModels(
        id: json["_id"],
        allProductsModelId: json["id"],
        categoryId: json["CategoryId"],
        categoryName: json["categoryName"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        weight: json["weight"],
        width: json["width"],
        length: json["length"],
        height: json["height"],
        image: json["image"],
        harga: json["harga"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "id": allProductsModelId,
        "CategoryId": categoryId,
        "categoryName": categoryName,
        "sku": sku,
        "name": name,
        "description": description,
        "weight": weight,
        "width": width,
        "length": length,
        "height": height,
        "image": image,
        "harga": harga,
    };
}
