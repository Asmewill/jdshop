
import 'package:flutter/material.dart';

class SearchPageDemo extends StatefulWidget {
  final dynamic arguments;
  const SearchPageDemo({this.arguments,Key? key}) : super(key: key);

  @override
  State<SearchPageDemo> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPageDemo> {
  _SearchPageState();
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
          appBar:AppBar(
            title: Text("搜索"),
          ),
        body: Center(
          child: Text("search content:${widget.arguments["id"]}"),
        ),
      );
  }
}
