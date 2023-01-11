import 'package:alchemy_coffee_lab/Provider/dark_theme_provider.dart';
import 'package:alchemy_coffee_lab/services/global_methods.dart';
import 'package:alchemy_coffee_lab/services/utils.dart';
import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../consts/constss.dart';
import '../inner_screens/on_sale_screen.dart';
import '../widget/feed_items.dart';
import '../widget/on_sale_widget.dart';
import '../inner_screens/feeds_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Constss.offerImages[index],
                    fit: BoxFit.none,
                  );
                },
                autoplay: true,
                itemCount: Constss.offerImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.brown)),
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                  context: context,
                  routeName: OnSaleScreen.routeName,
                );
              },
              child: TextWidget(
                text: 'View all',
                color: Colors.blue,
                textSize: 20,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(children: [
                    TextWidget(
                      text: 'On Sale'.toUpperCase(),
                      color: Colors.red,
                      textSize: 22,
                      isTitle: true,
                    ),
                    const SizedBox(width: 5),
                    const Icon(IconlyLight.discount, color: Colors.red)
                  ]),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * .24,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const OnsaleWidget(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextWidget(
                      text: 'Our Products',
                      color: color,
                      textSize: 22,
                      isTitle: true),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                        context: context,
                        routeName: FeedsScreen.routeName,
                      );
                    },
                    child: TextWidget(
                      text: 'Browse all',
                      color: Colors.blue,
                      textSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(
                4,
                (index) => const FeedsWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
