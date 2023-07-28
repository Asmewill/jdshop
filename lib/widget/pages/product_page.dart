

import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("商品页面"),
      ),
      body: Center(
        child:ElevatedButton(
          onPressed: (){
             Navigator.pushNamed(context,"/product_info",arguments:{ "id":"666666"});
          },
          child: const Text("点击跳转到商品详情页面"),
        )
      ),
    );
  }
}
