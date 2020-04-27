import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_utils/keyboard_listener.dart';
import 'package:keyboard_utils/keyboard_utils.dart';
import 'package:row_collection/row_collection.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../blocs/currency/index.dart';
import '../../blocs/exchange/index.dart';
import '../widgets/index.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _panelController = PanelController();
  final _keyboardUtils = KeyboardUtils();

  @protected
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => _keyboardUtils.add(
        listener: KeyboardListener(
          willHideKeyboard: () {
            _panelController.animatePanelToPosition(0);
          },
          willShowKeyboard: (height) {
            _panelController.animatePanelToPosition(0.7);
          },
        ),
      ),
    );
  }

  void closeKeyboard() {
    if (MediaQuery.of(context).viewInsets.bottom != 0 &&
        (_panelController.panelPosition == 1 ||
            _panelController.panelPosition == 0))
      FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'CurrencyCrab',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontFamily: 'ProductSans',
      //       fontSize: 23,
      //     ),
      //   ),
      //   actions: <Widget>[
      //     PopupMenuButton<String>(
      //       itemBuilder: (context) => Menu.home.keys
      //           .map((string) => PopupMenuItem(
      //                 value: string,
      //                 child: Text(FlutterI18n.translate(context, string)),
      //               ))
      //           .toList(),
      //       onSelected: (text) => Navigator.pushNamed(context, Menu.home[text]),
      //     ),
      //   ],
      // ),
      body: SlidingUpPanel(
        minHeight: 117,
        maxHeight: 400,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        onPanelOpened: closeKeyboard,
        parallaxEnabled: true,
        controller: _panelController,
        panel: RowLayout(
          padding: EdgeInsets.symmetric(horizontal: 20),
          space: 4,
          children: <Widget>[
            HandlerBar(),
            BlocBuilder<ExchangeBloc, ExchangeState>(
              builder: (context, state) {
                if (state is ExchangeLoaded) {
                  return CurrencyBox(
                    currency: state
                        .exchange
                        .rates[context.bloc<CurrencyBloc>().state.leftCurrency]
                        .code,
                  );
                } else {
                  return Separator.none();
                }
              },
            ),
            BlocBuilder<ExchangeBloc, ExchangeState>(
              builder: (context, state) {
                if (state is ExchangeLoaded) {
                  return Expanded(
                    child: Row(
                      children: <Widget>[
                        CurrencyPicker(
                          initialChild:
                              context.bloc<CurrencyBloc>().state.leftCurrency,
                          onSelectedItemChanged: (i) =>
                              context.bloc<CurrencyBloc>().add(
                                    UpdateLeftCurrency(i),
                                  ),
                          children: <String>[
                            for (final rate in state.exchange.rates) rate.code
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 34,
                        ),
                        CurrencyPicker(
                          initialChild:
                              context.bloc<CurrencyBloc>().state.rightCurrency,
                          onSelectedItemChanged: (i) =>
                              context.bloc<CurrencyBloc>().add(
                                    UpdateRightCurrency(i),
                                  ),
                          children: <String>[
                            for (final rate in state.exchange.rates) rate.code
                          ],
                        ),
                      ],
                    ),
                  );
                } else
                  return CircularProgressIndicator();
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Separator.none()),
            Padding(
              padding: EdgeInsets.all(32),
              child: BlocBuilder<ExchangeBloc, ExchangeState>(
                builder: (context, state) {
                  if (state is ExchangeLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          state
                              .exchange
                              .rates[context
                                  .bloc<CurrencyBloc>()
                                  .state
                                  .rightCurrency]
                              .code,
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Separator.spacer(space: 8),
                        Text(
                          '99.99',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Separator.none();
                  }
                },
              ),
            ),
            Expanded(child: Separator.none(), flex: 6),
          ],
        ),
      ),
    );
  }
}
