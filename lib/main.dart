import 'package:flutter/material.dart';
import 'package:shopping/screens/CheckoutScreen.dart';

import 'model/ProductModel.dart';
import 'screens/ProductListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shopping',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: CartApp());
  }
}

class CartApp extends StatefulWidget {
  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<ProductModel> cart = [];
  num sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Checkout",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct) {
              setState(() {
                cart.add(selectedProduct);

                ///======
                sum = 0;
                for (var item in cart) {
                  sum = sum + item.price;
                }
              });
            }),
            CheckoutScreen(cart, sum),
          ],
        ),
      ),
    );
  }
}
