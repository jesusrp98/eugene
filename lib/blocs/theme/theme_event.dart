import 'package:equatable/equatable.dart';

import 'index.dart';

abstract class BaseThemeEvent extends Equatable {
  const BaseThemeEvent();
}

class ThemeEvent extends BaseThemeEvent {
  final Themes theme;

  const ThemeEvent(this.theme) : assert(theme != null);

  @override
  List<Object> get props => [theme];
}
