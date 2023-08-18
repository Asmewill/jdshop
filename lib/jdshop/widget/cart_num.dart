import 'package:flutter/material.dart';

import '../model/ProductDetailModel.dart';

class CartNum extends StatefulWidget {

   final ProductDetailItem itemModel;
   CartNum({Key? key, required this.itemModel}) : super(key: key);

  @override
  State<CartNum> createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                if(widget.itemModel.count>1){
                  widget.itemModel.count--;
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
            child: Text("${widget.itemModel.count}"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.itemModel.count++;
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
