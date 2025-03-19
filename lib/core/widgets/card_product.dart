import 'package:flutter/material.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart'
    show AllProductsModels;

class ProductTile extends StatelessWidget {
  final AllProductsModels product;
  final void Function() onTap;

  const ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          leading:
              product.image != null
                  ? Image.network(
                    product.image!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                  : Icon(Icons.image),
          title: Text(product.name ?? 'Unknown Product'),
          subtitle: Text(product.description ?? 'No description available'),
          trailing: Text('Rp ${product.harga ?? 0}'),
        ),
      ),
    );
  }
}
