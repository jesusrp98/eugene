import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'blocs/theme/index.dart';
import 'view/screens/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(EugeneApp());
}

class EugeneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp(
          title: 'CurrencyCrab',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state.toMode,
          home: StartScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
