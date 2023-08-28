import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/pages/home_page.dart';
import 'package:flutter_shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
          title: 'Shopping App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            fontFamily: 'Lato',
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
            textTheme: const TextTheme(
                titleLarge:
                    TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                titleMedium:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                titleSmall:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            ),
            cardTheme: const CardTheme(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                color: Colors.white),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
