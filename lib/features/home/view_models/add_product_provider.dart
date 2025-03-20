import 'package:flutter/material.dart';
import 'package:kelontong_app/features/home/models/add_product.dart';
import 'package:kelontong_app/features/home/services/add_product_services.dart';
import 'package:kelontong_app/features/home/view_models/product_provider.dart';
import 'package:kelontong_app/features/home/view_models/search_provider.dart';
import 'package:provider/provider.dart';

class AddProductProvider extends ChangeNotifier {
  bool isLoading = false;

  TextEditingController idController = TextEditingController();

  TextEditingController categoryIdController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController skuController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final ProductService productService = ProductService();

  Future<void> addProduct(BuildContext context) async {
    setLoading(true);

    try {
      print('ID: ${idController.text}');

      print('Category ID: ${categoryIdController.text}');
      print('Product Name: ${nameController.text}');
      print('SKU: ${skuController.text}');
      print('Price: ${priceController.text}');
      print('Description: ${descriptionController.text}');
      print('Weight: ${weightController.text}');
      print('Width: ${widthController.text}');
      print('Height: ${heightController.text}');
      print('Length: ${lengthController.text}');
      print('Image: ${imageController.text}');
      print('Category Name: ${categoryNameController.text}');

      final product = AddProductModel(
        id: int.parse(idController.text),
        categoryId: int.parse(categoryIdController.text),
        sku: skuController.text,
        name: nameController.text,
        description: descriptionController.text,
        weight: int.parse(weightController.text),
        width: int.parse(widthController.text),
        categoryName: categoryNameController.text,
        length: int.parse(lengthController.text),
        height: int.parse(heightController.text),
        image: imageController.text,
        harga: int.parse(priceController.text),
      );

      await productService.addProduct(product);

      Provider.of<SearchProvider>(context, listen: false).fetchProducts();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product added successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      clearFields();
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          duration: Duration(seconds: 2),
        ),
      );
    } finally {
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void clearFields() {
    idController.clear();
    categoryIdController.clear();
    skuController.clear();
    nameController.clear();
    descriptionController.clear();
    weightController.clear();
    widthController.clear();
    heightController.clear();
    imageController.clear();
    lengthController.clear();
    priceController.clear();

    notifyListeners();
  }
}
