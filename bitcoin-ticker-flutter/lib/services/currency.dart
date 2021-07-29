import 'package:bitcoin_ticker/services/networking.dart';

const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '6EF302AC-70A5-4BB5-BF91-4D5EE6726C5C';

class Currency {
  Future getCurrencyData(String crypto, String traditional) async {
    String url = '$coinApiUrl/$crypto/$traditional?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var currencyData = await networkHelper.getData();
    return currencyData;
  }
}