import 'package:flutter/material.dart';

import 'package:bitcoin_ticker/core/app_colors.dart';

class ConversionCard extends StatelessWidget {
  final String coinSelected;
  final String priceCoin;
  final String digitalCoin;

  const ConversionCard({
    Key? key,
    required this.coinSelected,
    required this.priceCoin,
    required this.digitalCoin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      color: AppColors.scaffoldColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // ignore: avoid_unnecessary_containers
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.colorCoinButton),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          '1 $digitalCoin = $priceCoin $coinSelected',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF2E3545),
          ),
        ),
      ),
    );
  }
}
