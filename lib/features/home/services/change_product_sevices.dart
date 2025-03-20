import 'package:dio/dio.dart';
import 'package:kelontong_app/core/helpers/api_documentations.dart';
import 'package:kelontong_app/features/home/models/change_product.dart';
class EditProductService { 
  static Dio _dio = Dio();

  
  Future<Response> updateProduct(String id, ChangeProductModel product) async {
    try {
      final response = await _dio.put(
        ApiDocumentations.productById(id),
        data: {
          'CategoryId': product.categoryId,
          'categoryName': product.categoryName,
          'sku': product.sku,
          'name': product.name,
          'description': product.description,
          'weight': product.weight,
          'width': product.width,
          'length': product.length,
          'height': product.height,
          'image': product.image,
          'harga': product.harga,
        },
      );
      return response;
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }
}