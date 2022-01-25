import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  var cart;
  var sum;

  CheckoutScreen(this.cart, this.sum);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  num newSum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.cart[index].name),
              trailing: Text(
                "Rs.${widget.cart[index].price}",
                style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                setState(() {
                  widget.cart.removeWhere(
                      (item) => item.name == widget.cart[index].name);
                  newSum = 0;
                  for (var item in widget.cart) {
                    newSum = newSum + item.price;
                  }
                });
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: widget.cart.length,
          shrinkWrap: true,
        ),
        Divider(),
        Divider(),
        widget.cart.length == 0
            ? const Text("Total :Rs. 0")
            : newSum == 0
                ? Text("Total :Rs.${widget.sum}")
                : Text("Total :Rs.$newSum"),
      ],
    );
  }
}
