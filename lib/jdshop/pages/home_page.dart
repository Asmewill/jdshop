import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/model/BannerModel.dart';
import 'package:jdshop/jdshop/model/RecomendModel.dart';
import 'package:jdshop/jdshop/model/YouLikeModel.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  List<BannerItem> bannerList = [];
  List<YouLikeItem> youlikeList = [];
  List<RecomendItem> recomendList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBannerData();
    getYouLike();
    getHotRecomend();
  }

  void getHotRecomend() async {
    var result = await DioProxy().dio.get(Config.hotRecommend);
    print("api:${Config.hotRecommend}");
    print("result:${result}");
    var hotRecomend = RecomendModel.fromJson(result.data);
    setState(() {
      recomendList = hotRecomend.result!;
    });
  }

  void getYouLike() async {
    var result = await DioProxy().dio.get(Config.youLike);
    print("api:${Config.youLike}");
    print("返回数据:${result}");
    var youLikeModel = YouLikeModel.fromJson(result.data);
    setState(() {
      youlikeList = youLikeModel.result!;
    });
  }

  void getBannerData() async {
    var result = await DioProxy().dio.get(Config.bannerData);
    print("api:${Config.bannerData}");
    print("返回结果:${result}");
    var bannerModel = BannerModel.fromJson(result.data);
    setState(() {
      bannerList = bannerModel.result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.center_focus_strong),
          onPressed: () {
            ToastUtil.showMsg("clicked");
          },
        ),
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/search");
          },
          child: Container(
            padding: EdgeInsets.only(left: 15),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Colors.grey, size: 20),
                Text(
                  "笔记本",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ToastUtil.showMsg("clicked");
              },
              icon: Icon(Icons.message))
        ],
      ),
      body: ListView(
        children: [swipeWidget(), guessYouLikeWidget(), hotWidget()],
      ),
    );
  }

  Widget swipeWidget() {
    if (bannerList.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
            itemBuilder: (context, index) {
              var pic = Config.domain + bannerList[index].pic!;
              var picUrl = pic.replaceAll("\\", "/");
              return Image.network(picUrl, fit: BoxFit.cover);
            },
            itemCount: bannerList.length,
            pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.blue,
                    color: Colors.white,
                    size: 8.0,
                    activeSize: 8.0)),
            autoplay: true,
          ),
        ),
      );
    } else {
      return Text("加载中...");
    }
  }

  Widget guessYouLikeWidget() {
    if (youlikeList.length > 0) {
      return Container(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 24,
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("猜你喜欢",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 116,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: youlikeList.length,
                    itemBuilder: (context, index) {
                      var pic = Config.domain + youlikeList[index].pic!;
                      var picUrl = pic.replaceAll("\\", "/");
                      return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: 85,
                                  height: 85,
                                  child: Image.network(picUrl),
                                ),
                                Text("￥${youlikeList[index].price}")
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "/product_detail_page",
                                  arguments: {"id": youlikeList[index].id});
                            },
                          ));
                    }),
              )
            ],
          ));
    } else {
      return Text("加载中...");
    }
  }

  Widget hotWidget() {
    if (recomendList.length > 0) {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: 5,
                  height: 24,
                  decoration: BoxDecoration(color: Colors.red),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "热门推荐",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Wrap(
                    runSpacing: 10, //竖直间距
                    spacing: 10, //水平间距
                    children: recomendList.map((item) {
                      var pic = Config.domain + "${item.pic}";
                      var picUrl = pic.replaceAll("\\", "/");
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, "/product_detail_page",
                                arguments: {"id": item.id});
                          },
                          child: Container(
                            width: (ScreenUtil().screenWidth - 40) / 2,
                            height: 214,
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)),
                            child: Column(
                              children: [
                                Container(
                                  width: (ScreenUtil().screenWidth - 40) / 2,
                                  height: 144,
                                  child: Image.network(
                                    picUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(minHeight: 30),
                                  width: (ScreenUtil().screenWidth - 40) / 2,
                                  child: Text(
                                    "${item.title}",
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "￥${item.price}",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.red),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                            "${item.oldPrice}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ));
                    }).toList()))
          ],
        ),
      );
    } else {
      return Text("加载中...");
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
