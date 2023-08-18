import 'dart:convert';

import 'package:jdshop/jdshop/util/sharedpreferences_util.dart';

class CheckoutUtil {
  //计算总价
  static double  getAllPrice(List checkOutListData) {
    double tempAllPrice = 0.0;
    for (var i = 0; i < checkOutListData.length; i++) {
      if (checkOutListData[i]["checked"] == true) {
        tempAllPrice +=
            double.parse(checkOutListData[i]["price"].toString())* checkOutListData[i]["count"];
      }
    }
    return tempAllPrice;
  }

  static removeUnSelectedCartItem() async {
    List _cartList = [];
    List _tempList = [];
    //获取购物车的数据
    String? cartListString = await SharedPreferencesUtil.getString('cartList');
    if (cartListString != null) {
      List cartListData = json.decode(cartListString);
      _cartList = cartListData;
    } else {
      _cartList = [];
    }
    for (var i = 0; i < _cartList.length; i++) {
      if (_cartList[i]["checked"] == false) {
        _tempList.add(_cartList[i]);
      }
    }
    SharedPreferencesUtil.setString("cartList", json.encode(_tempList));
  }
}