import 'package:flutter/material.dart';
import 'package:shop_app/cart_page.dart';
import 'package:shop_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String selectedFilterList;

  int currentScreens = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is our entire [Home] screen
      body: IndexedStack(
        // this IndexStack make our another screens position maintained
        index: currentScreens,
        children: pages,
      ),
      // This is our [Bottom Navigation bar] screen
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentScreens = value;
          });
        },
        iconSize: 35,
        currentIndex: currentScreens,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
