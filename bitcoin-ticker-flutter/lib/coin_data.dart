import 'dart:convert';

import 'package:http/http.dart' as http;


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final String currency;
  final String crypto;

  CoinData(this.currency, this.crypto);

  Future<dynamic> getCoinData() async {
    var coinResponse = await http.get(Uri(
      scheme: 'https',
      host: 'rest.coinapi.io',
      path: '/v1/exchangerate/$crypto/$currency'
    ), headers: {
      'X-CoinAPI-Key': '84F47D93-19C2-4A15-9C11-E335F93F51CD'
    });

    if (coinResponse.statusCode == 200) {
      return jsonDecode(coinResponse.body);
    } else {
      print(coinResponse.statusCode);
    }
  }
}
