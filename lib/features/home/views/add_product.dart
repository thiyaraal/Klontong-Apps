import 'package:flutter/material.dart';
import 'package:kelontong_app/features/home/view_models/add_product_provider.dart';
import 'package:provider/provider.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final addProv = Provider.of<AddProductProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Add Product', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              TextField(
                controller: addProv.idController,
                decoration: InputDecoration(labelText: ' ID'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: addProv.categoryIdController,
                decoration: InputDecoration(labelText: 'Category ID'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: addProv.categoryNameController,
                decoration: InputDecoration(labelText: 'Category Name'),
              ),
              TextField(
                controller: addProv.skuController,
                decoration: InputDecoration(labelText: 'SKU'),
              ),
              TextField(
                controller: addProv.nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: addProv.descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: addProv.weightController,
                decoration: InputDecoration(labelText: 'Weight'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: addProv.widthController,
                decoration: InputDecoration(labelText: 'Width'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: addProv.heightController,
                decoration: InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
              ),

              TextField(
                controller: addProv.lengthController,
                decoration: InputDecoration(labelText: 'Length'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: addProv.imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextField(
                controller: addProv.priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              addProv.isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () {
                      addProv.addProduct(context);
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
