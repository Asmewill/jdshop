import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/pages/product_detail_page.dart';
import 'package:jdshop/jdshop/pages/product_list_page.dart';
import 'package:jdshop/jdshop/pages/search_page.dart';
import 'package:jdshop/widget/pages/product_info.dart';
import 'package:jdshop/widget/pages/product_page.dart';
import 'package:jdshop/widget/pages/search_page_demo.dart';
import 'package:jdshop/widget/statefulwidget/default_tabcontroller_view.dart';
import 'package:jdshop/widget/statefulwidget/drawer_view.dart';
import 'package:jdshop/widget/statefulwidget/tabcontroller_view.dart';
//
Map<String,Function>  routes={
   "/searchdemo":(BuildContext context,{dynamic arguments})=>SearchPageDemo(arguments: arguments),
  "/product":(context)=>const ProductPage(),
   "/product_info":(context,{ arguments})=>ProductInfoPage(arguments:arguments),
  "/default_tabcontroller":(context)=>const DefaultTabControllerView(),
  "/tabcontroller":(context)=>const TabControllerView(),
  "/drawerview":(context)=>const DrawerView(),
  "/search":(context)=>SearchPage(),
  "/product_list_page":(context,{arguments})=>ProductListPage(arguments: arguments,),
  "/product_detail_page":(context,{arguments})=>ProductDetailPage(arguments: arguments)
};
///固定写法
 dynamic onGenerateRoute=(RouteSettings settings){
    String? name=settings.name;
    Function? pageContentBuilder = routes[name];
    if(pageContentBuilder!=null){
       if(settings.arguments!=null){
          Route route=MaterialPageRoute(builder: (context){
             return pageContentBuilder(context,arguments:settings.arguments);
          });
          return route;
       }else{
         Route route=MaterialPageRoute(builder: (context){
           return pageContentBuilder(context);
         });
         return route;
       }
    }
 };