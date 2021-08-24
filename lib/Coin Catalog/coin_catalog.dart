import 'package:bitcoin_ticker/Coin%20Catalog/widgets/coind_card.dart';

import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class CoinCatalog extends StatelessWidget {
  final List coins;

  const CoinCatalog({Key? key, required this.coins}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorCoinButton,
      appBar: AppBar(
        backgroundColor: AppColors.colorCoinButton,
        title: const Padding(
          padding: EdgeInsets.only(left: 38),
          child: Text("🤑 Coin Catalog",
              style: TextStyle(color: Color(0xFF05D315))),
        ),
      ),
      body: ListView(
        children: coins
            .map(
              (e) => CoincardWidget(
                coinSigla: e["coinSigla"],
                country: e['country'],
                flag: e['flag'],
                name: e['name'],
              ),
            )
            .toList(),
      ),
    );
  }
}
