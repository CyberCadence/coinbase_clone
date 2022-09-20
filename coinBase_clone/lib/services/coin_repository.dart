import 'dart:convert';

import 'package:disney_clone/models/coin_detailsmodel.dart';
import 'package:disney_clone/models/data_error.dart';
import 'package:http/http.dart' as http;

import '../models/coinModel.dart';

class CoinRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com/';

  Future<List<Coin>> getCoin() async {
    const requestUrl =
        '${_baseUrl}data/top/totalvolfull?limit=25&tsym=USD&page=0';

    try {
      final response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        final decodeddata = jsonDecode(response.body) as Map<String, dynamic>;
        final data = decodeddata['Data'] as List<dynamic>;

        return data.map((e) {
          return Coin.fromMap(e);
        }).toList();
      } else {
        throw Exception('failed to get data');
      }
    } catch (e) {
      throw DataError(message: e.toString());
    }
  }

 

static Future<List<CoinData>> getCoinHourlyData(String ticker) async {
    final requestUrl =
        '${_baseUrl}data/v2/histohour?fsym=$ticker&tsym=USD&limit=25';

    try {
      final response = await http.Client().get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final data = json['Data']['Data'] as List<dynamic>;

        return data.map((e) {
          return CoinData.fromMap(e);
        }).toList();
      } else {
        throw Exception('Failed to load currencies');
      }
    } catch (err) {
      throw DataError(message: err.toString());
    }
  }

}
