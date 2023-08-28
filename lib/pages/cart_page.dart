import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: cart.length == 0
            ? Center(
                child: Text(
                  'Cart is empty!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (contex, index) {
                  final cartItem = cart[index];
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage(cartItem['imageUrl'] as String),
                        ),
                        title: Text(
                          cartItem['title'].toString(),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text('Size: ${cartItem['sizes'].toString()}'),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Delete Product',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      content: const Text(
                                        'Are you sure you want to remove the product from your cart?',
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .removeFromCart(cartItem);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))),
                  );
                }));
  }
}
