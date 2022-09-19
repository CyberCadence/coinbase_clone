 

import 'dart:convert';

class CoinData {
  final num time;
  final num high;
  final num low;
  final num open;
  final num volumefrom;
  final num volumeto;
  final num close;
  final String conversionType;
  final String conversionSymbol;
  CoinData({
    required this.time,
    required this.high,
    required this.low,
    required this.open,
    required this.volumefrom,
    required this.volumeto,
    required this.close,
    required this.conversionType,
    required this.conversionSymbol,
  });

 



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'high': high,
      'low': low,
      'open': open,
      'volumefrom': volumefrom,
      'volumeto': volumeto,
      'close': close,
      'conversionType': conversionType,
      'conversionSymbol': conversionSymbol,
    };
  }

  factory CoinData.fromMap(Map<String, dynamic> map) {
    return CoinData(
      time: map['time'] ?? 0 ,
      high: map['high'] ?? 0.0,
      low: map['low'] ?? 0.0,
      open: map['open'] ?? 0.0,
      volumefrom: map['volumefrom'] ??"",
      volumeto: map['volumeto'] ??"",
      close: map['close'] ??"",
      conversionType: map['conversionType'] ??"",
      conversionSymbol: map['conversionSymbol'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinData.fromJson(String source) => CoinData.fromMap(json.decode(source) as Map<String, dynamic>);
}
