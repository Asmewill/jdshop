import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  final dynamic arguments;
  const ProductInfoPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<ProductInfoPage> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品页面") ,
      ),
      body: Center(
        child: Text("商品详情ID:${widget.arguments["id"]}"),
      ),
    );
  }
}
