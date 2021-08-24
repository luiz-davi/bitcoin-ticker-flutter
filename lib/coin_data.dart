// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

const chaveAPI = 'Apikey=D4D0B9DF-0CD3-4A50-B1D5-0F1732F06229';
const apiURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String coin, String criptoCoin) async {
    var url = "$apiURL/$criptoCoin/$coin?$chaveAPI";
    Uri requestURL = Uri.parse(url);
    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate'];
      return lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

  List<String> get currenciesList => [
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

  List<String> get cryptoList => ['BTC', 'ETH', 'LTC'];

  List get coinCatalog => [
        {
          "coinSigla": "AUD",
          "name": "Dólar Australiano",
          "country": "Austrália",
          "flag": "asset/image/australia.png",
        },
        {
          "coinSigla": "BRL",
          "name": "REAL",
          "country": "Brasil",
          "flag": "asset/image/brasil.png",
        },
        {
          "coinSigla": "CAD",
          "name": "Dólar Canadense",
          "country": "Canadá",
          "flag": "asset/image/canada.png",
        },
        {
          "coinSigla": "CNY",
          "name": "Renminbi",
          "country": "China",
          "flag": "asset/image/china.png",
        },
        {
          "coinSigla": "EUR",
          "name": "EURO",
          "country": "União Europeia",
          "flag": "asset/image/uniao-europeia.png",
        },
        {
          "coinSigla": "GBD",
          "name": "Libra Inglesa",
          "country": "Reino Unido",
          "flag": "asset/image/reino-unido.png",
        },
        {
          "coinSigla": "HKD",
          "name": "Dólar de Hong Kong",
          "country": "Hong Kong",
          "flag": "asset/image/hong-kong.png",
        },
        {
          "coinSigla": "IDR",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "ILS",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "INR",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "JPY",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "MXN",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "NOK",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "NZD",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "PLN",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "RON",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "RUB",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "SEK",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "SGD",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
        {
          "coinSigla": "USD",
          "name": "Dólar",
          "country": "Estanos Unidos",
          "flag": "asset/image/estados-unidos.png",
        },
        {
          "coinSigla": "ZAR",
          "name": "",
          "country": "",
          "flag": "asset/image/a.png",
        },
      ];
}
