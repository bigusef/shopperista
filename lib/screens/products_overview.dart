import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopperista/models/cart.dart';
import 'package:shopperista/screens/cart.dart';
import 'package:shopperista/widgets/badge.dart';
import 'package:shopperista/widgets/products_grid.dart';

enum FilterOptions {
  favorit,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  static const String routeName = '/products-overview';

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavorit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopperista'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => <PopupMenuItem>[
              PopupMenuItem(
                child: Text('Only Favorit'),
                value: FilterOptions.favorit,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.all,
              ),
            ],
            onSelected: (selectedIndex) {
              if (selectedIndex == FilterOptions.favorit) {
                setState(() => _showFavorit = true);
              } else {
                setState(() => _showFavorit = false);
              }
            },
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () => Navigator.of(context).pushNamed(
                CartScreen.routeName,
              ),
            ),
          )
        ],
      ),
      body: ProductGrid(_showFavorit),
    );
  }
}
