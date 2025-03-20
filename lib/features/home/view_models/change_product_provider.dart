import 'package:flutter/material.dart';
import 'package:kelontong_app/features/home/models/change_product.dart';
import 'package:kelontong_app/features/home/services/change_product_sevices.dart';
import 'package:kelontong_app/features/home/view_models/search_provider.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';
import 'package:provider/provider.dart';

class ChangeProductProvider with ChangeNotifier {
  TextEditingController categoryIdController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController skuController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  Future<void> editProduct(
    String id,
    ChangeProductModel updatedProduct,
    BuildContext context,
  ) async {
    try {
      final response = await EditProductService().updateProduct(
        id,
        updatedProduct,
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await Provider.of<SearchProvider>(
            context,
            listen: false,
          ).fetchProducts();
        });
        notifyListeners();
      } else {
        throw Exception(
          "Failed to update product: Status ${response.statusCode}",
        );
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error updating product: $e");
    }
  }

  void clearForm() {
    nameController.clear();
    skuController.clear();
    categoryNameController.clear();
    priceController.clear();
    descriptionController.clear();
    weightController.clear();
    widthController.clear();
    heightController.clear();
    lengthController.clear();
    imageController.clear();
    categoryIdController.clear();
  }

  void initializeControllers(AllProductsModels product) {
    categoryIdController.text = product.categoryId.toString();
    nameController.text = product.name!;
    skuController.text = product.sku!;
    categoryNameController.text = product.categoryName!;
    priceController.text = product.harga.toString();
    descriptionController.text = product.description!;
    weightController.text = product.weight.toString();
    widthController.text = product.width.toString();
    heightController.text = product.height.toString();
    lengthController.text = product.length.toString();
    imageController.text = product.image!;
  }
}
