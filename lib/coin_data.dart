import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';

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
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = 'YOUR API KEY';
class CoinData {
  Future getExchangeRate(String selectedCurrency, String crypto)async{
    Network networkURL = Network(
        '$coinAPIURL/$crypto/$selectedCurrency/?apikey=$apikey'
    );
    return networkURL.getData();
  }
}
class Network{
  Network(this.url);
  final String url;
  Future getData() async{
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
