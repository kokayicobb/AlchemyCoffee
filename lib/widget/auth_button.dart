import 'package:alchemy_coffee_lab/widget/text_widget.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.ftx,
      required this.buttontext,
       this.primary = Colors.white38});
  final Function ftx;
  final String buttontext;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
        ),
        onPressed: () {
          ftx();
          //_submitFormOnLogin();
        },
        child: TextWidget(
          text: buttontext,
          color: Colors.white,
          textSize: 18,
        ),
      ),
    );
  }
}
