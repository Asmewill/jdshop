import 'dart:convert';

/// result : [{"_id":"5a0425bc010e711234661439","cid":"5a042480010e711234661436","old_price":"968","pic":"s_7W1DxYO.png","price":688,"s_pic":"1DxYO.png_200x200.png","title":"磨砂牛皮男休闲鞋-有属性"},{"_id":"5a042682010e71123466143b","cid":"5a04261e010e71123466143a","old_price":"288","pic":"co6PYXWwhSrkPN.png","price":188,"s_pic":"PYXWwhSrkPN.png_200x200.png","title":"2V341DD7低靴皮带扣细跟中跟鞋"},{"_id":"5a042702010e71123466143c","cid":"5a0424b8010e711234661437","old_price":"499","pic":"nvzi2rNLq4k.png","price":399,"s_pic":".png_200x200.png","title":"茵曼2017冬装新款棒球罗纹领落肩袖丝绒保暖棉衣外套女"}]


class YouLikeModel {
  List<YouLikeItem>? _result;
  YouLikeModel({
    List<YouLikeItem>? result,
  }) {
    _result = result;
  }

  YouLikeModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(YouLikeItem.fromJson(v));
      });
    }
  }


  YouLikeModel copyWith({
    List<YouLikeItem>? result,
  }) =>
      YouLikeModel(
        result: result ?? _result,
      );

  List<YouLikeItem>? get result => _result;

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
/// pic : "s_7W1DxYO.png"
/// price : 688
/// s_pic : "1DxYO.png_200x200.png"
/// title : "磨砂牛皮男休闲鞋-有属性"

YouLikeItem resultFromJson(String str) => YouLikeItem.fromJson(json.decode(str));

String resultToJson(YouLikeItem data) => json.encode(data.toJson());

class YouLikeItem {
  YouLikeItem({
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

  YouLikeItem.fromJson(dynamic json) {
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

  YouLikeItem copyWith({
    String? id,
    String? cid,
    String? oldPrice,
    String? pic,
    num? price,
    String? sPic,
    String? title,
  }) =>
      YouLikeItem(
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
