import 'package:dio/dio.dart';

import '../../util/url.dart';

class ExchangeApiClient {
  final Dio client;

  const ExchangeApiClient(this.client) : assert(client != null);

  Future<String> getExchange() async {
    final response = await client.get(Url.exchangeApi);
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception();
    }
  }
}
