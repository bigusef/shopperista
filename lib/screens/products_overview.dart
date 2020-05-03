import 'package:flutter/material.dart';
import 'package:shopperista/widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const String routeName = '/products-overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopperista'),
      ),
      body: ProductGrid(),
    );
  }
}
