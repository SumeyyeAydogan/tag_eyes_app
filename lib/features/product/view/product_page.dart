import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String? barcode;
  const ProductPage({super.key, required this.barcode});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: Center(
        child: Text(widget.barcode!),
      ),
    );
  }
}
