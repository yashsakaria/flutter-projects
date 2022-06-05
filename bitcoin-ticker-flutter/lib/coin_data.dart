import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const APIKey = '31A56996-B424-49B5-90A6-351F5446EFFC';

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
  'MATIC',
];

class CoinData {
  Future<Map<String, String>> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String url = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$APIKey';

      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = response.body;
        dynamic coinInfo = convert.jsonDecode(data);
        double coinRate = coinInfo['rate'];
        cryptoPrices.putIfAbsent(crypto, () => coinRate.toStringAsFixed(0));
      } else {
        print('Status = ${response.statusCode}');
      }
    }

    print(cryptoPrices.values);
    print(cryptoPrices.keys);
    return cryptoPrices;
  }
}
