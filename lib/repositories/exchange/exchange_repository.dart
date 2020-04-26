import 'package:flutter/foundation.dart';

import '../../models/index.dart';
import 'index.dart';

class ExchangeRepository {
  final ExchangeApiClient client;

  ExchangeRepository({@required this.client}) : assert(client != null);

  Future<Exchange> getExchange() async {
    return await client.getExchange();
  }
}
