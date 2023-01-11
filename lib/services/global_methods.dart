import 'package:flutter/material.dart';

import '../inner_screens/feeds_screen.dart';
import '../inner_screens/on_sale_screen.dart';
import '../inner_screens/product_details.dart';
import '../widget/text_widget.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function function,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // ignore: prefer_const_literals_to_create_immutables
          title: Row(children: [
            // Image.asset(
            //   'assets/coffee5.jpeg',
            //   height: 50,
            //   width: 50,
            //   fit: BoxFit.fill,
            // ),
            const SizedBox(width: 8),

             Text(title)
          ]),
          content:  Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                color: Colors.cyan,
                text: 'Cancel',
                textSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {
                function();
              },
              child: TextWidget(
                color: Colors.red,
                text: 'Okay',
                textSize: 18,
              ),
            )
          ],
        );
      },
    );
  }
}
