import 'package:dio/dio.dart';
import 'package:kelontong_app/core/helpers/api_documentations.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';

class GetProductsService {
  static final Dio _dio = Dio();

  Future<List<AllProductsModels>> getProducts() async {
    try {
      final response = await _dio.get(ApiDocumentations.allProducts);

      return (response.data as List)
          .map((item) => AllProductsModels.fromMap(item))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
