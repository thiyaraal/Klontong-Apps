import 'package:flutter/material.dart';
import 'package:kelontong_app/features/products/models/all_products_model.dart';
import 'package:kelontong_app/features/products/views/detail_products.dart';

class ProductDataSource extends DataTableSource {
  final List<AllProductsModels> products;
  final BuildContext context;

  ProductDataSource(this.products, this.context);

  @override
  DataRow getRow(int index) {
    final product = products[index];
    return DataRow(
      cells: [
        DataCell(Text(product.name ?? 'Unknown Product')),
        DataCell(Text(product.categoryName.toString().split('.').last)),
        DataCell(Text(product.sku ?? 'N/A')),
        DataCell(Text(product.id.toString())),
      ],

      onLongPress:
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: product),
            ),
          ),
    );
  }

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;

  @override
  bool get isRowCountApproximate => false;
}
