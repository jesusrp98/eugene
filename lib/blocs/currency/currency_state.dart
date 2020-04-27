import 'package:equatable/equatable.dart';

class CurrencyState extends Equatable {
  final List<int> currencies;

  const CurrencyState(this.currencies) : assert(currencies != null);

  @override
  List<Object> get props => currencies;

  int get leftCurrency => currencies[0];
  int get rightCurrency => currencies[1];
}
