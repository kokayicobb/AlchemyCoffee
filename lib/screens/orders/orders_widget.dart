import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../inner_screens/product_details.dart';
import '../../services/global_methods.dart';
import '../../services/utils.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text('Paid \$1.49'),
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: ProductDetails.routeName);
      },
      leading: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: FancyShimmerImage(
          imageUrl:
              'https://media.istockphoto.com/id/1276830740/photo/black-coffee-served-in-a-transparent-glass-cup-with-coffee-beans-around.jpg?s=612x612&w=0&k=20&c=x-PDUWhmmK88LybJvrTWd2xRR1BfrNHPYX9hEzlGUvE=',
          boxFit: BoxFit.fill,
          width: size.width * .2,
        ),
      ),
      title: TextWidget(
        text: "Title  x1",
        color: color,
        textSize: 18,
      ),
      trailing: TextWidget(
        text: "12/17/2022",
        color: color,
        textSize: 18,
      ),
    );
  }
}
