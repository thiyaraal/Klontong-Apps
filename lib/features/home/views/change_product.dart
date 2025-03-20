import 'package:flutter/material.dart';
import 'package:kelontong_app/features/home/models/change_product.dart';
import 'package:kelontong_app/features/home/view_models/change_product_provider.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';
import 'package:provider/provider.dart';

class EditProductPage extends StatefulWidget {
  final AllProductsModels product;

  const EditProductPage({super.key, required this.product});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late ChangeProductProvider editProvider;

  @override
  void initState() {
    super.initState();
    editProvider = Provider.of<ChangeProductProvider>(context, listen: false);

    editProvider.nameController.text = widget.product.name!;
    editProvider.skuController.text = widget.product.sku!;
    editProvider.categoryNameController.text = widget.product.categoryName!;
    editProvider.priceController.text = widget.product.harga.toString();
    editProvider.descriptionController.text = widget.product.description!;
    editProvider.weightController.text = widget.product.weight.toString();
    editProvider.widthController.text = widget.product.width.toString();
    editProvider.heightController.text = widget.product.height.toString();
    editProvider.lengthController.text = widget.product.length.toString();
    editProvider.imageController.text = widget.product.image!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: editProvider.categoryIdController,
                decoration: InputDecoration(labelText: 'Category ID'),
              ),
              TextField(
                controller: editProvider.nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: editProvider.skuController,
                decoration: InputDecoration(labelText: 'SKU'),
              ),
              TextField(
                controller: editProvider.categoryNameController,
                decoration: InputDecoration(labelText: 'Category Name'),
              ),
              TextField(
                controller: editProvider.priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: editProvider.descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: editProvider.weightController,
                decoration: InputDecoration(labelText: 'Weight'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: editProvider.widthController,
                decoration: InputDecoration(labelText: 'Width'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: editProvider.heightController,
                decoration: InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: editProvider.lengthController,
                decoration: InputDecoration(labelText: 'Length'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: editProvider.imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
             ElevatedButton(
  onPressed: () async {
    final updatedProduct = ChangeProductModel(
      categoryId: int.tryParse(editProvider.categoryIdController.text) ?? 0,
      name: editProvider.nameController.text,
      sku: editProvider.skuController.text,
      categoryName: editProvider.categoryNameController.text,
      harga: int.tryParse(editProvider.priceController.text) ?? 0,
      description: editProvider.descriptionController.text,
      weight: int.tryParse(editProvider.weightController.text) ?? 0,
      width: int.tryParse(editProvider.widthController.text) ?? 0,
      height: int.tryParse(editProvider.heightController.text) ?? 0,
      length: int.tryParse(editProvider.lengthController.text) ?? 0,
      image: editProvider.imageController.text,
    );

    
    await editProvider.editProduct(widget.product.id!, updatedProduct, context);
    
    
    if (mounted) {
      Navigator.pop(context);
    }
  },
  child: Text('Update Product'),
)

            ],
          ),
        ),
      ),
    );
  }
}
