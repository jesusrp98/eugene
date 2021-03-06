import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/index.dart';
import '../../repositories/exchange/index.dart';
import 'index.dart';

class ExchangeBloc extends HydratedBloc<ExchangeEvent, ExchangeState> {
  final ExchangeRepository repository;

  ExchangeBloc({@required this.repository}) : assert(repository != null);

  @override
  ExchangeState get initialState => ExchangeUninitialized();

  @override
  Stream<ExchangeState> mapEventToState(ExchangeEvent event) async* {
    if (event is FetchExchange) {
      yield ExchangeLoading();
      try {
        yield ExchangeLoaded(exchange: await repository.getExchange());
      } catch (e) {
        yield ExchangeError(message: e.toString());
      }
    }
  }

  @override
  ExchangeState fromJson(Map<String, dynamic> json) {
    try {
      final exchange = json['exchange'];

      if (_isBackupOutdated(exchange['date']))
        return null;
      else
        return ExchangeLoaded(exchange: Exchange.fromJson(exchange));
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ExchangeState state) {
    try {
      return {'exchange': state.props.toString()};
    } catch (_) {
      return null;
    }
  }

  static bool _isBackupOutdated(String backup) =>
      DateTime.parse(backup).add(Duration(days: 7)).isAfter(DateTime.now());
}
