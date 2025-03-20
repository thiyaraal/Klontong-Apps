// import 'package:flutter/material.dart';

// import 'package:kelontong_app/features/products/models/all_products_model.dart';
// import 'package:kelontong_app/features/products/services/get_products_service.dart';

// class ProductProvider with ChangeNotifier {
//   List<AllProductsModels> _products = [];

//   List<AllProductsModels> get products => _products;

//   final GetProductsService _productService = GetProductsService();

//   Future<void> fetchProducts() async {
//     try {
//       final products = await _productService.getProducts();
//       _products = products;

//       notifyListeners();
//     } catch (e) {
//       throw Exception('Failed to load products: $e');
//     }
//   }

//   void addProduct(AllProductsModels product) {
//     _products.add(product);
//     notifyListeners();
//   }
// }
