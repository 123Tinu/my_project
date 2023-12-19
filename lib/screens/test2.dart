import 'package:flutter/material.dart';
import 'package:my_project/screens/test1.dart';

class CartDetails extends StatelessWidget {
  final List<CartItem> cartItems;

  CartDetails(this.cartItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Details'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].product.name),
            subtitle: Text('Quantity: ${cartItems[index].quantity}'),
          );
        },
      ),
    );
  }
}
