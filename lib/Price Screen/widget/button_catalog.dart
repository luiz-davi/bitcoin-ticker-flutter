import 'package:bitcoin_ticker/Coin%20Catalog/coin_catalog.dart';
import 'package:flutter/material.dart';

class ButtonCatalog extends StatelessWidget {
  final List catalog;
  const ButtonCatalog({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CoinCatalog(coins: catalog);
            },
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 5),
        child: CircleAvatar(
          backgroundColor: Color(0xFF2E3545),
          child: Icon(
            Icons.attach_money,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
