import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopperista/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productID =
        ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productID);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: null,
    );
  }
}
