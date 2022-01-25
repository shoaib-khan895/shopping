import 'package:flutter/material.dart';

import '../model/ProductModel.dart';

class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter1;

  ProductScreen(this._valueSetter1);

  List<ProductModel> productsList1 = [
    ProductModel("phone", 3000),
    ProductModel("TV", 5000),
    ProductModel("Speaker", 2250),
    ProductModel("Mobile", 5550),
    ProductModel("keyboard", 300),
  ];
  List<ProductModel> productsList2 = [
    ProductModel("Shirt", 300),
    ProductModel("pant", 500),
    ProductModel("Jeans", 750),
    ProductModel("Jacket", 1100),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Electronics',
          style: DefaultTextStyle.of(context)
              .style
              .apply(fontSizeFactor: 2.0, color: Colors.blue),
        ),
        Expanded(
          flex: 1,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(productsList1[index].name),
                  trailing: Text(
                    "Rs.${productsList1[index].price}",
                    style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    _valueSetter1(productsList1[index]);
                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(const Duration(microseconds: 1000000),
                              () {
                            Navigator.of(context).pop(true);
                          });
                          return AlertDialog(
                            title: Text(
                                '${productsList1[index].name} Is Added To Cart'),
                          );
                        });
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: productsList1.length),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'clothes',
          style: DefaultTextStyle.of(context)
              .style
              .apply(fontSizeFactor: 2.0, color: Colors.purple),
        ),
        Expanded(
          flex: 1,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(productsList2[index].name),
                trailing: Text(
                  "Rs.${productsList2[index].price}",
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  _valueSetter1(productsList2[index]);
                  showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(const Duration(microseconds: 1000000),
                            () {
                          Navigator.of(context).pop(true);
                        });
                        return AlertDialog(
                          title: Text(
                              '${productsList2[index].name} Is Added To Cart'),
                        );
                      });
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: productsList2.length,
          ),
        )
      ],
    );
  }
}
