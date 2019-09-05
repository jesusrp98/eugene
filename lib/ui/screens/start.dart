import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:row_collection/row_collection.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../util/menu.dart';
import '../widgets/index.dart';

enum Change { toEuros, toPounds }

const List<String> symbols = ['€', '£'];
const List _changeRatios = [1.08, 0.93];

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  Change _change = Change.toEuros;
  num _input = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'CurrencyCrab',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'ProductSans',
            fontSize: 23,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (context) => Menu.home.keys
                .map((string) => PopupMenuItem(
                      value: string,
                      child: Text(FlutterI18n.translate(context, string)),
                    ))
                .toList(),
            onSelected: (text) => Navigator.pushNamed(context, Menu.home[text]),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  symbols[_change == Change.toEuros ? 0 : 1],
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                Separator.spacer(space: 8),
                Text(
                  (_input * _changeRatios[_change == Change.toEuros ? 0 : 1])
                      .toStringAsFixed(2),
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            color: Colors.white12,
            backdropEnabled: true,
            minHeight: 115,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            panel: RowLayout(
              children: <Widget>[
                HandlerBar(),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 14),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.white,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 32,
                          ),
                          onChanged: (value) => setState(
                            () => _input = double.parse(value),
                          ),
                          decoration: InputDecoration(
                            labelText:
                                symbols[_change == Change.toEuros ? 1 : 0],
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'RobotoMono',
                              fontSize: 32,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Separator.spacer(space: 12),
                      IconButton(
                        icon: Icon(Icons.cached),
                        iconSize: 50,
                        color: Colors.white70,
                        onPressed: () => setState(
                          () => _change = _change == Change.toEuros
                              ? _change = Change.toPounds
                              : Change.toEuros,
                        ),
                        tooltip: 'Swap currencies',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
