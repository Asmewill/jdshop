/// result : [{"_id":"59f087ef11945e2760c852dd","cid":"59f1e4919bfd8f3bd030eed6","old_price":"2600","pic":"publifVt-PuGcxCA0fs.jpg","price":2346,"s_pic":"publ-PuGcxCA0fs.jpg_200x200.jpg","title":"笔记本电脑"}]

class ProductModel {
  ProductModel({
      this.result,});

  ProductModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(ProductItem.fromJson(v));
      });
    }
  }
  List<ProductItem>? result=[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "59f087ef11945e2760c852dd"
/// cid : "59f1e4919bfd8f3bd030eed6"
/// old_price : "2600"
/// pic : "publifVt-PuGcxCA0fs.jpg"
/// price : 2346
/// s_pic : "publ-PuGcxCA0fs.jpg_200x200.jpg"
/// title : "笔记本电脑"

class ProductItem {
  ProductItem({
      this.id, 
      this.cid, 
      this.oldPrice, 
      this.pic, 
      this.price, 
      this.sPic, 
      this.title,});

  ProductItem.fromJson(dynamic json) {
    id = json['_id'];
    cid = json['cid'];
    oldPrice = json['old_price'];
    pic = json['pic'];
    price = json['price'];
    sPic = json['s_pic'];
    title = json['title'];
  }
  String? id;
  String? cid;
  Object? oldPrice;
  String? pic;
  Object? price;
  String? sPic;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cid'] = cid;
    map['old_price'] = oldPrice;
    map['pic'] = pic;
    map['price'] = price;
    map['s_pic'] = sPic;
    map['title'] = title;
    return map;
  }

}