import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/index.dart';

class ExchangeState extends Equatable {
  const ExchangeState();

  @override
  List<Object> get props => [];
}

class ExchangeUninitialized extends ExchangeState {}

class ExchangeLoading extends ExchangeState {}

class ExchangeLoaded extends ExchangeState {
  final Exchange exchange;

  const ExchangeLoaded({@required this.exchange});

  @override
  List<Object> get props => [exchange];
}

class ExchangeError extends ExchangeState {
  final String message;

  const ExchangeError({@required this.message});

  @override
  List<Object> get props => [message];
}
