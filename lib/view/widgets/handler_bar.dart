import 'package:flutter/material.dart';

class HandlerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Icon(
        Icons.keyboard_arrow_up,
        size: 30,
      ),
    );
  }
}
