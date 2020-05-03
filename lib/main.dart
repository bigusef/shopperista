import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopperista/providers/products.dart';
import 'package:shopperista/screens/product_detail.dart';
import 'package:shopperista/screens/products_overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato',
        ),
        initialRoute: ProductOverviewScreen.routeName,
        routes: {
          ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
