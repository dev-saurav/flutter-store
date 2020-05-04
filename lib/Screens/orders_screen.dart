import 'package:flutter/material.dart';
import 'package:max_store_app/Widgets/app_drawer.dart';
import 'package:max_store_app/Widgets/order_item.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.orders.length,
        itemBuilder: (ctx, index) => OrderItem(
          orders.orders[index],
        ),
      ),
    );
  }
}
