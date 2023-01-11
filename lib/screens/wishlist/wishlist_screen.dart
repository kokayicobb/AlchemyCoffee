import 'package:alchemy_coffee_lab/screens/wishlist/wishlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../widget/back_widget.dart';
import '../../widget/empty_screen.dart';
import '../../widget/text_widget.dart';
import '../cart/cart_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishListScreen';
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    bool _isEmpty = true;
    if (_isEmpty == true) {
      return const EmptyScreen(
        buttonText: 'Shop now',
        imagePath: 'assets/images/emptyCart.png',
        title: 'Your wishlist is empty',
        subtitle: 'Add products to your wishlist',
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: const BackWidget(),
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: TextWidget(
              text: 'Wishlist (2)',
              color: color,
              textSize: 22,
              isTitle: true,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  GlobalMethods.warningDialog(
                      title: "Empty your wishlist?",
                      subtitle: 'Are you sure',
                      function: () {},
                      context: context);
                },
                icon: Icon(IconlyBroken.delete, color: color),
                color: color,
              )
            ],
          ),
          body: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return const WishlistWidget();
            },
          ));
    }
  }
}
