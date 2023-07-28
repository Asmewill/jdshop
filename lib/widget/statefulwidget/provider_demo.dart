import 'package:flutter/material.dart';
import 'package:jdshop/widget/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatefulWidget {
  const ProviderDemo({Key? key}) : super(key: key);

  @override
  State<ProviderDemo> createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider功能演示"),
      ),
      body: Center(
        child: Text("计数:${counterProvider.count}"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counterProvider.updateCount();
      },child: Icon(Icons.add),),
    );
  }
}
