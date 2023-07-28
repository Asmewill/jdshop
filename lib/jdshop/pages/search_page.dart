import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/util/search_history_util.dart';
import 'package:jdshop/jdshop/util/sharedpreferences_util.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var keyWord = "";
  List<String> hotSearchList = [
    "电脑",
    "手机",
    "华为",
    "小米",
    "三星",
    "联想",
    "华硕",
    "戴尔",
    "神舟",
    "荣耀",
    "Apple"
  ];

  List historyList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryList();
  }

  void getHistoryList() async {
    List tempList = await SearchHistoryUtil.getHistoryList();
    print("tempList:${tempList}");
    setState(() {
      this.historyList = tempList.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black12),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "笔记本",
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
              onChanged: (value) {
                this.keyWord = value;
              },
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Center(
                child: InkWell(
                  onTap: () {
                    if (keyWord.length > 0) {
                      SearchHistoryUtil.setHistoryData(keyWord);
                      //及时刷新筛选列表
                      Future.delayed(const Duration(milliseconds: 500), () {
                        //延时执行的代码
                        getHistoryList();
                      });
                    }
                    Navigator.pushNamed(context, "/product_list_page",
                        arguments: {"keyword": this.keyWord});
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
        body: ListView(
          children: [hotSearchWidget(), historySearchWidget()],
        ));
  }

  Widget historySearchWidget() {
    if (historyList.length > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "历史记录",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: historyList.map((item) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/product_list_page",
                      arguments: {"keyword": item});
                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      height: 45,
                      child: Text("${item}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Divider(
                        height: 0.2,
                        color: Colors.black12,
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget hotSearchWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
          child: Text(
            "热搜",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            height: 30,
            padding: EdgeInsets.only(left: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotSearchList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/product_list_page",
                              arguments: {"keyword": hotSearchList[index]});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(color: Colors.black12),
                          child: Text("${hotSearchList[index]}"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                })),
      ],
    );
  }
}
