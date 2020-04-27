import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'index.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState =>
      super.initialState ?? ThemeState(Themes.system);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is UpdateTheme) {
      yield ThemeState(event.theme);
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> source) {
    try {
      return ThemeState(Themes.values[source['theme'] as int]);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, int> toJson(ThemeState state) {
    try {
      return {'theme': state.theme.index};
    } catch (_) {
      return null;
    }
  }
}
