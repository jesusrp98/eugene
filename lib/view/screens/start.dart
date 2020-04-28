import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:row_collection/row_collection.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../blocs/currency/index.dart';
import '../../blocs/exchange/index.dart';
import '../../util/menu.dart';
import '../widgets/index.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // final _panelController = PanelController();
  // final _keyboardUtils = KeyboardUtils();

  // @protected
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //     Duration.zero,
  //     () => _keyboardUtils.add(
  //       listener: KeyboardListener(
  //         willHideKeyboard: () {
  //           _panelController.animatePanelToPosition(0);
  //         },
  //         willShowKeyboard: (height) {
  //           _panelController.animatePanelToPosition(0.7);
  //         },
  //       ),
  //     ),
  //   );
  // }

  // void closeKeyboard() {
  //   if (MediaQuery.of(context).viewInsets.bottom != 0 &&
  //       (_panelController.panelPosition == 1 ||
  //           _panelController.panelPosition == 0))
  //     FocusScope.of(context).requestFocus(FocusNode());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExchangeBloc, ExchangeState>(
      builder: (context, exchangeState) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('CurrencyCrab'),
          actions: <Widget>[
            PopupMenuButton<String>(
              itemBuilder: (context) => Menu.home.keys
                  .map((string) => PopupMenuItem(
                        value: string,
                        child: Text(FlutterI18n.translate(context, string)),
                      ))
                  .toList(),
              onSelected: (text) =>
                  Navigator.pushNamed(context, Menu.home[text]),
            ),
          ],
        ),
        body: SlidingUpPanel(
          minHeight: 118,
          maxHeight: 356,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          // onPanelOpened: closeKeyboard,
          parallaxEnabled: true,
          // controller: _panelController,
          panel: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                HandlerBar(),
                BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, currencyState) => CurrencyBox(
                    currency: exchangeState is ExchangeLoaded
                        ? exchangeState
                            .exchange.rates[currencyState.leftCurrency].code
                        : '',
                    // onChange: (value) => context
                    //     .bloc<ExchangeBloc>()
                    //     .getExchange(currencyState.currencies),
                    onSwap: () => context.bloc<CurrencyBloc>().add(
                          SwapCurrencies(),
                        ),
                  ),
                ),
                if (exchangeState is ExchangeLoaded)
                  BlocBuilder<CurrencyBloc, CurrencyState>(
                    condition: (_, s) => true,
                    builder: (context, currencyState) => Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .textTheme
                              .caption
                              .color
                              .withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: <Widget>[
                            CurrencyPicker(
                              initialItem: currencyState.leftCurrency,
                              onSelectedItemChanged: (i) =>
                                  context.bloc<CurrencyBloc>().add(
                                        UpdateLeftCurrency(i),
                                      ),
                              children: <String>[
                                for (final rate in exchangeState.exchange.rates)
                                  rate.code
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: 34,
                            ),
                            CurrencyPicker(
                              initialItem: currencyState.rightCurrency,
                              onSelectedItemChanged: (i) =>
                                  context.bloc<CurrencyBloc>().add(
                                        UpdateRightCurrency(i),
                                      ),
                              children: <String>[
                                for (final rate in exchangeState.exchange.rates)
                                  rate.code
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(child: Separator.none()),
              Padding(
                padding: EdgeInsets.all(32),
                child: BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, currencyState) {
                    if (exchangeState is ExchangeLoaded) {
                      return ExchangeText(
                        currency: exchangeState
                            .exchange.rates[currencyState.rightCurrency].code,
                        value: '99.99',
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
      ),
    );
  }
}
