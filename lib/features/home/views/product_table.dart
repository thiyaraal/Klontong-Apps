import 'package:flutter/material.dart';
import 'package:kelontong_app/features/home/view_models/search_provider.dart';
import 'package:kelontong_app/features/home/views/add_product.dart';
import 'package:kelontong_app/features/home/views/product_data.dart';
import 'package:provider/provider.dart';

class ProductTable extends StatelessWidget {
  const ProductTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (query) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<SearchProvider>(
                  context,
                  listen: false,
                ).searchProducts(query);
              });
            },
            decoration: InputDecoration(
              labelText: 'Search by product name, SKU, or ID',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductForm()),
              );
            },
            child: Text('Add Product'),
          ),
        ),
        const SizedBox(height: 10),

        Expanded(
          child: Consumer<SearchProvider>(
            builder: (context, productProvider, child) {
              int rowsPerPage =
                  productProvider.products.length > 5
                      ? 5
                      : productProvider.products.length;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:
                    productProvider.products.isEmpty
                        ? Center(child: Text('No products found.'))
                        : PaginatedDataTable(
                          header: Text("Product List"),
                          columns: [
                            DataColumn(label: Text("Action")),
                            DataColumn(label: Text("Category ID")),
                            DataColumn(label: Text("Category Name")),
                            DataColumn(label: Text("SKU")),
                            DataColumn(label: Text("Product Name")),
                            DataColumn(label: Text("Price")),
                          ],
                          source: ProductDataSource(
                            productProvider.products,
                            context,
                          ),
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
