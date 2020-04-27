import 'package:equatable/equatable.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();
}

class UpdateLeftCurrency extends CurrencyEvent {
  final int currency;

  const UpdateLeftCurrency(this.currency) : assert(currency != null);

  @override
  List<Object> get props => [currency];
}

class UpdateRightCurrency extends CurrencyEvent {
  final int currency;

  const UpdateRightCurrency(this.currency) : assert(currency != null);

  @override
  List<Object> get props => [currency];
}
