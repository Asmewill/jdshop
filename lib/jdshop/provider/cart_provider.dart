import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/util/sharedpreferences_util.dart';

class CartProvider with ChangeNotifier {
  List  _cartList = []; //状态   使用List<Map>定义会报错
  List get cartList => this._cartList;
  double _allPrice=0;
  double get allPrice=> _allPrice;

  CartProvider() {
    this.init();
  }

  init() async {
    String? cartjson = await SharedPreferencesUtil.getString("cartList");
    if (cartjson != null) {
      List  cartListData = json.decode(cartjson); //使用List<Map>接收会报错
      this._cartList = cartListData;
      print("获取购物车列表:${_cartList}");
    } else {
      this._cartList = [];
    }
    computerAllPrice();
    notifyListeners();
  }
  //更新列表
  updateList() async{
    await this.init();
  }
  //计算总价
  computerAllPrice(){
    double tempAllPrice=0;
    for(var i=0;i<this._cartList.length;i++){
      if(_cartList[i]["checked"]==true){
        tempAllPrice+=double.parse(this._cartList[i]["price"].toString())*this._cartList[i]["count"];
      }
    }
    this._allPrice=tempAllPrice;
    notifyListeners();
  }

  itemCountChange(){
    computerAllPrice();
    SharedPreferencesUtil.setString("cartList", json.encode(_cartList));
    notifyListeners();
  }
}
