import 'package:flutter/material.dart';

class ProductDetailSecondPage extends StatefulWidget {
  const ProductDetailSecondPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailSecondPage> createState() => _ProductDetailSecondPageState();
}

class _ProductDetailSecondPageState extends State<ProductDetailSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ProductDetailSecondPage"),
    );
  }
}
