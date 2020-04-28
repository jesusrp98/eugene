import 'package:flutter/material.dart';

const _kItemExtent = 18.0;

class CurrencyPicker extends StatelessWidget {
  final List<String> children;
  final int initialItem;
  final void Function(int) onSelectedItemChanged;

  const CurrencyPicker({
    Key key,
    @required this.children,
    this.initialItem,
    @required this.onSelectedItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListWheelScrollView(
        physics: FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(initialItem: initialItem),
        diameterRatio: 1,
        itemExtent: _kItemExtent,
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
    );
  }
}
