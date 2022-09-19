import 'package:disney_clone/models/coinModel.dart';
import 'package:disney_clone/pages/coin_pages.dart';
import 'package:disney_clone/services/coin_repository.dart';
import 'package:disney_clone/widgets/coin_card.dart';

import 'package:flutter/material.dart';

class COinDisplay extends StatefulWidget {
  const COinDisplay({Key? key}) : super(key: key);

  @override
  State<COinDisplay> createState() => _COinDisplayState();
}

class _COinDisplayState extends State<COinDisplay> {
  late Future<List<Coin>> _getCoins;

  @override
  void initState() {
    _getCoins = CoinRepository().getCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Coin>>(
      future: _getCoins,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          final coins = snapshot.data ?? [];

          return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
              child: Column(
                children: coins
                    .map((coin) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoinPage(coin: coin),
                                ));
                          },
                          child: CoinCard(coin: coin),
                        ))
                    .toList(),
              ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
