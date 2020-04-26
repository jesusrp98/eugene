import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'index.dart';

class ThemeState extends Equatable {
  final Themes theme;

  const ThemeState(this.theme) : assert(theme != null);

  @override
  List<Object> get props => [theme];

  ThemeMode get toMode => ThemeMode.values[theme.index];
}
