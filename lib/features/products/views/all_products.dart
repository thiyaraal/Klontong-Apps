import 'package:flutter/material.dart';
import 'package:kelontong_app/core/widgets/card_product.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';
import 'package:kelontong_app/features/products/services/get_products_service.dart';
import 'package:kelontong_app/features/products/views/detail_products.dart';

class AllProductsScreen extends StatefulWidget {
  @override
  _AllProductsScreenState createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  late Future<List<AllProductsModels>> _products;

  @override
  void initState() {
    super.initState();
    _products = GetProductsService().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text('All Products'),
      ),
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

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductTile(
                product: product,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
