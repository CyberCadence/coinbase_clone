// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        child: ListView(children: []),
      )),
    );
  }
}
