// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:disney_clone/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:disney_clone/models/coinModel.dart';

class CoinPage extends StatefulWidget {
  CoinPage({
    Key? key,
    required this.coin,
  }) : super(key: key);
  final Coin coin;

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  late double _coinPrice;
  @override
  void initState() {
    super.initState();
    _coinPrice = widget.coin.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.fullName),
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (() => Navigator.pop(context))),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(children: [
          Text(
            '${widget.coin.fullName}price',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
          ),
          Text(
            "\$${_coinPrice.toStringAsFixed(2)}",
            style: const TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            widget.coin.fullName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.coin.ticker,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey.shade300,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Additional information :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Algorithm : ${widget.coin.algorithm}",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),Text(
                  "Block number : ${widget.coin.blockNumber}",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),Text(
                  "Block reward : ${widget.coin.blockReward}",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),Text(
                  "Block time : ${widget.coin.blockTime}",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),Text(
                  "Max supply : ${widget.coin.maxSupply}",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          )
        ,const SizedBox(height: 20,)
             , ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15)),
                    backgroundColor:
                        MaterialStateProperty.all( CoinbaseTheme.color)),
                child: const Text(
                  "Trade",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {},
              ),
]),
      )),
    );
  }
}
