import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jdshop/jdshop/widget/loading_widget.dart';

class NewsDetailPage1 extends StatefulWidget {
  final aid;

  const NewsDetailPage1({Key? key, this.aid}) : super(key: key);

  @override
  State<NewsDetailPage1> createState() => _NewsDetailPage1State();
}

class _NewsDetailPage1State extends State<NewsDetailPage1> {
  var apiUrl;
  bool showLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiUrl = "https://www.phonegap100.com/newscontent.php?aid=${widget.aid}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻详情${widget.aid}"),
      ),
      body: Column(
        children: [
          this.showLoading ? LoadingWidget() : Container(),
          Expanded(
              child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse("${apiUrl}")),
            onProgressChanged: (controller, progress) {
              if ((progress / 100) > 0.99) {
                setState(() {
                  this.showLoading = false;
                });
              }
            },
          )),
        ],
      ),
    );
  }
}
