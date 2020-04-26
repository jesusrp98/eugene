import 'package:equatable/equatable.dart';

abstract class ExchangeEvent extends Equatable {
  const ExchangeEvent();
}

class FetchExchange extends ExchangeEvent {
  @override
  List<Object> get props => [];
}
