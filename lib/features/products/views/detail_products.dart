import 'package:flutter/material.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';

class ProductDetailPage extends StatelessWidget {
  final AllProductsModels product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  "${product.categoryName.toString().split('.').last}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child:
                  product.image != null
                      ? Image.network(
                        product.image!,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                      : Icon(Icons.image_not_supported),
            ),
            SizedBox(height: 16),
      
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? 'Unknown Product',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
      
                Text(
                  'Category: ${product.categoryName.toString().split('.').last}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
      
                Text(
                  'SKU: ${product.sku ?? 'N/A'}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
      
                Text(
                  'ID: ${product.id?? 'N/A'}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
      
                Text(
                  product.description ?? 'No description available.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
      
                Text(
                  'Price: Rp ${product.harga ?? 0}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
