import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/components/product_item.dart';
import 'package:flutter_shopping_app/pages/product_detail_page.dart';
import 'package:flutter_shopping_app/utils/global_variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
    );
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Shoes\nCollection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Expanded(
                child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: border,
                focusedBorder: border,
                enabledBorder: border,
              ),
            ))
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : Colors.blue.withOpacity(0.1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      label: Text(
                        filter,
                      ),
                      labelStyle: const TextStyle(fontSize: 16),
                      side: BorderSide(color: Colors.blue.withOpacity(0.1)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                );
              }),
        ),
        Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: item)));
                    },
                    child: ProductItem(
                      title: item['title'] as String,
                      price: item['price'] as double,
                      imageUrl: item['imageUrl'] as String,
                      backgroundColor: index.isEven
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.1),
                    ),
                  );
                }))
      ],
    )));
  }
}
