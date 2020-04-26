import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'blocs/exchange/index.dart';
import 'blocs/theme/index.dart';
import 'repositories/exchange/index.dart';
import 'view/screens/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();

  final httpClient = Dio();

  final repository = ExchangeRepository(
    client: ExchangeApiClient(httpClient),
  );

  runApp(EugeneApp(
    repository: repository,
  ));
}

class EugeneApp extends StatelessWidget {
  final ExchangeRepository repository;

  const EugeneApp({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(
          create: (_) =>
              ExchangeBloc(repository: repository)..add(FetchExchange()),
        ),
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
