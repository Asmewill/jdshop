import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/model/LeftModel.dart';
import 'package:jdshop/jdshop/model/RightModel.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int currentIndex = 0;
  List<LeftItem> leftList = [];
  List<RightItem> rightList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeftData();

  }

  void getLeftData() async {
    var result = await Dio().get(Config.categoryLeft);
    print("api:${Config.categoryLeft}");
    print("result:${result}");
    var leftModel = LeftModel.fromJson(result.data);
    setState(() {
      leftList = leftModel.result!;
    });
    getRightData(leftList[0].id);
  }

  void getRightData(var pid) async {
    var result = await Dio().get(Config.categoryRight + "${pid}");
    print("api:${Config.categoryRight + pid}");
    print("result:${result}");
    var rightModel = RightModel.fromJson(result.data);
    setState(() {
      rightList = rightModel.result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ToastUtil.showMsg("leading");
          },
          icon: Icon(Icons.center_focus_strong),
        ),
        title: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black12),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ToastUtil.showMsg("message");
              },
              icon: Icon(Icons.message))
        ],
      ),
      body: Row(
        children: [leftContent(), rightContent()],
      ),
    );
  }

  Widget leftContent() {
    if (leftList.length > 0) {
      return Expanded(
        flex: 1,
        child: ListView.builder(
            itemCount: leftList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        getRightData(leftList[index].id);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      color: currentIndex == index?Colors.black12:Colors.white,
                      child: Text(
                        "${leftList[index].title}",
                        style: TextStyle(
                            color: currentIndex == index
                                ? Colors.red
                                : Colors.black),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  )
                ],
              );
            }),
      );
    } else {
      return Expanded(
        flex: 1,
        child: Text("加载中..."),
      );
    }
  }

  Widget rightContent() {
    if (rightList.length > 0) {
      return Expanded(
          flex: 3,
          child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black12),
              child: Container(
                color: Colors.white,
                child: GridView.builder(
                    itemCount: rightList.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1 / 1.28,
                    ),
                    itemBuilder: (context, index) {
                      var pic = (Config.domain + rightList[index].pic)
                          .replaceAll("\\", "/");
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Image.network(
                                  pic,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text("${rightList[index].title}",
                                style: TextStyle(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis))
                          ],
                        ),
                      );
                    }),
              )));
    } else {
      return Expanded(
        flex: 3,
        child: Container(
          alignment: Alignment.center,
          child: Text("加载中..."),
        ),
      );
    }
  }
}
