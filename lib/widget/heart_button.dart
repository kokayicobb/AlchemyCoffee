import 'package:alchemy_coffee_lab/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return GestureDetector(
                                  onTap: () {
                                    print('Heart button is pressed');
                                  },
                                  child: Icon(
                                    IconlyLight.heart,
                                    size: 22,
                                    color: color,
                                  ),
                                );
  }
}