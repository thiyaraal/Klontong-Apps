import 'package:flutter/material.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';

class AddProductForm extends StatefulWidget {
  final Function(AllProductsModels) onSubmit;

  const AddProductForm({super.key, required this.onSubmit});

  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _skuController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final _hargaController = TextEditingController();
  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Product'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _skuController,
                decoration: InputDecoration(labelText: 'SKU'),
              ),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextFormField(
                controller: _hargaController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'Product ID'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newProduct = AllProductsModels(
                      id: int.parse(_idController.text).toString(),

                      categoryId: 14,
                      categoryName: 'Snacks',
                      sku: _skuController.text,
                      name: _nameController.text,
                      description: _descriptionController.text,
                      image: _imageController.text,
                      harga: int.parse(_hargaController.text),
                      weight: 500,
                      width: 5,
                      length: 5,
                      height: 5,
                    );

                    widget.onSubmit(newProduct);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
