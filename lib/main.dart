import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/provider/cart_provider.dart';
import 'package:jdshop/jdshop/provider/checkout_provider.dart';
import 'package:jdshop/widget/provider/count_provider.dart';
import 'package:provider/provider.dart';

import 'jdshop/config/routes.dart';
import 'jdshop/pages/index_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 设置状态栏样式
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ScreenUtilInit(builder: (context,child){
      return  MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>CountProvider()),
            ChangeNotifierProvider(create: (context)=>CartProvider()),
            ChangeNotifierProvider(create: (context)=>CheckoutProvider()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blueGrey, // 设置主题颜色
                accentColor: Colors.green, // 设置强调颜色
              ),
              // useMaterial3: true,//使用Material3会导致Drawer变成圆角
            ),
            // home: const ScaffoldBottomNavigationBar1(),
            home: IndexPage(arguments: {"tab_index":0},),
            onGenerateRoute: onGenerateRoute,
          ));
    });
  }
}
