import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/google2.png',
              width: 40,
            ),
          ),
          const SizedBox(width: 8),
          TextWidget(
            text: 'Sign in with Google',
            color: Colors.white,
            textSize: 18,
          ),
        ],
      ),
    );
  }
}
