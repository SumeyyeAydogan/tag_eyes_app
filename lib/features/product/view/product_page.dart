import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:http/http.dart' as http;
import 'package:tag_eyes_app/main.dart';

class ProductPage extends StatefulWidget {
  final String? barcode;
  const ProductPage({super.key, required this.barcode});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late String productName;
  late String productPrice;
  late String productCurrency;
  late String productDescription;
  late final String realProductPrice;

  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    productName = widget.barcode!.split('-')[0];
    productPrice = widget.barcode!.split('-')[1];
    productCurrency = widget.barcode!.split('-')[2];
    realProductPrice = productCurrency;
    productDescription = widget.barcode!.split('-')[3];
    _convertCurrency();
  }

  void _convertCurrency() async {
    setState(() {
      _isLoading = true;
    });
    dynamic response;
    try {
      String url = 'https://api.apilayer.com/currency_data/live?base=$userModel.curr2&symbols=USD,EUR,GBP,CHF,TRY';
      response = await http.get(Uri.parse(url), headers: {'apikey': 'sALCEiepANS3N9qLpmQBXZugJSxE3itM'});
    } on Exception catch (e) {
      debugPrint('Exception: $e');
    }
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (userModel.curr1 == 'USD') {
        if (data['success']) {
          double conversionRate = data['quotes']['$userModel.curr1${userModel.curr2}'];
          double inputValue = double.parse(productPrice);
          setState(() {
            productCurrency = (inputValue * conversionRate).toStringAsFixed(2);
            _isLoading = false;
          });
        }
      } else {
        double conversionRate1;
        if (data['success']) {
          if (userModel.curr2 == 'USD') {
            conversionRate1 = 1;
          } else {
            conversionRate1 = data['quotes']['USD${userModel.curr2}'];
          }
          double conversionRate2 = data['quotes']['USD${userModel.curr1}'];
          double conversionRate = conversionRate2 / conversionRate1;
          double inputValue = double.parse(productPrice);
          setState(() {
            productCurrency = (inputValue / conversionRate).toStringAsFixed(2);
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_isLoading) {
      case true:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      case false:
        return Body(
          productName: productName,
          productCurrency: productCurrency,
          productPrice: productPrice,
          productDescription: productDescription,
          realProductPrice: realProductPrice,
        );
      default:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
    }
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.productName,
    required this.productCurrency,
    required this.productPrice,
    required this.productDescription,
    required this.realProductPrice,
  });
  final String realProductPrice;
  final String productName;
  final String productCurrency;
  final String productPrice;
  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: context.dynamicHeight(700),
          width: context.dynamicWidth(380),
          child: Card(
            color: Colors.black.withOpacity(0.00001),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: context.dynamicHeight(70)),
                const Text(
                  'Ürün Adı',
                  style: TextStyle(fontSize: 30, color: Colors.black54),
                ),
                Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: context.dynamicHeight(30),
                ),
                Text(
                  productName,
                  style: const TextStyle(fontSize: 24, color: Colors.black54),
                ),
                SizedBox(height: context.dynamicHeight(50)),
                Text(
                  'Ürün Fiyatı (${userModel.curr1})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, color: Colors.black54),
                ),
                Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: context.dynamicHeight(30),
                ),
                Text(
                  productPrice,
                  style: const TextStyle(fontSize: 24, color: Colors.black54),
                ),
                SizedBox(height: context.dynamicHeight(50)),
                Text(
                  'Ürün Fiyatı ($realProductPrice)',
                  style: const TextStyle(fontSize: 20, color: Colors.black54),
                ),
                Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: context.dynamicHeight(30),
                ),
                Text(
                  productCurrency,
                  style: const TextStyle(fontSize: 24, color: Colors.black54),
                ),
                SizedBox(height: context.dynamicHeight(50)),
                const Text(
                  'Ürün Açıklaması',
                  style: TextStyle(fontSize: 30, color: Colors.black54),
                ),
                Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: context.dynamicHeight(30),
                ),
                Text(
                  productDescription,
                  style: const TextStyle(fontSize: 24, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
