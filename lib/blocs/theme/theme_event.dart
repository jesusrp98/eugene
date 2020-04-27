import 'package:equatable/equatable.dart';

import 'index.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class UpdateTheme extends ThemeEvent {
  final Themes theme;

  const UpdateTheme(this.theme) : assert(theme != null);

  @override
  List<Object> get props => [theme];
}
