import 'package:dio/dio.dart';
import 'package:kelontong_app/features/home/models/add_product.dart';

class ProductService {
  static final Dio dio = Dio();

  Future<void> addProduct(AddProductModel product) async {
    
    try {
      final response = await dio.post(
        "https://crudcrud.com/api/f5daa848df3f4144b1b65776a4e9b6d6/products",
        data: product.toJson(),
      );

      if (response.statusCode == 201) {
        print('Product added successfully');
      } else {
        print('Failed to add product. Status Code: ${response.statusCode}');
        print('Response: ${response.data}');
      }
    } catch (e) {
      print('Errorr: $e');
      throw Exception('Error adding product: $e');
    }
  }
}
