import 'package:flutter/material.dart';
import 'package:my_market/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        HomeTab()
      ],
    );
  }
}