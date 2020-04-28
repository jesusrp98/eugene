import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final String currency;
  final void Function(String) onChange;
  final void Function() onSwap;

  const CurrencyBox({
    Key key,
    this.currency,
    this.onChange,
    this.onSwap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 34,
      ),
      onChanged: onChange,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: currency,
        labelStyle: TextStyle(
          fontFamily: 'RobotoMono',
          color: Theme.of(context).textTheme.headline6.color,
          fontSize: 34,
        ),
        contentPadding: EdgeInsets.all(10),
        suffixIcon: IconButton(
          icon: Icon(Icons.cached),
          iconSize: 44,
          color: Theme.of(context).textTheme.headline6.color,
          onPressed: onSwap,
          tooltip: 'Swap currencies',
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
          ),
        ),
      ),
    );
  }
}
