import 'package:dio/dio.dart';

import '../../models/index.dart';
import '../../util/url.dart';

class ExchangeApiClient {
  final Dio client;

  const ExchangeApiClient(this.client) : assert(client != null);

  Future<Exchange> getExchange() async {
    final response = await client.get(Url.exchangeApi);
    if (response.statusCode == 200) {
      return Exchange.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
