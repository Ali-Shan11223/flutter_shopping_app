import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/utils/global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (contex, index) {
              final cartItem = cart[index];
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text('Size: ${cartItem['sizes'].toString()}'),
                  trailing: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            }));
  }
}
