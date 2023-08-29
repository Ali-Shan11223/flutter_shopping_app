import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedSize = 0;

  void addToCart() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addToCart(
        {
          'id': widget.product['id']!,
          'title': widget.product['title']!,
          'price': widget.product['price']!,
          'imageUrl': widget.product['imageUrl']!,
          'company': widget.product['company']!,
          'sizes': selectedSize
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Product added successfully',
        style: TextStyle(color: Colors.white, fontSize: 18),
      )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a size.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Column(children: [
        Text(
          widget.product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            widget.product['imageUrl'] as String,
            height: 250,
            width: double.infinity,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              label: Text(size.toString()),
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(350, 50)),
                    onPressed: addToCart,
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
