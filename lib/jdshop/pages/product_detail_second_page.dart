import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jdshop/jdshop/model/ProductDetailModel.dart';
import 'package:jdshop/jdshop/widget/loading_widget.dart';



class ProductDetailSecondPage extends StatefulWidget {
  final ProductDetailModel? productDetailModel;
  ProductDetailSecondPage({ this.productDetailModel,Key? key}) : super(key: key);

  @override
  _ProductDetailSecondPageState createState() =>
      _ProductDetailSecondPageState();
}

class _ProductDetailSecondPageState extends State<ProductDetailSecondPage> with AutomaticKeepAliveClientMixin{
  bool _flag = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("URL:https://juejin.cn/");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          this._flag ? LoadingWidget() : Text(""),
          Expanded(
              child: InAppWebView(
                //老版本：initialUrl    新版本：initialUrlRequest
                initialUrlRequest: URLRequest(
                  //   url: Uri.parse("https://jd.itying.com/pcontent?id=${this._id}")
                    url: Uri.parse("https://juejin.cn/")
                ),
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  print(progress / 100);
                  if (progress / 100 > 0.9999) {
                    setState(() {
                      this._flag = false;
                    });
                  }
                },
              )
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
