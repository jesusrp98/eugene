import 'package:equatable/equatable.dart';

class CurrencyState extends Equatable {
  final List<int> currencies;
  final double exchange;

  const CurrencyState._(
    this.currencies,
    this.exchange,
  )   : assert(currencies != null),
        assert(exchange != null);

  factory CurrencyState.init() {
    return CurrencyState._([0, 0], 0);
  }

  factory CurrencyState.fromJson(Map<String, dynamic> json) {
    return CurrencyState._(json['currencies'].cast<int>(), 0);
  }

  factory CurrencyState.updateRight(CurrencyState state, int right) {
    return CurrencyState._([state.leftCurrency, right], state.exchange);
  }

  factory CurrencyState.updateLeft(CurrencyState state, int left) {
    return CurrencyState._([left, state.rightCurrency], state.exchange);
  }

  factory CurrencyState.swap(CurrencyState state) {
    return CurrencyState._(
      [state.rightCurrency, state.leftCurrency],
      state.exchange,
    );
  }

  factory CurrencyState.updateExchange(CurrencyState state, double exchange) {
    return CurrencyState._(state.currencies, exchange);
  }

  @override
  List<Object> get props => currencies;

  int get leftCurrency => currencies[0];
  int get rightCurrency => currencies[1];

  Map<String, dynamic> toJson() => {'currencies': currencies};
}
