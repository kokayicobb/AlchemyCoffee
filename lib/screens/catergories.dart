import 'package:alchemy_coffee_lab/services/utils.dart';
import 'package:alchemy_coffee_lab/widget/categories_widget.dart';
import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  List<Color> gridColors = [
    Color.fromARGB(255, 238, 155, 124),
    Color.fromARGB(255, 238, 155, 124),
    Color.fromARGB(255, 238, 155, 124),
    Colors.red,
    Colors.red,
    Colors.red,
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/coffee_bag.jpeg',
      'catText': 'Whole Sale',
    },
    {
      'imgPath': 'assets/images/coffee5.jpeg',
      'catText': 'Fresh Coffee',
    },
    {
      'imgPath': 'assets/images/latte.jpeg',
      'catText': 'Latte',
    },
    {
      'imgPath': 'assets/images/comingSoon.png',
      'catText': 'Cold Brew',
    },
    {
      'imgPath': 'assets/images/comingSoon.png',
      'catText': 'Espresso',
    },
    {
      'imgPath': 'assets/images/comingSoon.png',
      'catText': 'Americano',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
            isTitle: true,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10, // Vertical spacing
          mainAxisSpacing: 10, // Horizontal spacing
          children: List.generate(6, (index) {
            return CategoriesWidget(
              catText: catInfo[index]['catText'],
              imgPath: catInfo[index]['imgPath'],
              passedColor: gridColors[index],
            );
          }),
        ),
      ),
    );
  }
}
