

import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';

class ProductDetailPage extends StatefulWidget {
  final  dynamic arguments;
  const ProductDetailPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id=widget.arguments["id"];
    ToastUtil.showMsg("id:"+id);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
