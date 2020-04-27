import 'package:flutter/material.dart';

const kItemExtent = 18.0;

class CurrencyPicker extends StatelessWidget {
  final List<String> children;
  final int initialChild;
  final void Function(int) onSelectedItemChanged;

  const CurrencyPicker({
    Key key,
    @required this.children,
    this.initialChild = 0,
    @required this.onSelectedItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListWheelScrollView(
          physics: FixedExtentScrollPhysics(),
          // controller: ScrollController(
          //   initialScrollOffset: initialChild * kItemExtent,
          // ),
          diameterRatio: 1,
          itemExtent: kItemExtent,
          overAndUnderCenterOpacity: 0.32,
          onSelectedItemChanged: onSelectedItemChanged,
          useMagnifier: true,
          magnification: 1.2,
          children: [
            for (final entry in children)
              Text(
                entry,
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
