class AddProductModel {
  int id;
  int categoryId;
  String categoryName;
  String sku;
  String name;
  String description;
  int weight;
  int width;
  int length;
  int height;
  String image;
  int harga;

  AddProductModel({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    required this.image,
    required this.harga,
  });

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'CategoryId': categoryId,
      'categoryName': categoryName,
      'sku': sku,
      'name': name,
      'description': description,
      'weight': weight,
      'width': width,
      'length': length,
      'height': height,
      'image': image,
      'harga': harga,
    };
  }
}
