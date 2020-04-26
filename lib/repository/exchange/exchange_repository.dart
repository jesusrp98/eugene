import 'package:flutter/foundation.dart';

import 'index.dart';

class ExchangeRepository {
  final ExchangeApiClient client;

  ExchangeRepository({@required this.client}) : assert(client != null);

  Future<String> getExchange() async {
    return await client.getExchange();
  }
}
