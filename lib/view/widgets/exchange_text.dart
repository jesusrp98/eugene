import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

class ExchangeText extends StatelessWidget {
  final String currency;
  final String value;

  const ExchangeText({
    Key key,
    this.currency,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          currency,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Separator.spacer(space: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
