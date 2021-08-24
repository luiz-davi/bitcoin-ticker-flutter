// ignore_for_file: avoid_print

import 'package:bitcoin_ticker/Price%20Screen/widget/button_catalog.dart';
import 'package:bitcoin_ticker/Price%20Screen/widget/conversion_card.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

// ignore: use_key_in_widget_constructors
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String coinSelected = "AUD";

  DropdownButton<String> dropButton() {
    return DropdownButton<String>(
      underline: const SizedBox(),
      value: coinSelected,
      items: coinData.currenciesList
          .map<DropdownMenuItem<String>>((String coinChoose) {
        return DropdownMenuItem(
          value: coinChoose,
          child: Text(coinChoose),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          coinSelected = value!;
          getPriceCoin();
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          coinSelected = coinData.currenciesList[selectedIndex];
          getPriceCoin();
        });
      },
      children: coinData.currenciesList
          .map((e) => Text(
                e,
                style: const TextStyle(color: Colors.white),
              ))
          .toList(),
    );
  }

  Widget getPicker() => Platform.isIOS ? iosPicker() : dropButton();

  String priceBitCoin = '?';
  String priceEthCoin = '?';
  String priceLtcCoin = '?';

  void getPriceCoin() async {
    try {
      var dataBit = await coinData.getCoinData(coinSelected, 'BTC');
      var dataEth = await coinData.getCoinData(coinSelected, 'ETH');
      var dataLtc = await coinData.getCoinData(coinSelected, "LTC");
      setState(() {
        priceBitCoin = dataBit;
        priceEthCoin = dataEth;
        priceLtcCoin = dataLtc;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getPriceCoin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorPrimary,
        title: const Center(child: Text('🤑 Coin Ticker')),
        actions: [ButtonCatalog(catalog: coinData.coinCatalog)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConversionCard(
            coinSelected: coinSelected,
            priceCoin: priceBitCoin,
            digitalCoin: 'BTC',
          ),
          ConversionCard(
            coinSelected: coinSelected,
            priceCoin: priceEthCoin,
            digitalCoin: 'ETH',
          ),
          ConversionCard(
            coinSelected: coinSelected,
            priceCoin: priceLtcCoin,
            digitalCoin: 'LTC',
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.colorPrimary,
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(10),
                topStart: Radius.circular(10),
              ),
            ),
            height: 120.0,
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.colorCoinButton,
                borderRadius: BorderRadius.circular(10),
              ),
              child: iosPicker(),
            ),
          ),
        ],
      ),
    );
  }
}
