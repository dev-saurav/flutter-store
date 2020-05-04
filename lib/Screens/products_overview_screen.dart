import 'package:flutter/material.dart';
import 'package:max_store_app/Screens/Cart_screen.dart';
import 'package:max_store_app/Widgets/app_drawer.dart';
import 'package:max_store_app/providers/Cart.dart';
import 'package:provider/provider.dart';
import '../Widgets/products_grid.dart';
import '../providers/products.dart';
import '../Widgets/badge.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                setState(() {
                  _showOnlyFav = true;
                });
              } else {
                setState(() {
                  _showOnlyFav = false;
                });
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString(),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFav),
    );
  }
}
