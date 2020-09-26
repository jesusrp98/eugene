import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'index.dart';

class CurrencyBloc extends HydratedBloc<CurrencyEvent, CurrencyState> {
  @override
  CurrencyState get initialState => super.initialState ?? CurrencyState.init();

  @override
  Stream<CurrencyState> mapEventToState(CurrencyEvent event) async* {
    if (event is UpdateRightCurrency) {
      yield CurrencyState.updateRight(state, event.currency);
    } else if (event is UpdateLeftCurrency) {
      yield CurrencyState.updateLeft(state, event.currency);
    } else if (event is SwapCurrencies) {
      yield CurrencyState.swap(state);
    } else if (event is UpdateExchange) {
      yield CurrencyState.updateExchange(state, event.exchange);
    }
  }

  @override
  CurrencyState fromJson(Map<String, dynamic> json) {
    try {
      return CurrencyState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, List<int>> toJson(CurrencyState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }
}
