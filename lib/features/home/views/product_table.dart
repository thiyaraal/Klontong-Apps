import 'package:flutter/material.dart';
import 'package:kelontong_app/features/home/view_models/search_provider.dart';
import 'package:kelontong_app/features/home/views/add_product.dart';
import 'package:kelontong_app/features/home/views/product_data.dart';
import 'package:provider/provider.dart';

class ProductTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (query) {
              Provider.of<ProductProvider>(
                context,
                listen: false,
              ).searchProducts(query);
            },
            decoration: InputDecoration(
              labelText: 'Search by product name, SKU, or ID',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddProductForm(onSubmit: (AllProductsModels ) {  },
                  
                );
              },
            );
          },
          child: Text('Add Product'),
        ),
        const SizedBox(height: 10),

        Expanded(
          child: Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              int rowsPerPage =
                  productProvider.products.length > 5
                      ? 5
                      : productProvider.products.length;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: PaginatedDataTable(
                  header: Text("Product List"),
                  columns: [
                    DataColumn(label: Text("Product Name")),
                    DataColumn(label: Text("Category")),
                    DataColumn(label: Text("SKU")),
                    DataColumn(label: Text("ID")),
                  ],
                  source: ProductDataSource(productProvider.products, context),
                  rowsPerPage: rowsPerPage,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
