import 'dart:convert';

/// result : [{"_id":"5a0425bc010e711234661439","cid":"5a042480010e711234661436","old_price":"968","pic":"Ed-ocs_7W1DxYO.png","price":688,"s_pic":"ocs_7W1DxYO.png_200x200.png","title":"磨砂牛皮男休闲鞋-有属性"}]



class RecomendModel {
  List<RecomendItem>? _result;

  RecomendModel({
    List<RecomendItem>? result,
  }) {
    _result = result;
  }

  RecomendModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(RecomendItem.fromJson(v));
      });
    }
  }
  RecomendModel copyWith({
    List<RecomendItem>? result,
  }) =>
      RecomendModel(
        result: result ?? _result,
      );

  List<RecomendItem>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "5a0425bc010e711234661439"
/// cid : "5a042480010e711234661436"
/// old_price : "968"
/// pic : "Ed-ocs_7W1DxYO.png"
/// price : 688
/// s_pic : "ocs_7W1DxYO.png_200x200.png"
/// title : "磨砂牛皮男休闲鞋-有属性"

RecomendItem resultFromJson(String str) =>
    RecomendItem.fromJson(json.decode(str));

String resultToJson(RecomendItem data) => json.encode(data.toJson());

class RecomendItem {
  RecomendItem({
    String? id,
    String? cid,
    String? oldPrice,
    String? pic,
    num? price,
    String? sPic,
    String? title,
  }) {
    _id = id;
    _cid = cid;
    _oldPrice = oldPrice;
    _pic = pic;
    _price = price;
    _sPic = sPic;
    _title = title;
  }

  RecomendItem.fromJson(dynamic json) {
    _id = json['_id'];
    _cid = json['cid'];
    _oldPrice = json['old_price'];
    _pic = json['pic'];
    _price = json['price'];
    _sPic = json['s_pic'];
    _title = json['title'];
  }

  String? _id;
  String? _cid;
  String? _oldPrice;
  String? _pic;
  num? _price;
  String? _sPic;
  String? _title;

  RecomendItem copyWith({
    String? id,
    String? cid,
    String? oldPrice,
    String? pic,
    num? price,
    String? sPic,
    String? title,
  }) =>
      RecomendItem(
        id: id ?? _id,
        cid: cid ?? _cid,
        oldPrice: oldPrice ?? _oldPrice,
        pic: pic ?? _pic,
        price: price ?? _price,
        sPic: sPic ?? _sPic,
        title: title ?? _title,
      );

  String? get id => _id;

  String? get cid => _cid;

  String? get oldPrice => _oldPrice;

  String? get pic => _pic;

  num? get price => _price;

  String? get sPic => _sPic;

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['cid'] = _cid;
    map['old_price'] = _oldPrice;
    map['pic'] = _pic;
    map['price'] = _price;
    map['s_pic'] = _sPic;
    map['title'] = _title;
    return map;
  }
}
