import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/model/ProductDetailModel.dart';
import 'package:jdshop/jdshop/util/cart_util.dart';
import 'package:jdshop/jdshop/util/image_util.dart';
import 'package:jdshop/jdshop/widget/cart_num.dart';
import 'package:jdshop/jdshop/widget/loading_widget.dart';
import 'package:provider/provider.dart';

import '../Util/toast_util.dart';
import '../event/event_bus.dart';
import '../provider/cart_provider.dart';

class ProductDetailFirstPage extends StatefulWidget {
  final ProductDetailModel? productDetailModel;

  ProductDetailFirstPage({Key? key, required this.productDetailModel})
      : super(key: key);

  @override
  State<ProductDetailFirstPage> createState() => _ProductDetailFirstPageState();
}

class _ProductDetailFirstPageState extends State<ProductDetailFirstPage> {

 late StreamSubscription<ProductContentEvent> actionEventBus;
  @override
  void initState() {
    // 1
    // TODO: implement initState
    super.initState();
    print("ProductDetailFirstPage---initState");
    _initAttr();
    this.actionEventBus=eventBus.on<ProductContentEvent>().listen((event) {
         print(event.text);
         this._showBottomView(widget.productDetailModel!.result!.attr!,widget.productDetailModel!.result!);
    });
  }

  ///当 State 对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    //2
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("ProductDetailFirstPage---didChangeDependencies");
  }

  ///reassemble()：此回调是专门为了开发调试而提供的，
  ///在热重载（hot reload）时会被调用，此回调在Release 模式下永远不会被调用。
  ///先调用reassemble(),然后调用didUpdateWidget()
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("ProductDetailFirstPage---reassemble");
  }

  @override
  void didUpdateWidget(covariant ProductDetailFirstPage oldWidget) {
    //点击保存
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("ProductDetailFirstPage---didUpdateWidget");
  }

  ///当 State 对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("ProductDetailFirstPage---deactivate");
  }



  ///当 State 对象从树中被永久移除时调用。通常在此回调中释放资源。
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("ProductDetailFirstPage---dispose");
    if(actionEventBus!=null){
      actionEventBus.cancel();
    }
  }

  var selectValue;

  void _initAttr() {
    if (widget.productDetailModel != null) {
      List<Attr> _attr = widget.productDetailModel!.result!.attr!;
      for (var i = 0; i < _attr.length; i++) {
        List tempList = _attr[i].list!;
        _attr[i].attrList = [];
        for (var j = 0; j < tempList.length; j++) {
          if (j == 0) {
            _attr[i].attrList.add({"title": tempList[j], "checked": true});
          } else {
            _attr[i].attrList.add({"title": tempList[j], "checked": false});
          }
        }
      }
      _setSelectedValue();
    }
  }

  void _setSelectedValue() {
    List tempList = [];
    List<Attr> _attr = widget.productDetailModel!.result!.attr!;
    for (int m = 0; m < _attr.length; m++) {
      for (int n = 0; n < _attr[m].attrList.length; n++) {
        if (_attr[m].attrList[n]["checked"] == true) {
          tempList.add(_attr[m].attrList[n]["title"]);
        }
      }
    }
    setState(() {
      selectValue = tempList.join(",");
    });
  }
  late CartProvider cartProvider;
  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of(context);
    if (widget.productDetailModel != null &&
        widget.productDetailModel?.result != null) {
      return Container(
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  ImageUtil.getPicUrl(widget.productDetailModel!.result!.pic!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "${widget.productDetailModel!.result!.title}",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "${widget.productDetailModel!.result!.subTitle}",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Container(
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Text("特价:"),
                          ),
                          Text(
                            "￥${widget.productDetailModel!.result!.price}",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("原价:"),
                          Text(
                              "￥${widget.productDetailModel!.result!.oldPrice}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0.5,
              color: Colors.black12,
            ),
            InkWell(
              onTap: () {
                if (widget.productDetailModel!.result?.attr?.length! != null) {
                  _showBottomView(widget.productDetailModel!.result!.attr!,widget.productDetailModel!.result!);
                }
              },
              child: Container(
                  height: 50,
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "已选:",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${selectValue}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  )),
            ),
            Divider(
              height: 0.5,
              color: Colors.black12,
            ),
            Container(
                height: 50,
                width: ScreenUtil().screenWidth,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "运费:",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(
                        "免费",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                )),
            Divider(
              height: 0.5,
              color: Colors.black12,
            ),
          ],
        ),
      );
    } else {
      return LoadingWidget();
    }
  }

  dynamic _showBottomView(List<Attr> attr,ProductDetailItem itemModel) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, bottomState) {
            return Stack(
              children: [
                ListView.builder(
                    itemCount: attr.length + 1,
                    itemBuilder: (context, index) {
                      if (index == attr.length) {
                        return Container(
                          margin: EdgeInsets.only(left: 10, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text("数量:"),
                              ),
                              CartNum(itemModel:itemModel)
                            ],
                          ),
                        );
                      } else {
                        return Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Text("${attr[index].cate}:"),
                            ),
                            Expanded(
                                flex: 1,
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: attr[index].attrList.map((item) {
                                    return InkWell(
                                      onTap: (){
                                        bottomState(() {
                                          for(var i=0;i<attr[index].attrList.length;i++){
                                            Map temp=attr[index].attrList[i];
                                            if(temp==item){
                                              temp["checked"]=true;
                                            }else{
                                              temp["checked"]=false;
                                            }
                                          }
                                        });
                                        _setSelectedValue();
                                      },
                                      child: Container(
                                          height: 50,
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30),
                                          decoration: BoxDecoration(
                                              color: item["checked"]
                                                  ? Colors.red
                                                  : Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                item["title"],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )),
                                    );
                                  }).toList(),
                                ))
                          ],
                        );
                      }
                    }),
                Positioned(
                    bottom: 60,
                    height: 0.5,
                    width: ScreenUtil().screenWidth,
                    child: Divider(
                      height: 0.5,
                      color: Colors.black12,
                    )),
                Positioned(
                    bottom: 0,
                    height: 60,
                    width: ScreenUtil().screenWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 44,
                              margin: EdgeInsets.only(left: 10, right: 5),
                              child: ElevatedButton(
                                onPressed: () async{
                                  //必须加入await 等待加入购物车，否则cartProvider.updateList()依旧查询不到结果.
                                  itemModel.selectedAttr=selectValue;
                                  await  CartUtil.addCart(itemModel);
                                  Navigator.pop(context);
                                  await cartProvider.updateList();
                                  ToastUtil.showMsg("加入购物车成功");
                                },
                                child: Text("加入购物车"),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))))),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 44,
                              margin: EdgeInsets.only(left: 5, right: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "立即购买",
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orangeAccent),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))))),
                              ),
                            )),
                      ],
                    ))
              ],
            );
          });
        });
  }
}
