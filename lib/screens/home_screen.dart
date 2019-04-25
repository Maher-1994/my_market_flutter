import 'package:flutter/material.dart';
import 'package:my_market/tabs/home_tab.dart';
import 'package:my_market/tabs/products_tab.dart';
import 'package:my_market/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 70, 193, 190),
          ),
          body: ProductsTab(),
          drawer: CustomDrawer(_pageController),
        ),
        
      ],
    );
  }
}