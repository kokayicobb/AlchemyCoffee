import 'package:alchemy_coffee_lab/screens/orders/orders_widget.dart';
import 'package:alchemy_coffee_lab/widget/back_widget.dart';
import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../../services/utils.dart';
import '../../widget/empty_screen.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/OrderScreen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    // Size size = Utils(context).getScreenSize;
    bool _isEmpty = true;
    if (_isEmpty == true) {
      return const EmptyScreen(
        buttonText: 'Shop now',
        imagePath: 'assets/images/emptyCart.png',
        title: 'You havent placed any orders yet',
        subtitle: 'would you like to order something now?',
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: const BackWidget(),
          elevation: 0,
          centerTitle: false,
          title: TextWidget(
            text: "Your orders",
            color: color,
            textSize: 24,
            isTitle: true,
          ),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.8),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: OrderWidget(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: color,
            );
          },
          itemCount: 10,
        ),
      );
    }
  }
}
