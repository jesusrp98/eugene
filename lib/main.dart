import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/screens/start.dart';

void main() => runApp(EugeneApp());

class EugeneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CurrencyCrab',
      theme: ThemeData.dark(),
      // theme: model.requestTheme(Brightness.light),
      // darkTheme: model.requestTheme(Brightness.dark),
      home: StartScreen(),
      debugShowCheckedModeBanner: false,
      // routes: <String, WidgetBuilder>{
      //   '/about': (_) => AboutScreen(),
      //   '/settings': (_) => SettingsScreen(),
      // },
      localizationsDelegates: [
        FlutterI18nDelegate(fallbackFile: 'en'),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}
