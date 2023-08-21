import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/event/event_bus.dart';
import 'package:jdshop/jdshop/pages/pay_page.dart';
import 'package:jdshop/jdshop/provider/cart_provider.dart';
import 'package:jdshop/jdshop/provider/checkout_provider.dart';
import 'package:jdshop/jdshop/util/checkout_util.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/util/image_util.dart';
import 'package:jdshop/jdshop/util/sign_util.dart';
import 'package:jdshop/jdshop/util/user_util.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late CheckoutProvider checkoutProvider;
  late CartProvider cartProvider;
  var imageLink =
      "https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png";
  List addressList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDefaultAddress();
    eventBus.on<CheckoutEvent>().listen((event) {
      getDefaultAddress();
    });
  }

  getDefaultAddress() async {
    List userList = await UserUtil.getUserInfo();
    var tempJson = {
      "uid": userList[0]["_id"],
      "salt": userList[0]["salt"],
    };
    var sign = SignUtil.sign(tempJson);
    var api =
        "${Config.domain}api/oneAddressList?uid=${userList[0]["_id"]}&sign=${sign}";
    print("返回结果:${api}");
    var result = await DioProxy().dio.get(api);
    print("返回结果:${result}");
    setState(() {
      this.addressList = result.data['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of(context);
    checkoutProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("订单结算"),
        ),
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(bottom: 50),
              children: [
                addressList.length > 0
                    ? InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/address_list_page");
                        },
                        child: Container(
                          height: 80,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 16, right: 5),
                                      child: Icon(Icons.location_on_rounded,
                                          color: Colors.black),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${addressList[0]["name"]} ${" " + addressList[0]["phone"]}"),
                                        Container(
                                          width: ScreenUtil().screenWidth*3/4,
                                          child:Text("${addressList[0]["address"]}"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.navigate_next_outlined),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/add_address_page");
                        },
                        child: Container(
                          height: 80,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 16, right: 5),
                                      child: Icon(Icons.location_on_rounded,
                                          color: Colors.black),
                                    ),
                                    Text("请添加您的收货地址"),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.navigate_next_outlined),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                Container(
                  height: 10,
                  color: Colors.black12,
                ),
                Column(
                  children: getListWidget(),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 54,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text("实付款:"),
                            Text(
                              "￥${cartProvider.allPrice}",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  doOrder();
                                },
                                child: Text("立即下单"),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  List<Widget> getListWidget() {
    return checkoutProvider.checkoutList.map((item) {
      return Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
        height: 110,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
              child: Image.network(
                ImageUtil.getPicUrl(item["pic"]),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 5),
                  child: Text("${item["title"]}",
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7, left: 5),
                  child: Text("${item["selectedAttr"]}"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 5),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "￥${item["price"]}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              "X${item["count"]}",
                              style: TextStyle(color: Colors.black),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      );
    }).toList();
  }

   doOrder() async {
    List userinfo = await UserUtil.getUserInfo();
    var allPrice=CheckoutUtil.getAllPrice(checkoutProvider.checkoutList).toStringAsFixed(1);
    //获取签名
    var sign=SignUtil.sign({
      "uid": userinfo[0]["_id"],
      "phone": this.addressList[0]["phone"],
      "address": this.addressList[0]["address"],
      "name": this.addressList[0]["name"],
      "all_price":allPrice,
      "products": json.encode(checkoutProvider.checkoutList),
      "salt":userinfo[0]["salt"]   //私钥
    });
    //请求接口
    var api = '${Config.domain}api/doOrder';
    print("api:${api}");
    var result = await DioProxy().dio.post(api, data: {
      "uid": userinfo[0]["_id"],
      "phone": this.addressList[0]["phone"],
      "address": this.addressList[0]["address"],
      "name": this.addressList[0]["name"],
      "all_price":allPrice,
      "products": json.encode(checkoutProvider.checkoutList),
      "sign": sign
    });
    if(result.data["success"]){
     //删除购物车选中的商品数据
     await CheckoutUtil.removeUnSelectedCartItem();//必须添加await ,否则无法删除
     //调用CartProvider更新购物车数据
     cartProvider.updateList();
     //跳转到支付页面
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
         return PayPage();
     }));


    }
  }
}
