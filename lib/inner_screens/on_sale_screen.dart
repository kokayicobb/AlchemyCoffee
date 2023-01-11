import 'package:alchemy_coffee_lab/widget/on_sale_widget.dart';
import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';
import '../widget/back_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/OnSaleScreen';
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    bool _isEmpty = false;
    return Scaffold(
        appBar: AppBar(
          leading: const BackWidget(),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Coffee on sale',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: _isEmpty ? Center(child: Text('Nothing is on sale :(',
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontSize: 30, fontWeight:FontWeight.w700,),
        )) : GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.zero,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
          childAspectRatio: size.width / (size.height * 0.45),
          children: List.generate(
            16,
            (index) => const OnsaleWidget(),
          ),
        ));
  }
}
