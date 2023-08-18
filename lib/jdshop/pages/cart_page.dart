import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/provider/cart_provider.dart';
import 'package:jdshop/jdshop/provider/checkout_provider.dart';
import 'package:jdshop/jdshop/util/cart_util.dart';
import 'package:jdshop/jdshop/util/image_util.dart';
import 'package:jdshop/jdshop/util/user_util.dart';
import 'package:jdshop/jdshop/widget/cart_num.dart';
import 'package:provider/provider.dart';

import '../widget/cart_num_2.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>  with AutomaticKeepAliveClientMixin{
  var imageLink =
      "https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png";
  bool? isAllSelect = true;
  late CartProvider cartProvider;
  late CheckoutProvider checkoutProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of(context);
    checkoutProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          leading:Container() ,
          title: Text("购物车"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  ToastUtil.showMsg("Edit");
                },
                icon: Icon(Icons.launch))
          ],
        ),
        body: _getBodyWidget());
  }

  _getBodyWidget() {
    if (cartProvider.cartList.length > 0) {
      return Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 50),
            children: cartProvider.cartList.map((item) {
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/product_detail_page", arguments: {"id": item["_id"]});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
                  ),
                  height: 90,
                  child: Row(
                    children: [
                      Checkbox(
                          value: item["checked"],
                          onChanged: (value) {
                            setState(() {
                              item["checked"] = value;
                              cartProvider.itemCountChange();
                            });
                          }),
                      Image.network(
                        ImageUtil.getPicUrl(item["pic"]),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) {
                          return Image.asset(
                            "images/loading_fail.jpg",
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text("${item["title"]}",maxLines: 2,overflow: TextOverflow.ellipsis,),
                              ),
                              Expanded(flex: 1, child: Container()),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
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
                                      child: CartNum2(item),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                  //Container一定要有宽度，否则不予显示
                  height: 50,
                  width: ScreenUtil().screenWidth,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Checkbox(
                                value: isAllSelect,
                                onChanged: (value) {
                                  setState(() {
                                    isAllSelect = value;
                                  });
                                }),
                            Text("全选"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("总计:"),
                            Text(
                              "${cartProvider.allPrice}",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 38,
                          width: 68,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            onPressed: () {
                              doCheckOut();
                            },
                            child: Text("结算"),
                          ),
                        ),
                      )
                    ],
                  )))
        ],
      );
    } else {
      return Center(
        child: Text("购物车空空如也..."),
      );
    }
  }

  doCheckOut() async{
   // Navigator.pushNamed(context, "/login_page");
    List checkList=await CartUtil.getCheckOutData();
    bool isLogin = await UserUtil.getUserLoginState();
    if(checkList.length<=0){
      ToastUtil.showMsg("购物车中没有选中的数据");
    }else{
      checkoutProvider.setCheckoutList(checkList);
      if(isLogin){
        Navigator.pushNamed(context, "/checkout_page");
      }else{
        Navigator.pushNamed(context, "/login_page");
      }
    }
  }
}
