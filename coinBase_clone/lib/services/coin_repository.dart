import 'dart:convert';

import 'package:disney_clone/models/data_error.dart';
import 'package:http/http.dart'as http;

import '../models/coinModel.dart';

class CoinRepository{

static const String _baseUrl='https://min-api.cryptocompare.com/';


Future<List<Coin>>getCoin()async{

const requestUrl =
        '${_baseUrl}data/top/totalvolfull?limit=25&tsym=USD&page=0';



try {
  final response=await http.get(Uri.parse(requestUrl));



if(response.statusCode==200){

final decodeddata=  jsonDecode(response.body)as Map<String,dynamic>;
  final data= decodeddata['Data']as List<dynamic>;
  

  return data.map((e) {
return Coin.fromMap(e);

  }).toList();

print(data);

  


}else{
  throw Exception('failed to get data');
}


} catch (e) {
  

throw DataError(message: e.toString());

}

}

}