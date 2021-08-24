import 'package:bitcoin_ticker/core/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:bitcoin_ticker/core/app_colors.dart';

class CoincardWidget extends StatelessWidget {
  final String coinSigla;
  final String name;
  final String country;
  final String flag;

  const CoincardWidget({
    Key? key,
    required this.coinSigla,
    required this.name,
    required this.country,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2E3545),
        border: Border.all(width: 1, color: AppColors.colorPrimary),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(6, 6),
            blurRadius: 6,
          ),
        ],
      ),
      child: ListTile(
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        leading: Image.asset(flag),
        title: Text(
          name,
          style: AppTextStyle.tileCoinCard,
        ),
        subtitle: Text(
          coinSigla,
          style: AppTextStyle.subtitlleCoinCard,
        ),
        trailing: Text(
          country,
          style: AppTextStyle.trailingCoinCard,
        ),
        // ),
      ),
    );
  }
}
