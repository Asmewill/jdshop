import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../model/ProductDetailModel.dart';

class CartNum2 extends StatefulWidget {

   var itemModel;
   CartNum2(this.itemModel,{Key? key}) : super(key: key);

  @override
  State<CartNum2> createState() => _CartNumState();
}

class _CartNumState extends State<CartNum2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  print("itemModel:"+json.encode( widget.itemModel) );
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    return Container(
      width: 92,
      height: 27,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if(widget.itemModel["count"]>1){
                  widget.itemModel["count"]--;
                  cartProvider.itemCountChange();
                }
              });

            },
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              child: Text("-",style: TextStyle(fontSize: 22),),
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey))),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 40,
            height: 25,
            decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey))),
            child: Text("${widget.itemModel["count"]}"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.itemModel['count']++;
                cartProvider.itemCountChange();
              });
            },
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              child: Text("+",style:TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
