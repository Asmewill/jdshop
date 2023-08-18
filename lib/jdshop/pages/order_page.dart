import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/pages/order_tab_page.dart';

class OrderPage extends StatefulWidget {
    dynamic arguments;
   OrderPage({this.arguments,Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.index = widget.arguments["tab_index"]; //切换tab
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的订单"),
        bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.red,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            tabs: [
              Tab(child: Text("全部")),
              Tab(
                child: Text("待付款"),
              ),
              Tab(
                child: Text("待收货"),
              ),
              Tab(
                child: Text("已完成"),
              ),
              Tab(
                child: Text("待评价"),
              ),
            ]),
      ),
      body: TabBarView(controller: tabController, children: [
        OrderTabPage(),
        OrderTabPage(),
        OrderTabPage(),
        OrderTabPage(),
        OrderTabPage(),
      ]),
    );
  }
}
