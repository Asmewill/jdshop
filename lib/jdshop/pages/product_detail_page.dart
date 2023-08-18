import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/model/ProductDetailModel.dart';
import 'package:jdshop/jdshop/pages/product_detail_first_page.dart';
import 'package:jdshop/jdshop/pages/product_detail_second_page.dart';
import 'package:jdshop/jdshop/pages/product_detail_thrid_page.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/widget/loading_widget.dart';
import 'package:jdshop/widget/dialog/loading_dialog.dart';

import '../config/config.dart';
import '../event/event_bus.dart';
import '../util/dialog_util.dart';

class ProductDetailPage extends StatefulWidget {
  final dynamic arguments;

  const ProductDetailPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var id;
  var productDetailModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.arguments["id"];
    _getProductDetail(id);
  }

  void _getProductDetail(var id) async {
    var api = Config.domain + "api/pcontent?id=${id}";
    print("api:${api}");
    var result = await DioProxy().dio.get(api);
    print("返回结果:${result}");
    //  DialogUtil.hide(context);
    var tempModel = ProductDetailModel.fromJson(result.data);
    setState(() {
      productDetailModel = tempModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: ScreenUtil().screenWidth / 2,
                  child: TabBar(
                      isScrollable: false,
                      //设置是否可以滑动
                      unselectedLabelColor: Colors.black,
                      //未选中时文字颜色
                      labelColor: Colors.red,
                      //文字颜色
                      indicatorColor: Colors.red,
                      //底部和文字大小对齐
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          child: Text("商品"),
                        ),
                        Tab(
                          child: Text("详情"),
                        ),
                        Tab(
                          child: Text("评价"),
                        )
                      ]),
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                            ScreenUtil().screenWidth - 100, 90, 0, 0),
                        items: [
                          PopupMenuItem(
                              child: Row(
                            children: [Icon(Icons.home), Text("首页")],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: [Icon(Icons.search), Text("搜索")],
                          )),
                        ]);
                  },
                  icon: Icon(Icons.more_horiz))
            ],
          ),
          body: _getBodyWidget(),
        ));
  }

  Widget _getBodyWidget() {
    if (productDetailModel != null) {
      return Stack(
        children: [
          TabBarView(children: [
            ProductDetailFirstPage(productDetailModel: productDetailModel),
            ProductDetailSecondPage(),
            ProductDetailThridPage()
          ]),
          Positioned(
            bottom: 0,
            child: Container(
                height: 60,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 0.5, color: Colors.black12))),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, "/index_page",arguments:{"tab_index":2});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Icon(Icons.shopping_cart), Text("购物车")],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {
                            eventBus.fire(ProductContentEvent(text: "显示属性筛选"));
                          },
                          child: Text("加入购物车"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("立即购买"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.orangeAccent)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )),
          )
        ],
      );
    } else {
      return LoadingWidget();
    }
  }
}
