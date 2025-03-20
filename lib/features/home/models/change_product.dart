class ChangeProductModel {
  String? name;
  String? sku;
  String? categoryName;
  int? categoryId;
  String? description;
  int? weight;
  int? width;
  int? height;
  int? length;
  String? image;
  int? harga;

  ChangeProductModel({
    this.name,
    this.sku,
    this.categoryName,
    this.categoryId,
    this.description,
    this.weight,
    this.width,
    this.height,
    this.length,
    this.image,
    this.harga,
  });

  // Convert to map for API submission
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sku': sku,
      'categoryName': categoryName,
      'categoryId': categoryId,
      'description': description,
      'weight': weight,
      'width': width,
      'height': height,
      'length': length,
      'image': image,
      'harga': harga,
    };
  }
}
