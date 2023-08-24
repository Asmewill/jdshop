import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/model/ProductModel.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/widget/loading_widget.dart';

class ProductListPage extends StatefulWidget {
  dynamic arguments;

  ProductListPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  ScrollController _scrollController = ScrollController(); //Listview的控制器
  List subHeaderList = [
    {
      "id": 0,
      "title": "综合",
      "fileds": "all",
      "sort": -1,
      //排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 1, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 2, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 3, "title": "筛选"}
  ];
  var keyword, cid;
  var selectId = 0;
  var page = 1;
  var sort = "";
  var pageSize = 8;
  List<ProductItem> productList = [];
  var hasMore = true;
  var flag = true;
  var showEmptyView = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController? editingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyword = widget.arguments["keyword"];
    cid=widget.arguments["cid"];
    //设置初始值
    if(keyword!=null){
      editingController = TextEditingController();
      editingController?.text = keyword;
    }


    getProductListData();
    _scrollController.addListener(() {
      //_scrollController.position.pixels //获取滚动条滚动的高度
      //_scrollController.position.maxScrollExtent  //获取页面高度
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        print('flag:${flag}----hasMore:${hasMore}');
        if (this.flag && this.hasMore) {
          getProductListData();
        }
      }
    });
  }

  void getProductListData() async {
    setState(() {
      this.flag = false;
    });
    var api;
    if (keyword == null) {
      api =
          "${Config.domain}api/plist?cid=${this.cid}&page=${this.page}&sort=${this.sort}&pageSize=${this.pageSize}";
    } else {
      api =
          "${Config.domain}api/plist?search=${this.keyword}&page=${this.page}&sort=${this.sort}&pageSize=${this.pageSize}";
    }
    print("api:${api}");
    var result = await DioProxy().dio.get(api);
    print("返回结果:${result}");
    var tempModel = ProductModel.fromJson(result.data);
    if (tempModel.result!.length < this.pageSize) {
      setState(() {
        this.productList.addAll(tempModel.result!);
        this.hasMore = false;
        this.flag = true;
        if (this.page == 1 && productList.length == 0) {
          showEmptyView = true;
        }
      });
    } else {
      setState(() {
        this.productList.addAll(tempModel.result!);
        this.page++;
        this.hasMore = true;
        this.flag = true;
        if (this.page == 1 && productList.length == 0) {
          showEmptyView = true;
        }
      });
    }
  }

  void _filterListData(id) {
    if (id == 3) {
      _scaffoldKey.currentState!.openEndDrawer();
      setState(() {
        this.selectId = id;
      });
    } else {
      setState(() {
        this.selectId = id;
        //默认降序排列，点击的时候，把其他的项设置为初始值降序排列
        for (var item in subHeaderList) {
          if (item['id'] != 3) {
            if (id == item['id']) {
              print('sort:${subHeaderList[id]['sort']}');
              subHeaderList[id]['sort'] = subHeaderList[id]['sort'] * -1;
            } else {
              item['sort'] = -1;
            }
          }
        }
        this.page = 1;
        this.sort =
            "${this.subHeaderList[id]["fileds"]}_${this.subHeaderList[id]["sort"]}";
        this.productList = [];
        this.hasMore = true;
        //回到顶部
        _scrollController.jumpTo(0);
        //重新请求
        this.getProductListData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black12),
          child: TextField(
            controller: editingController,
            autofocus: false,
            onChanged: (value){
              this.keyword=value;
            },
            decoration: InputDecoration(
                hintText: "笔记本",
                hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: InkWell(
                onTap: () {
                  _filterListData(0);
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("搜索"),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [productListWidget(), filterWidget()],
      ),
      endDrawer: MyDrawer(),
    );
  }

  Widget filterWidget() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        height: 44,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
        child: Row(
          children: subHeaderList.map((item) {
            var color;
            if (selectId == item["id"]) {
              color = Colors.red;
            } else {
              color = Colors.black;
            }
            return InkWell(
              onTap: () {
                _filterListData(item['id']);
              },
              child: Container(
                height: 44,
                width: ScreenUtil().screenWidth / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${item["title"]}",
                      style: TextStyle(color: color),
                    ),
                    showIcons(item["id"])
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget showIcons(int id) {
    if (id == 1 || id == 2) {
      if (subHeaderList[id]['sort'] == 1) {
        return Icon(Icons.arrow_drop_up);
      } else {
        return Icon(Icons.arrow_drop_down);
      }
    } else {
      return Text("");
    }
  }

  Widget productListWidget() {
    if (productList.length > 0) {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView.builder(
            controller: _scrollController,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              var pic = (Config.domain + productList[index].pic!)
                  .replaceAll("\\", "/");
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/product_detail_page",
                      arguments: {"id": productList[index].id});
                },
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 125,
                          height: 125,
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                            "${pic}",
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object obj,
                                StackTrace? stack) {
                              return Image.asset(
                                "images/loading_fail.jpg",
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 5, right: 10),
                              child: Text("${productList[index].title}"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 22,
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11))),
                                    child: Text("8G"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 22,
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11))),
                                    child: Text("16G"),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12, left: 5),
                              child: Text(
                                "￥${productList[index].price}",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black26,
                    ),
                    _showMore(index)
                  ],
                ),
              );
            }),
      );
    } else {
      if (showEmptyView) {
        return Center(
          child: Text("暂无数据"),
        );
      } else {
        return LoadingWidget();
      }
    }
  }

  //显示加载中的圈圈
  Widget _showMore(index) {
    if (this.hasMore) {
      return (index == this.productList.length - 1)
          ? LoadingWidget()
          : Text("");
    } else {
      return (index == this.productList.length - 1)
          ? Container(
              child: Text("--  我是有底线的  --"),
              height: 50,
              alignment: Alignment.center,
            )
          : Text("");
    }
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark, // 设置状态栏文本和图标为深色
        child: Container(
          color: Colors.transparent, // 抽屉背景色设为透明
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  // 添加实际的跳转逻辑
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // 添加实际的跳转逻辑
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
                onTap: () {
                  Navigator.pop(context);
                  // 添加实际的跳转逻辑
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
