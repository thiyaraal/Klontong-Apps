import 'package:flutter/material.dart';
import 'package:kelontong_app/features/home/view_models/search_provider.dart';
import 'package:kelontong_app/features/home/views/product_table.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';
import 'package:kelontong_app/features/products/services/get_products_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<AllProductsModels>> _products;

  @override
  void initState() {
    super.initState();
    // Fetch products after the first frame is built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text('Kelontong App')),
      body: FutureBuilder<List<AllProductsModels>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found.'));
          }

          final products = snapshot.data!;
          Provider.of<ProductProvider>(
            context,
            listen: false,
          ).setProducts(products);

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ProductTable(),
          );
        },
      ),
    );
  }
}
