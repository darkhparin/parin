import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String text;
  final Function onPressed;
  const TextLink(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Color.fromRGBO(49, 39, 79, .6)),
      ),
    );
  }
}
