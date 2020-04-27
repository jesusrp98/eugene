import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'index.dart';

class CurrencyBloc extends HydratedBloc<CurrencyEvent, CurrencyState> {
  @override
  CurrencyState get initialState => super.initialState ?? CurrencyState([0, 0]);

  @override
  Stream<CurrencyState> mapEventToState(CurrencyEvent event) async* {
    if (event is UpdateRightCurrency) {
      yield CurrencyState([state.leftCurrency, event.currency]);
    } else if (event is UpdateLeftCurrency) {
      yield CurrencyState([event.currency, state.rightCurrency]);
    }
  }

  @override
  CurrencyState fromJson(Map<String, dynamic> source) {
    try {
      return CurrencyState(source['currencies'].cast<int>());
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, List<int>> toJson(CurrencyState state) {
    try {
      return {'currencies': state.currencies};
    } catch (_) {
      return null;
    }
  }
}
