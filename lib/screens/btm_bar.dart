import 'package:alchemy_coffee_lab/screens/cart/cart_screen.dart';
import 'package:alchemy_coffee_lab/screens/catergories.dart';
import 'package:alchemy_coffee_lab/screens/home.dart';
import 'package:alchemy_coffee_lab/screens/user.dart';
import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../Provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomePage(), 'title': "Home"},
    {'page': CategoriesScreen(), 'title': "Categories"},
    {'page': const CartScreen(), 'title': "Cart "},
    {'page': const UserScreen(), 'title': "User "},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          unselectedItemColor: _isDark ? Colors.blue.shade800 : Colors.blueGrey,
          selectedItemColor:
              _isDark ? Colors.lightBlue.shade200 : Colors.brown.shade400,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Badge(
                toAnimate: true,
                shape: BadgeShape.circle,
                badgeColor: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                position: BadgePosition.topEnd(top: -7, end: -7),
                badgeContent: FittedBox(
                  child: TextWidget(
                    text: '1',
                    color: Colors.white,
                    textSize: 15,
                  ),
                ),
                child: Icon(
                    _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
              label: 'User',
            ),
          ]),
    );
  }
}
