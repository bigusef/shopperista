import 'package:flutter/material.dart';
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
          )
        ],
      ),
      body: ProductGrid(_showFavorit),
    );
  }
}
