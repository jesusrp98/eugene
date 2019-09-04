import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(MyApp());

enum Change { toEuros, toPounds }

const List<String> symbols = ['€', '£'];
const List _changeRatios = [1.08, 0.93];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CurrencyCrab',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Change _change = Change.toEuros;
  num _input = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'CurrencyCrab',
            style: TextStyle(
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (result) => null,
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'Ola',
                  child: Text('WIP'),
                ),
              ],
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24),
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
                  SizedBox(width: 8),
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
              minHeight: 130,
              collapsed: Padding(
                padding: const EdgeInsets.all(24),
                child: TextField(
                  cursorColor: Colors.white,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 50,
                  ),
                  onChanged: (String value) => setState(
                    () => _input = double.parse(value),
                  ),
                  decoration: InputDecoration(
                    labelText: symbols[_change == Change.toEuros ? 1 : 0],
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoMono',
                    ),
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              panel: Center(
                child: Text("This is the sliding Widget"),
              ),
            )
          ],
        )
        // body: Center(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: <Widget>[
        //       Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: <Widget>[
        //           Text(
        //             symbols[_change == Change.toEuros ? 0 : 1],
        //             style: TextStyle(
        //               fontFamily: 'RobotoMono',
        //               color: Colors.white,
        //               fontSize: 40,
        //             ),
        //           ),
        //           SizedBox(width: 8),
        //           Text(
        //             (_input * _changeRatios[_change == Change.toEuros ? 0 : 1])
        //                 .toStringAsFixed(2),
        //             style: TextStyle(
        //               fontFamily: 'ProductSans',
        //               color: Colors.white,
        //               fontSize: 64,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ],
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.cached),
        //         iconSize: 90,
        //         color: Colors.white70,
        //         onPressed: () => setState(() => _change =
        //             _change == Change.toEuros
        //                 ? _change = Change.toPounds
        //                 : Change.toEuros),
        //         tooltip: 'Swap currencies',
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 24),
        //         child: TextField(
        //           cursorColor: Colors.white,
        //           autofocus: true,
        //           textAlign: TextAlign.center,
        //           keyboardType: TextInputType.number,
        //           style: TextStyle(
        //             fontFamily: 'ProductSans',
        //             fontSize: 50,
        //           ),
        //           onChanged: (String value) => setState(
        //             () => _input = double.parse(value),
        //           ),
        //           decoration: InputDecoration(
        //             labelText: symbols[_change == Change.toEuros ? 1 : 0],
        //             labelStyle: TextStyle(
        //               color: Colors.white,
        //               fontFamily: 'RobotoMono',
        //             ),
        //             contentPadding: EdgeInsets.all(12),
        //             enabledBorder: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.white70, width: 2),
        //               borderRadius: BorderRadius.circular(12),
        //             ),
        //             focusedBorder: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.white, width: 2),
        //               borderRadius: BorderRadius.circular(12),
        //             ),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
