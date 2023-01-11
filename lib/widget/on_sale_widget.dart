import 'package:alchemy_coffee_lab/services/utils.dart';
import 'package:alchemy_coffee_lab/widget/heart_button.dart';
import 'package:alchemy_coffee_lab/widget/price_widget.dart';
import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../inner_screens/on_sale_screen.dart';
import '../inner_screens/product_details.dart';
import '../services/global_methods.dart';

class OnsaleWidget extends StatefulWidget {
  const OnsaleWidget({super.key});

  @override
  State<OnsaleWidget> createState() => _OnsaleWidgetState();
}

class _OnsaleWidgetState extends State<OnsaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.9),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {GlobalMethods.navigateTo(
                context: context, routeName: ProductDetails.routeName);},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                        imageUrl:
                            'https://media.istockphoto.com/id/1276830740/photo/black-coffee-served-in-a-transparent-glass-cup-with-coffee-beans-around.jpg?s=612x612&w=0&k=20&c=x-PDUWhmmK88LybJvrTWd2xRR1BfrNHPYX9hEzlGUvE=',
                        height: size.width * 0.22,
                        width: size.width * 0.22,
                        boxFit: BoxFit.fill),
                    Column(
                      children: [
                        TextWidget(
                          text: '1 cup',
                          color: color,
                          textSize: 19,
                          isTitle: true,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('cart button is pressed');
                              },
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            const HeartButton(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const PriceWidget(
                  salePrice: 1.49,
                  price: 2.49,
                  textPrice: '1',
                  isOnSale: true,
                ),
                const SizedBox(width: 5),
                TextWidget(
                  text: "Drip Coffee",
                  color: color,
                  textSize: 16,
                  isTitle: true,
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
