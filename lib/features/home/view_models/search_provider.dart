import 'package:flutter/material.dart';
import 'package:kelontong_app/features/home/services/add_product_services.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';
import 'package:kelontong_app/features/products/services/get_products_service.dart';

class SearchProvider with ChangeNotifier {
  List<AllProductsModels> _products = [];
  List<AllProductsModels> _filteredProducts = [];
  String _searchQuery = '';

  List<AllProductsModels> get products => _filteredProducts;
  String get searchQuery => _searchQuery;

final GetProductsService _productService = GetProductsService();


  Future<void> fetchProducts() async {
    try {
      final products = await _productService.getProducts();
      _products = products;
      _filteredProducts = products;
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  void setProducts(List<AllProductsModels> products) {
    _products = products;
    _filteredProducts = products;
    notifyListeners();
  }

  void searchProducts(String query) {
    _searchQuery = query;
    _filteredProducts =
        _products
            .where(
              (product) =>
                  product.name!.toLowerCase().contains(query.toLowerCase()) ||
                  product.sku!.toLowerCase().contains(query.toLowerCase()) ||
                  product.categoryName
                      .toString()
                      .split('.')
                      .last
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  product.id.toString().contains(query),
            )
            .toList();
    notifyListeners();
  }

  void clearSearch() {
    _filteredProducts = _products;
    _searchQuery = '';
    notifyListeners();
  }
}
