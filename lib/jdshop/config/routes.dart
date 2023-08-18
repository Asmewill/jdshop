import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/pages/add_address_page.dart';
import 'package:jdshop/jdshop/pages/address_list_page.dart';
import 'package:jdshop/jdshop/pages/checkout_page.dart';
import 'package:jdshop/jdshop/pages/edit_address_page.dart';
import 'package:jdshop/jdshop/pages/product_detail_page.dart';
import 'package:jdshop/jdshop/pages/product_list_page.dart';
import 'package:jdshop/jdshop/pages/register_first_page.dart';
import 'package:jdshop/jdshop/pages/register_second_page.dart';
import 'package:jdshop/jdshop/pages/register_thrid_page.dart';
import 'package:jdshop/jdshop/pages/search_page.dart';
import 'package:jdshop/widget/pages/product_info.dart';
import 'package:jdshop/widget/pages/product_page.dart';
import 'package:jdshop/widget/pages/search_page_demo.dart';
import 'package:jdshop/widget/statefulwidget/default_tabcontroller_view.dart';
import 'package:jdshop/widget/statefulwidget/drawer_view.dart';
import 'package:jdshop/widget/statefulwidget/tabcontroller_view.dart';

import '../pages/index_page.dart';
import '../pages/login_page.dart';
//
Map<String,Function>  routes={
   "/index_page":(context,{arguments})=>IndexPage(arguments: arguments,),
   "/searchdemo":(BuildContext context,{dynamic arguments})=>SearchPageDemo(arguments: arguments),
  "/product":(context)=>const ProductPage(),
   "/product_info":(context,{ arguments})=>ProductInfoPage(arguments:arguments),
  "/default_tabcontroller":(context)=>const DefaultTabControllerView(),
  "/tabcontroller":(context)=>const TabControllerView(),
  "/drawerview":(context)=>const DrawerView(),
  "/search":(context)=>SearchPage(),
  "/product_list_page":(context,{arguments})=>ProductListPage(arguments: arguments,),
  "/product_detail_page":(context,{arguments})=>ProductDetailPage(arguments: arguments),
  "/login_page":(context)=>LoginPage(),
  "/register_first_page":(context)=>RegisterFirstPage(),
  "/register_second_page":(context,{arguments})=>RegisterSecondPage(arguments: arguments),
  "/register_thrid_page":(context,{arguments})=>RegisterThridPage(arguments: arguments,),
  "/checkout_page":(context)=>CheckoutPage(),
  "/add_address_page":(context)=>AddAddressPage(),
  "/edit_address_page":(context,{arguments})=>EditAddressPage(arguments:arguments),
  "/address_list_page":(context)=>AddressListPage(),
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