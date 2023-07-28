import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/pages/cart_page.dart';
import 'package:jdshop/jdshop/pages/category_page.dart';
import 'package:jdshop/jdshop/pages/home_page.dart';
import 'package:jdshop/jdshop/pages/mine_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<Widget> listPage = [HomePage(), CategoryPage(), CartPage(), MinePage()];
  int currentIndex = 0;

  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController=PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: listPage,
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel),label: "购物车"),
          BottomNavigationBarItem(icon: Icon(Icons.people),label: "我的")
        ],
        currentIndex: currentIndex,
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
