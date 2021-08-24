import 'package:bitcoin_ticker/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'Price Screen/price_screen.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.colorPrimary,
        scaffoldBackgroundColor: AppColors.scaffoldColor,
      ),
      home: PriceScreen(),
    );
  }
}
