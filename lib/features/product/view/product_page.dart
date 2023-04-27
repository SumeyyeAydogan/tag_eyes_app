import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';

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
  @override
  void initState() {
    super.initState();
    productName = widget.barcode!.split('-')[0];
    productPrice = widget.barcode!.split('-')[1];
    productCurrency = widget.barcode!.split('-')[2];
    productDescription = widget.barcode!.split('-')[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: SizedBox(
        height: context.dynamicHeight(200),
        width: context.dynamicWidth(200),
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(productName),
                Text(productPrice),
                Text(productCurrency),
                Text(productDescription),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
