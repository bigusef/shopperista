import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopperista/models/product.dart';
import 'package:shopperista/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorit;

  ProductGrid(this.showFavorit);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavorit ? productsData.favoritItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}
