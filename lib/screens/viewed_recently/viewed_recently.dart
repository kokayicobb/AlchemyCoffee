import 'package:alchemy_coffee_lab/screens/viewed_recently/viewed_widget.dart';
import 'package:alchemy_coffee_lab/services/utils.dart';
import 'package:alchemy_coffee_lab/widget/back_widget.dart';
import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../services/global_methods.dart';
import '../../widget/empty_screen.dart';
import '../orders/orders_widget.dart';

class ViewedRecently extends StatelessWidget {
  static const routeName = '/ViewedRecently';
  const ViewedRecently({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    // Size size = Utils(context).getScreenSize;
    bool _isEmpty = true;
    if (_isEmpty == true) {
      return const EmptyScreen(
        buttonText: 'Shop now',
        imagePath: 'assets/images/emptyCart.png',
        title: 'Your history is empty',
        subtitle: 'No products have been viewed yet',
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
            text: 'History',
            color: color,
            textSize: 22,
            isTitle: true,
          ),
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialog(
                    title: "Delete your history?",
                    subtitle: 'Are you sure',
                    function: () {},
                    context: context);
              },
              icon: Icon(IconlyBroken.delete, color: color),
              color: color,
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ViewedRecentlyWidget(),
                ))),
      );
    }
  }
}
