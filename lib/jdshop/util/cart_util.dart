
import 'dart:convert';

import 'package:jdshop/jdshop/model/ProductDetailModel.dart';
import 'package:jdshop/jdshop/util/sharedpreferences_util.dart';

class CartUtil{
  static addCart(ProductDetailItem item) async{
    Map tempMap=CartUtil.formatCartData(item);
    String? cartJson= await SharedPreferencesUtil.getString("cartList");
    if(cartJson!=null){
      List  cartListData=json.decode(cartJson);
      //判断购物车有没有当前数据
      bool hasData= cartListData.any((value){
        return value["_id"]==tempMap["_id"]&&value["selectedAttr"]==tempMap["selectedAttr"];
      });
      if (hasData) {
        for (var i = 0; i < cartListData.length; i++) {
          if (cartListData[i]['_id'] == tempMap['_id'] &&
              cartListData[i]['selectedAttr'] == tempMap['selectedAttr']) {
            cartListData[i]["count"] = cartListData[i]["count"] + 1;
          }
        }
        print("购物车原始数据0:${cartListData}");
        await SharedPreferencesUtil.setString('cartList', json.encode(cartListData));
      } else {
        cartListData.add(tempMap);
        print("购物车原始数据1:${cartListData}");
        await SharedPreferencesUtil.setString('cartList', json.encode(cartListData));
      }
    }else{
      List tempList = [];
      tempList.add(tempMap);
      print("购物车原始数据2:${tempList}");
      await SharedPreferencesUtil.setString('cartList', json.encode(tempList));
    }
  }

  static Map formatCartData(ProductDetailItem item){
    final Map tempMap =new Map<String ,dynamic>();
    tempMap["_id"]=item.id;
    tempMap["title"]=item.title;
    tempMap["price"]=item.price;
    tempMap["selectedAttr"]=item.selectedAttr;
    tempMap["count"]=item.count;
    tempMap["pic"]=item.pic;
    tempMap["checked"]=true;
    return tempMap;
  }

  //获取购物车选中的数据
  static getCheckOutData() async {
    List cartListData = [];
    List tempCheckOutData = [];
    String? cartList = await SharedPreferencesUtil.getString('cartList');
    if (cartList!= null) {
      cartListData = json.decode(cartList);
    }else{
      cartListData = [];
    }
    for (var i = 0; i < cartListData.length; i++) {
      if (cartListData[i]["checked"] == true) {
        tempCheckOutData.add(cartListData[i]);
      }
    }
    return tempCheckOutData;
  }
}