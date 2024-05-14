/// result : {"_id":"5a0425bc010e711234661439","attr":[{"cate":"鞋面材料","list":["牛皮 "]},{"cate":"闭合方式","list":["系带"]},{"cate":"颜色","list":["红色","白色","黄色"]}],"cid":"5a042480010e711234661436","cname":"男鞋","content":"content....","is_best":1,"is_hot":1,"is_new":1,"old_price":"968","pic":"publ7Ed-ocs_7W1DxYO.png","price":688,"salecount":275,"status":"1","sub_title":"非凡舒适,经久耐穿,融入飞翔元素,让你无论身处何处,都备受瞩目","title":"磨砂牛皮男休闲鞋-有属性"}

class ProductDetailModel {
  ProductDetailModel({
      this.result,});

  ProductDetailModel.fromJson(dynamic json) {
    result = json['result'] != null ? ProductDetailItem.fromJson(json['result']) : null;
  }
  ProductDetailItem? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }
}
/// _id : "5a0425bc010e711234661439"
/// attr : [{"cate":"鞋面材料","list":["牛皮 "]},{"cate":"闭合方式","list":["系带"]},{"cate":"颜色","list":["红色","白色","黄色"]}]
/// cid : "5a042480010e711234661436"
/// cname : "男鞋"
/// content : "content...."
/// is_best : 1
/// is_hot : 1
/// is_new : 1
/// old_price : "968"
/// pic : "publ7Ed-ocs_7W1DxYO.png"
/// price : 688
/// salecount : 275
/// status : "1"
/// sub_title : "非凡舒适,经久耐穿,融入飞翔元素,让你无论身处何处,都备受瞩目"
/// title : "磨砂牛皮男休闲鞋-有属性"

class ProductDetailItem {
  ProductDetailItem({
      this.id, 
      this.attr, 
      this.cid, 
      this.cname, 
      this.content, 
      this.isBest, 
      this.isHot, 
      this.isNew, 
      this.oldPrice, 
      this.pic, 
      this.price, 
      this.salecount, 
      this.status, 
      this.subTitle, 
      this.title,});

  ProductDetailItem.fromJson(dynamic json) {
    id = json['_id'];
    if (json['attr'] != null) {
      attr = [];
      json['attr'].forEach((v) {
        attr?.add(Attr.fromJson(v));
      });
    }
    cid = json['cid'];
    cname = json['cname'];
    content = json['content'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    oldPrice = json['old_price'];
    pic = json['pic'];
    price = json['price'];
    salecount = json['salecount'];
    status = json['status'];
    subTitle = json['sub_title'];
    title = json['title'];
  }
  String? id;
  List<Attr>? attr;
  String? cid;
  String? cname;
  String? content;
  Object? isBest;
  Object? isHot;
  Object? isNew;
  int? oldPrice;
  String? pic;
  Object? price;
  Object? salecount;
  Object? status;
  String? subTitle;
  String? title;
  //新增
  int count=1;
  String selectedAttr="";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (attr != null) {
      map['attr'] = attr?.map((v) => v.toJson()).toList();
    }
    map['cid'] = cid;
    map['cname'] = cname;
    map['content'] = content;
    map['is_best'] = isBest;
    map['is_hot'] = isHot;
    map['is_new'] = isNew;
    map['old_price'] = oldPrice;
    map['pic'] = pic;
    map['price'] = price;
    map['salecount'] = salecount;
    map['status'] = status;
    map['sub_title'] = subTitle;
    map['title'] = title;
    return map;
  }

}

/// cate : "鞋面材料"
/// list : ["牛皮 "]

class Attr {
  Attr({
      this.cate, 
      this.list,});

  Attr.fromJson(dynamic json) {
    cate = json['cate'];
    list = json['list'] != null ? json['list'].cast<String>() : [];
  }
  String? cate;
  List<String>? list;
  List<Map> attrList=[];   //自定义的attrList

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cate'] = cate;
    map['list'] = list;
    return map;
  }

}