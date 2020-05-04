import 'package:flutter/material.dart';
import 'package:max_store_app/Screens/Cart_screen.dart';
import 'package:max_store_app/Screens/orders_screen.dart';
import 'package:max_store_app/providers/orders.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import 'package:max_store_app/Screens/product_detail_screen.dart';
import 'package:max_store_app/Screens/products_overview_screen.dart';
import 'providers/Cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
