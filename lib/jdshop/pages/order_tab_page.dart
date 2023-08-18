import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/model/OrderModel.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/util/image_util.dart';
import 'package:jdshop/jdshop/widget/loading_widget.dart';

import '../config/config.dart';
import '../util/sign_util.dart';
import '../util/user_util.dart';

class OrderTabPage extends StatefulWidget {
  const OrderTabPage({Key? key}) : super(key: key);

  @override
  State<OrderTabPage> createState() => _OrderTabPageState();
}

class _OrderTabPageState extends State<OrderTabPage> {
  var imageLink =
      "https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png";
  OrderModel? orderModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderList();
  }

  getOrderList() async {
    List userinfo = await UserUtil.getUserInfo();
    var tempJson = {"uid": userinfo[0]['_id'], "salt": userinfo[0]["salt"]};
    var sign = SignUtil.sign(tempJson);
    var api =
        '${Config.domain}api/orderList?uid=${userinfo[0]['_id']}&sign=${sign}';
    print("api:${api}");
    var result = await DioProxy().dio.get(api);
    print(result.data is Map);
    print("api:${result}");
    setState(() {
      orderModel = OrderModel.fromJson(result.data);
      // this._orderList = orderModel.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (orderModel != null && orderModel?.success == true) {
      return ListView(
        children: orderModel!.result!.map((item) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.black12, width: 0.5))),
                  padding: EdgeInsets.only(left: 15),
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Text("订单编号:${item.id}"),
                ),
                Column(
                  children: item.orderItem!.map((itemChild) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 80,
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: Image.network("${ImageUtil.getPicUrl(itemChild.productImg!)}"),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          padding: EdgeInsets.only(right: 25),
                                          child: Text(
                                            "${itemChild.productTitle}",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          padding:
                                              EdgeInsets.only(right: 5, top: 2),
                                          child: Text("${itemChild.productCount}"),
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                Container(
                  height: 50,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("合计:￥6666"),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            child: ElevatedButton(
                              onPressed: () {
                                ToastUtil.showMsg("申请售后");
                              },
                              child: Text("申请售后"),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      );
    } else {
      return LoadingWidget();
    }
  }
}
